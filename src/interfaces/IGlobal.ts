export interface IRequestSchema {
    state: ISensorsSchema;
    conf: string[];
}

export interface ISensorsSchema {
    [sensor:string]: ISensorSchema;
}

export interface ISensorSchema {
    [stats:string]: IStatsSchema;
    //stats: IStatsSchema[];
}

export interface IStatsSchema {
    hour_tick?: boolean;
    minute_tick?: boolean;
    resolution?: number; //points per hour, default 10?
    points?: number; //total number of points, default 20 ?
}

export interface ISession {
    id: string;
    expiry: Date;
}