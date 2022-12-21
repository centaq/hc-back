
import { Guid } from 'guid-typescript';
import { IIsLoggedResult, ISession } from '../interfaces/IGlobal';
import { FileStorage } from '../controllers/FileStorage';

export class SessionHelper {
    public static create(user: string): ISession {
        let date: Date = new Date();
        date.setDate(date.getDate() + 365);
        
        let session: string = Guid.create().toString();
        let sessionData: ISession = {
            id: session,
            expiry: date,
            user: user
        };
        FileStorage.save('sessions', session, sessionData);
        return sessionData;
    }

    public static isLogged(session: string): IIsLoggedResult {
        if (session == undefined) {
            return {
                result: false
            };
        }

        let sessionData = FileStorage.read('sessions', session);
        if (sessionData == undefined) {
            return {
                result: false
            };
        }
        const expiry: Date = new Date(sessionData.expiry);
        if (sessionData != undefined && expiry.getTime() > Date.now()) {
            return {
                result: true,
                session: sessionData
            };
        }
        return {
            result: false
        };
    }
}