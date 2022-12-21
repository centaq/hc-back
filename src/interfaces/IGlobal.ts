export interface IRequestSchema {
    state: ISensorsSchema;
    conf: string[];
    aggr: IAggregationsSchema;
}

export interface ISensorsSchema {
    [sensor:string]: ISensorSchema;
}

export interface IAggregationsSchema {
    [sensor:string]: IAggregationSchema;
}

export interface ISensorSchema {
    [stats:string]: IStatsSchema;
    //stats: IStatsSchema[];
}

export interface IAggregationSchema {
    type: string;
    selector: string;
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
    user: string;
}

export interface IIsLoggedResult {
    result: boolean;
    session?: ISession;
}