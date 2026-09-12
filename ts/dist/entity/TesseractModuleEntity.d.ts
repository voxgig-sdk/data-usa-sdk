import { DataUsaEntityBase } from '../DataUsaEntityBase';
import type { DataUsaSDK } from '../DataUsaSDK';
import type { Control } from '../types';
import type { TesseractModule, TesseractModuleLoadMatch, TesseractModuleCreateData } from '../DataUsaTypes';
declare class TesseractModuleEntity extends DataUsaEntityBase<TesseractModule> {
    constructor(client: DataUsaSDK, entopts: any);
    make(this: TesseractModuleEntity): TesseractModuleEntity;
    load(this: any, reqmatch?: TesseractModuleLoadMatch, ctrl?: Control): Promise<TesseractModuleEntity>;
    create(this: any, reqdata?: TesseractModuleCreateData, ctrl?: Control): Promise<TesseractModuleEntity>;
}
export { TesseractModuleEntity };
