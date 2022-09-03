
import { Guid } from 'guid-typescript';
import { ISession } from '../interfaces/IGlobal';
import { FileStorage } from '../controllers/FileStorage';

export class SessionHelper {
    public static create(): ISession {
        let date: Date = new Date();
        date.setDate(date.getDate() + 365);
        
        let session: string = Guid.create().toString();
        let sessionData: ISession = {
            id: session,
            expiry: date
        };
        FileStorage.save('sessions', session, sessionData);
        return sessionData;
    }
    public static isLogged(session: string): boolean {
        if (session == undefined) {
            return false;
        }

        let sessionData = FileStorage.read('sessions', session);
        if (sessionData == undefined) {
            return false;
        }
        const expiry: Date = new Date(sessionData.expiry);
        let result = false;
        if (sessionData != undefined && expiry.getTime() > Date.now()) {
            result = true;
        }
        return result;
    }
}