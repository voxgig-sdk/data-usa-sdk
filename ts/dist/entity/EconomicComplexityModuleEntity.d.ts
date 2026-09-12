import { DataUsaEntityBase } from '../DataUsaEntityBase';
import type { DataUsaSDK } from '../DataUsaSDK';
import type { Control } from '../types';
import type { EconomicComplexityModule, EconomicComplexityModuleLoadMatch } from '../DataUsaTypes';
declare class EconomicComplexityModuleEntity extends DataUsaEntityBase<EconomicComplexityModule> {
    constructor(client: DataUsaSDK, entopts: any);
    make(this: EconomicComplexityModuleEntity): EconomicComplexityModuleEntity;
    load(this: any, reqmatch?: EconomicComplexityModuleLoadMatch, ctrl?: Control): Promise<EconomicComplexityModuleEntity>;
}
export { EconomicComplexityModuleEntity };
