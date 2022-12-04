import { homeDefinition } from '../homeDefinition';
import { IAggregationSchema, IAggregationsSchema, ISensorsSchema } from '../interfaces/IGlobal';
import { join } from 'path';

export class QueryHelper {
    

    public static buildSensorConfSql(confArr: string[]): any {
        let query: string = '';
        for(let conf of confArr) {
            if (query.length > 0) 
                query += ', ';
            query += homeDefinition.translateToConfSql(conf) + ' AS `c.' + conf + '`';
        }
        return 'SELECT ' + query + ' FROM ' + homeDefinition.confTable + ' ORDER BY ID DESC LIMIT 1';
    }

    public static buildSensorStateSql(schema: ISensorsSchema): any {
        let query: string = '';
        for(let key in schema) {
            if (query.length > 0) 
                query += ', ';
            query += homeDefinition.translateToStateSql(key) + ' AS `' + key + '`';
        }
        return 'SELECT ' + query + ' FROM ' + homeDefinition.stateTable + ' ORDER BY ID DESC LIMIT 1';
    }

    public static buildSensorAggrSql(schema: IAggregationsSchema): any {
        let query: { [key: string]: string } = {};
        for(let key in schema) {
            if (query[schema[key].selector] == undefined) 
                query[schema[key].selector] = '';
            else
                query[schema[key].selector] += ', ';
            let k = schema[key].type + '.' + schema[key].selector + '.' + key;
            query[schema[key].selector] += homeDefinition.translateToAggrSql(key, schema[key].type) + ' AS `' + k + '`';
        }
        for (let q in query) {
            let where = '0=1';
            if (q == 'cd') 
                where = 'date_stamp = CURDATE()';
            query[q] = 'SELECT ' + query[q] + ' FROM ' + homeDefinition.stateTable + ' WHERE ' + where;
        }
        return query;
    }

    public static buildStatSql(key: string, stat: any): any {
        const col = homeDefinition.translateToStateSql(key) + ' AS `val`';
        return this.buildStatsSqlInternal(stat, col, "val");
    }

    public static buildStatsSql(keys: [string], stat: any): any {
        let col: string = 'date';
        for(let key of keys) {
            //col += ", " + homeDefinition.previousRecord(key, 1) + ' AS `' + key + '`';
            col += ", " + key + ' AS `' + key + '`';
        }
        return this.buildStatsSqlInternal(stat, col, 'date,' + keys.join(","));
    }

    private static buildStatsSqlInternal(stat: any, cols: string, colsName: string): any {
        let where = [];
        let points = stat.points;
        let period = stat.period;
        if (period > points) {
            where.push('hour_tick = 1');
        }
        else {
            period *= 60;
            where.push('minute_tick = 1');
        }
        where.push('`date` >= DATE_SUB(NOW(), INTERVAL ' + stat.period + ' HOUR)');
        /*if (stat.type == 'minute') { 
            where.push('minute_tick = 1');
        } else if (stat.type == 'hour') {
            where.push('hour_tick = 1');
        }
        if (period <= points) {
            const divider = period*60/points;
            where.push('minute_tick = 1 AND MINUTE(`date`) % ' + divider + ' = MINUTE(CURDATE()) % ' + divider);
        } else {
            const divider = period/points;
            where.push('hour_tick = 1 AND HOUR(`date`) % ' + divider + ' = HOUR(CURDATE()) % ' + divider);
        }*/
        //TODO raczej trzeba dodać ograniczenie czasowe wynikające z wybranego zakresu - pytanie tylko czy naprawdę to potrzebne
        //czy to samo nie powinno wyjść z określonych punktów ?
        //Ale moze będzie szybciej jakby na date założyć indeks i wtedy wyfiltrowywać ?
        /* return 'SELECT ' + colsName + ' FROM ( ' +
            'SELECT ID, ' + cols + ' FROM state WHERE ' + where.join(' AND ') + ' ORDER BY ID DESC LIMIT ' + points +
            ') AS s ORDER BY ID';
*/
        let c = `SELECT ` + colsName + ` FROM (
            SELECT 
                @row := @row + 1 AS rownum, 
                ` + cols + `
            FROM 
                (SELECT @row:=0)r, state
            WHERE 
                ` + where.join(' AND ') + `
            ORDER BY ID 
        ) numbered
        WHERE 
            (rownum % GREATEST(1, FLOOR((SELECT COUNT(1) FROM state WHERE ` + where.join(' AND ') + `)/60))) = 0
        ORDER BY rownum`;
        return c;
    }
}