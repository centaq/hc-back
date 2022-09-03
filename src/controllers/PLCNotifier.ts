import * as net from 'net';
require('dotenv').config();

export class PLCNotifier {
    private static readonly client = new net.Socket()
        .on('close', PLCNotifier.onClose)
        .on('error', PLCNotifier.onError);

    static readonly config : any = {
        host: '192.168.0.201',//process.env.CONF_PLC_IP_ADDRESS,
        port: 3031 //process.env.CONF_PLC_NOTIFY_PORT
    }

    public static async notify(id: number) {
        console.log(this.config.host);
        console.log(this.config.port);
        this.client.connect(this.config.port, this.config.host, () => {
            console.log('Connected');
            const cmd : Uint8Array = new Uint8Array(2);
            cmd[0] = 2;
            cmd[1] = 1;
            this.client.write(cmd);
            this.client.end();
        }); 
    }

    public static onData(data: any) {
        console.log('Received: ' + data);
        this.client.destroy(); // kill client after server's response
    }

    public static onClose() {
        console.log('Connection closed');
    }

    public static onError(err: any) {
        console.log('err: ' + err);
        console.log(err);
    }
}
