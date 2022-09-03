import * as mysql from 'mysql';
require('dotenv').config();

export class SQLHelper {
    static readonly connString : mysql.ConnectionConfig = {
        host: process.env.CONF_DB_HOST,
        user: process.env.CONF_DB_USER,
        password: process.env.CONF_DB_PASS,
        database: process.env.CONF_DB_NAME
    }

    public static create() {
        return mysql.createConnection(this.connString);
    }
    
    public static async connect(conn: mysql.Connection) {
        return new Promise<void>(function(resolve, reject) {
            conn.connect(function(err) {
                if (err !== null) {
                    reject(err);
                } else {
                    resolve();
                }
            });
        });
    }

    public static async query(conn: mysql.Connection, param: string, values?: any) {
        return new Promise(function(resolve, reject) {
            conn.query(param, values, function(err, rows) {
                if (err !== null) {
                    reject(err);
                    console.log(err);
                } else {
                    resolve(rows);
                }
            });
        });
    }

    public static async end(conn: mysql.Connection) {
        return new Promise<void>(function(resolve, reject) {
            conn.end(function(err) {
                if (err !== undefined) {
                    reject(err);
                } else {
                    resolve();
                }
            });
        });
    }

    public static async executeQuery(param: string, values?: any) {
        let conn = SQLHelper.create();
        await SQLHelper.connect(conn);
        let result = await SQLHelper.query(conn, param, values);
        await SQLHelper.end(conn);
        conn.destroy();
        return result;
    }
}