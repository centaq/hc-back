import fs = require('fs');

export class FileStorage {
    public static save(type: string, token: string, data: any) {
        fs.writeFileSync('./' + type + '/' + token, JSON.stringify(data));
    }

    public static read(type: string, token: string): any {
        const path = './' + type + '/' + token;
        if (fs.existsSync(path)) {
            let data = fs.readFileSync(path);
            return JSON.parse(data.toString());
        }
        return undefined;
    }

    public static createDir(type: string) {
        const path: string = './' + type + '/';
        if (!fs.existsSync(path)) {
            fs.mkdirSync(path);
        }
    }
}