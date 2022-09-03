import {Request, Response, NextFunction, Application} from "express";
import httpRequest from 'request';
import { FileStorage } from '../controllers/FileStorage';
import { Guid } from 'guid-typescript';
import { DataHandler } from '../controllers/DataHandler';
import { SessionHelper } from '../helpers/SessionHelper';

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
        
        app.route('/api/camera/:no').get(async(req: Request, res: Response) => {
            let ip = 180 + Number(req.params.no);
            var uri = 'http://user:pass@192.168.0.' + String(ip) + '/ISAPI/Streaming/Channels/1/Picture';
            /*httpRequest.get(uri)
            .on('error', function(err : any) {
              console.log(err)
            }).pipe(res).on('close', () => {
                res.end();
            }).on('timeout', () => {
                console.log('timeout');
            });*/
            httpRequest.head(uri, { timeout: 10000}, function(err :any, res1: any, body:any ){
                if (err) {
                    //console.log(uri);
                    console.log(err);
                    console.log(res1);
                    console.log(body);
                    res.status(400);
                    res.end();
                } else {
                    res.contentType('image/jpeg');
                    res.status(200);
                    //console.log(res1);
                    httpRequest(uri).pipe(res).on('close', () => {
                        res.end();
                    }).on('timeout', () => {
                        console.log('timeout');
                    });
                }
            }).on('error', function(err : any) {
                alert('Błąd - otwórz consolę');
                console.log('on error');
                console.log(err);
            });
        });
    }
}