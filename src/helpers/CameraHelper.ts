export class CameraHelper {
    public static buildCameraPreviewUrl(c: string, ch: string) {
        const camera = Number(c);
        const channel = Number(ch);
        let url = "http://192.168.0." + String(180 + camera);
        if (channel !== 0) {
            url += ":6500" + String(channel);
        }
        url += "/ISAPI/Streaming/Channels/";
        if (channel !== 0) {
            url += String(channel) + "0";
        }
        url += "1/Picture";
        console.log(url);
        return url;
    }
}