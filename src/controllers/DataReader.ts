export class DataReader {
    public static parseRequest(req: any): any {
        let response : any = {};

        for(let key in req) {
            const val = req[key];
            let tmp : any = {};
            for(let inkey in val) {
                const inval = val[inkey];
                tmp[inkey] = { data: Math.round(Math.random()*1000) / 10, stats: undefined };
            }
            response[key] = tmp;
        }
        return response;
    }
}