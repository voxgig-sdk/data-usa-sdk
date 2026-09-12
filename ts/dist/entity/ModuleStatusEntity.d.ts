import { DataUsaEntityBase } from '../DataUsaEntityBase';
import type { DataUsaSDK } from '../DataUsaSDK';
import type { Control } from '../types';
import type { ModuleStatus, ModuleStatusLoadMatch } from '../DataUsaTypes';
declare class ModuleStatusEntity extends DataUsaEntityBase<ModuleStatus> {
    constructor(client: DataUsaSDK, entopts: any);
    make(this: ModuleStatusEntity): ModuleStatusEntity;
    load(this: any, reqmatch?: ModuleStatusLoadMatch, ctrl?: Control): Promise<ModuleStatusEntity>;
}
export { ModuleStatusEntity };
