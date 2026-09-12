import { DataUsaEntityBase } from '../DataUsaEntityBase';
import type { DataUsaSDK } from '../DataUsaSDK';
import type { Control } from '../types';
import type { TesseractSchema, TesseractSchemaListMatch } from '../DataUsaTypes';
declare class TesseractSchemaEntity extends DataUsaEntityBase<TesseractSchema> {
    constructor(client: DataUsaSDK, entopts: any);
    make(this: TesseractSchemaEntity): TesseractSchemaEntity;
    list(this: any, reqmatch?: TesseractSchemaListMatch, ctrl?: Control): Promise<TesseractSchemaEntity[]>;
}
export { TesseractSchemaEntity };
