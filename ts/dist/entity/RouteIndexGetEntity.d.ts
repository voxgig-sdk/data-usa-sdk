import { DataUsaEntityBase } from '../DataUsaEntityBase';
import type { DataUsaSDK } from '../DataUsaSDK';
import type { Control } from '../types';
import type { RouteIndexGet, RouteIndexGetLoadMatch } from '../DataUsaTypes';
declare class RouteIndexGetEntity extends DataUsaEntityBase<RouteIndexGet> {
    constructor(client: DataUsaSDK, entopts: any);
    make(this: RouteIndexGetEntity): RouteIndexGetEntity;
    load(this: any, reqmatch?: RouteIndexGetLoadMatch, ctrl?: Control): Promise<RouteIndexGetEntity>;
}
export { RouteIndexGetEntity };
