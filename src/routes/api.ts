import {Request, Response, NextFunction, Application} from "express";
import httpRequest from 'request';
import { FileStorage } from '../controllers/FileStorage';
import { Guid } from 'guid-typescript';
import { DataHandler } from '../controllers/DataHandler';
import { SessionHelper } from '../helpers/SessionHelper';
import { CameraHelper } from "../helpers/CameraHelper";

require('dotenv').config();

export class APIRoutes { 
    static configure(app : Application): void {
        app.all('/api/*', (req: Request, res: Response, next: NextFunction) => {
            const session = req.cookies.session;
            if (SessionHelper.isLogged(session)) {
                next();
            } else {
                res.status(403).end();
            }
        });

        app.route('/api/').get((req: Request, res: Response) => {
            res.status(200).send({
                message: 'GET request successfulll!!!!'
            })
        })

        app.route('/api/sensors/:level.:room.:sensor').get((req: Request, res: Response) => {
            res.status(200).send({params: req.params})
        })

        app.route('/api/data').post((req: Request, res: Response) => {
            const token: string = Guid.create().toString();
            FileStorage.save('tokens', token, req.body);
            res.status(200).send({token: token });
        });

        app.route('/api/data').get(async(req: Request, res: Response) => {
            const data = JSON.parse(req.query.data);
            let schemaBase = FileStorage.read('tokens', data.token);
            DataHandler.retrieve(schemaBase, data.stats, (result: any) => {
                res.status(200).send({params: data.token, value: result});
            });
        });

        app.route('/api/action').post(async(req: Request, res: Response) => {
            DataHandler.insertAction(req.body);
            res.status(200).send({result: 'OK'});
        });

        app.route('/api/stats').get(async(req: Request, res: Response) => {
            const data = JSON.parse(req.query.data)
            res.status(200).send(await DataHandler.getStats(data));
            
        });
        
        app.route('/api/camera/:no/:ch').get(async(req: Request, res: Response) => {
            httpRequest.get(CameraHelper.buildCameraPreviewUrl(req.params.no, req.params.ch))
            .auth(process.env.CONF_CAMERA_USER!, process.env.CONF_CAMERA_PASS!, false) //Digest auth
            .on('error', (err: any) => {
                console.log('error');
                console.log(err);
            })
            .pipe(res).on('close', () => {
                res.end();
            }).on('timeout', () => {
                console.log('timeout');
            }).on('error', (err: any) => {
                console.log('error');
                console.log(err);
            });
        });
    }
}