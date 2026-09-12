import { DataUsaEntityBase } from '../DataUsaEntityBase';
import type { DataUsaSDK } from '../DataUsaSDK';
import type { Control } from '../types';
import type { CalculationsModule, CalculationsModuleLoadMatch } from '../DataUsaTypes';
declare class CalculationsModuleEntity extends DataUsaEntityBase<CalculationsModule> {
    constructor(client: DataUsaSDK, entopts: any);
    make(this: CalculationsModuleEntity): CalculationsModuleEntity;
    load(this: any, reqmatch?: CalculationsModuleLoadMatch, ctrl?: Control): Promise<CalculationsModuleEntity>;
}
export { CalculationsModuleEntity };
