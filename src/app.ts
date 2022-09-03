import express from "express";
var path = require('path');
import * as bodyParser from "body-parser";
import { GlobalRoutes } from "./routes/global";
import { FileStorage } from './controllers/FileStorage';

var storage = require('node-persist');

class App {
    public app: express.Application = express();

    constructor() {
        storage.init();
        this.config();
        this.dirSetup();
        GlobalRoutes.configure(this.app);
    }

    private config(): void{
        this.app.use(bodyParser.json());
        this.app.use(bodyParser.urlencoded({ extended: false }));
        
        this.app.get('/', (req, res) => {
            res.sendFile(__dirname + '/public/', 'index.html');
        });
        
        this.app.use('/', express.static(__dirname + '/public'));
    }

    private dirSetup(): void{
        FileStorage.createDir('sessions');
        FileStorage.createDir('tokens');
    }
}
export default new App().app;
