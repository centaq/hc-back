import app from './app';
import * as https from 'https';
import * as http from 'http';
import * as fs from 'fs';
require('dotenv').config();

http.createServer(app).listen(process.env.CONF_HTTP_PORT, () => {
    console.log('Express HTTP ' + process.env.CONF_HTTP_PORT);
});

if (process.env.CONF_SSL_ENABLED == "true") {    
    const httpsOptions = {
        key: fs.readFileSync(process.env.CONF_SSL_KEY_PATH || ''),
        cert: fs.readFileSync(process.env.CONF_SSL_CERT_PATH || '')
    }

    https.createServer(httpsOptions, app).listen(process.env.CONF_HTTPS_PORT, () => {
        console.log('Express HTTPS ' + process.env.CONF_HTTPS_PORT);
    });
}
