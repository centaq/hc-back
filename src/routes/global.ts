import {Application} from "express";
var cookieParser = require('cookie-parser');
import { WebRoutes } from './web';
import { APIRoutes } from './api';

export class GlobalRoutes { 
    
    static configure(app : Application): void {
        app.use(cookieParser());

        WebRoutes.configure(app);
        APIRoutes.configure(app);
    }
}