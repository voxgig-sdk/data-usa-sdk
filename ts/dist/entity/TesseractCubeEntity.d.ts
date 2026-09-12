import { DataUsaEntityBase } from '../DataUsaEntityBase';
import type { DataUsaSDK } from '../DataUsaSDK';
import type { Control } from '../types';
import type { TesseractCube, TesseractCubeLoadMatch } from '../DataUsaTypes';
declare class TesseractCubeEntity extends DataUsaEntityBase<TesseractCube> {
    constructor(client: DataUsaSDK, entopts: any);
    make(this: TesseractCubeEntity): TesseractCubeEntity;
    load(this: any, reqmatch?: TesseractCubeLoadMatch, ctrl?: Control): Promise<TesseractCubeEntity>;
}
export { TesseractCubeEntity };
