import {Request, Response, NextFunction, Application} from "express";
import { ISession } from '../interfaces/IGlobal';
import { Guid } from 'guid-typescript';
import { FileStorage } from '../controllers/FileStorage';
import { SessionHelper } from '../helpers/SessionHelper';

export class WebRoutes { 
    static configure(app : Application): void {
        app.route('/web/logged').all((req: Request, res: Response) => {
            res.status(200).send(
                SessionHelper.isLogged(req.cookies.session)
            );
        });

        app.route('/web/logout').all((req: Request, res: Response) => {
            res.clearCookie('session');
            res.status(200).end();
        });

        app.route('/web/login').all((req: Request, res: Response) => {
            const params = req.body;
            if(true) {
                const session: ISession = SessionHelper.create(params.user);
                res.cookie('session', session.id, { expires: session.expiry });
                res.status(200).send({
                    result: true,
                    session: session
                });
            } else {
                console.log('nok');
                res.status(403).end();
            }
        });
    }

}