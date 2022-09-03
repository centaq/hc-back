import { ISensorsSchema, ISensorSchema } from '../interfaces/IGlobal';
import { homeDefinition } from '../homeDefinition';
import { PLCNotifier } from './PLCNotifier';
import { QueryHelper } from '../helpers/QueryHelper';
import { SQLHelper } from '../helpers/SQLHelper';

export class DataHandler {

    public static async retrieve(req: any, stats: boolean, callback: (data: any) => void) {
        let schema: ISensorsSchema = this.parseRequest(req);
        let data = await this.retrieveData(schema, stats).catch((reason: any) => {
            console.log('err');
            console.log(reason);
        });
        let result = this.prepareResult(req, data);
        callback(result);
    }

    public static async insertAction(req: IStateChange) {
        console.log("insertAction");
        var param: any[] = [];
        console.log(req);
        if (req.type !== undefined) {
            if (req.type == "light")
                param.push(1);
            else if (req.type == "led") 
                param.push(2);
            else if (req.type == "blind_up") 
                param.push(3);
            else if (req.type == "blind_down") 
                param.push(4);
            param.push(0);
            param.push(req.sensor);
        } else {
            var data = req.sensor.split(".");
            data.forEach(el => {
                param.push(parseInt(el));
            });
        }
        param.push(req.cmd);
        param.push(req.value);
        console.log(param);
        
        let tmp : any = await SQLHelper.executeQuery('INSERT INTO action_queue (floor, room, sensor, cmd, value) VALUES (?,?,?,?,?)', param);
        var id = tmp.insertId;
        await PLCNotifier.notify(id);
    }

    public static parseRequest(request: any): ISensorsSchema {
        let schema : ISensorsSchema = {};

        for(let ctrlUid in request) {
            const ctrl = request[ctrlUid];
            let tmp : any = {};
            for(let sensorId in ctrl.sensors) {
                const sensor = ctrl.sensors[sensorId];
                if (!(sensorId in schema)) {
                    schema[sensorId] = {};
                }
                if (sensor.stats) {
                    schema[sensorId][ctrlUid] = sensor.statsConfig;
                }
            }
        }
        return schema;
    }

    private static prepareResult(request: any, data: any): any {
        let result: any = {};
        for(let ctrlUid in request) {
            const ctrl = request[ctrlUid];
            let tmp : any = {};
            for(let sensor in ctrl.sensors) {
                let d = Math.round(Math.random() * 1000) / 10;
                let stats;
                if (data !== undefined) {
                    d = data[sensor].data;
                    stats = data[sensor].stats[ctrlUid];
                }
                tmp[sensor] = { data: d, stats: stats };
            }
            result[ctrlUid] = {
                sensors: tmp
            }
        }
        return result;
    }

    public static async getStats(param: any) {
        let data: any = [];
        const stat = {period: param.period, points: 60};
        let tmp = await SQLHelper.executeQuery(QueryHelper.buildStatsSql(param.stats, stat));
        return {data: tmp, guid: param.guid};
    }

    private static async retrieveData(schema: ISensorsSchema, stats: boolean) {
        let data: any = {};
        if (Object.keys(schema).length == 0) {
            return data;
        }
        let conn = SQLHelper.create();
        await SQLHelper.connect(conn);
        let tmp: any = (<any>(await SQLHelper.query(conn, QueryHelper.buildSensorSql(schema))))[0];
        for(let index in tmp) {
            let d = tmp[index];
            data[index] = { data: d, stats: {}};
        }
        if (stats) {
            for(let sensor in schema) {
                for(let index in schema[sensor]) {
                    const stat = schema[sensor][index];
                    data[sensor].stats[index] = 
                        this.parseStats(await SQLHelper.query(conn, QueryHelper.buildStatSql(sensor, stat)));;
                }
            }
        }
        await SQLHelper.end(conn);
        conn.destroy();
        return data;
    }

    private static parseStats(data: any): any {
        let res: any = [];
        for(let rec of data) {
            res.push(rec['val']);
        }
        return res;
    }

}

export interface IStateChange {
    type?: string;
    sensor: string;
    cmd: number;
    value?: number;
}