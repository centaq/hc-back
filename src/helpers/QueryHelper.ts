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
        let query: string = 'date';
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
            query[q] = 'SELECT ' + query[q] + ' FROM ' + homeDefinition.stateTable + ' WHERE ' + where + ' AND minute_tick';
        }
        return query;
    }

    public static buildStatSql(key: string, stat: any): any { //statsy pod wartosciami
        const col = homeDefinition.translateToStateSql(key) + ' AS `val`';
        return this.buildStatsSqlInternal('state', stat, col, 1000);
    }

    public static buildStatsSql(keys: [string], stat: any, count: number): any {
        let col: string = 'date';
        let table: string = 'state';
        let containsAggr: boolean = false;
        for(let key of keys) { 
            let path: string[] = key.split('.');
            console.log(path);
            if (path.length > 2 && path[0] == 'avg' && path[1] == 'cd') {
                table = 'day_aggregation';
                containsAggr = true;
                col += ", " + path[2] + ' AS `' + key + '`';
            } else {
                col += ", " + key + ' AS `' + key + '`';
            }
        }
        return this.buildStatsSqlInternal(table, stat, col, count);
    }

    public static buildStatsCountSql(stat: any): string {
        let query = `SELECT COUNT(1) AS c FROM state WHERE ` + this.getStatsQueryWhereClause(stat.points, stat.period);
        console.log(query);
        return query;
    }

    private static buildStatsSqlInternal(table: string, stat: any, colsName: string, count: number): any {

        //where.push('`date` >= DATE_SUB(NOW(), INTERVAL ' + stat.period + ' HOUR)');
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
ORDER BY rownum`;*/
        let where = "";
        if (table == 'day_aggregation') {
            where = '`date` >= DATE_SUB(NOW(), INTERVAL ' + (stat.period + 1) + ' HOUR)';
        } else {
            where = this.getStatsQueryWhereClause(stat.points, stat.period + 1);
        }
        let points = stat.points;
        let period = stat.period;
        console.log(points);
        console.log(period);
        console.log(stat);
        console.log(colsName);

        let c = "";
        console.log(count);
        if (period > points || table == 'day_aggregation') {
            
            c = `SELECT ` + colsName + ` 
                FROM ` + table + ` 
                WHERE ` + where + ` 
                LIMIT ` + count ;
        } else {
            c = `SELECT ` + colsName + ` FROM (
                    SELECT ID,` + colsName + ` 
                    FROM ` + table + ` 
                    WHERE ` + where + `
                    ORDER BY ID DESC 
                    LIMIT ` + (count - 1) + `) AS c`;
            if (period >= 24) {
                c += ` WHERE minute(c.date) % 15 = 0`;
            } else if (period >= 6) {
                c += ` WHERE minute(c.date) % 5 = 0`;
            } 
            c += ` ORDER BY ID `;
        }
        /*let c = `(SELECT COUNT(1) FROM state
            WHERE 
                ` + where.join(' AND ') + `
            ) `;*/
        console.log(c);
        return c;
    }

    private static getStatsQueryWhereClause(points: number, period: number) : string {
        let where = [];
        if (period < 24) {
            where.push('`date` >= DATE_SUB(NOW(), INTERVAL ' + period + ' HOUR)');
        } else {
            where.push('`date_stamp` >= DATE_SUB(NOW(), INTERVAL ' + period + ' HOUR)');
        }
        if (period > points) {
            where.push('hour_tick');
        }
        else {
            where.push('minute_tick');
        }
        return where.join(' AND ');
    }
}