import { CalculationsModuleEntity } from './entity/CalculationsModuleEntity';
import { EconomicComplexityModuleEntity } from './entity/EconomicComplexityModuleEntity';
import { HealthEntity } from './entity/HealthEntity';
import { MemberEntity } from './entity/MemberEntity';
import { ModuleStatusEntity } from './entity/ModuleStatusEntity';
import { RouteIndexGetEntity } from './entity/RouteIndexGetEntity';
import { TesseractCubeEntity } from './entity/TesseractCubeEntity';
import { TesseractModuleEntity } from './entity/TesseractModuleEntity';
import { TesseractSchemaEntity } from './entity/TesseractSchemaEntity';
export type * from './DataUsaTypes';
import { inspect } from 'node:util';
import type { Context, Feature } from './types';
import { config } from './Config';
import { DataUsaEntityBase } from './DataUsaEntityBase';
import { Utility } from './utility/Utility';
import { BaseFeature } from './feature/base/BaseFeature';
declare const stdutil: Utility;
declare class DataUsaSDK {
    _mode: string;
    _options: any;
    _utility: Utility;
    _features: Feature[];
    _rootctx: Context;
    constructor(options?: any);
    options(): any;
    utility(): any;
    prepare(fetchargs?: any): Promise<any>;
    direct(fetchargs?: any): Promise<Error | {
        ok: boolean;
        status: number;
        headers: any;
        data: any;
        err?: undefined;
    } | {
        ok: boolean;
        err: any;
        status?: undefined;
        headers?: undefined;
        data?: undefined;
    }>;
    _rawRequest(fetchargs?: any): Promise<Error | {
        ok: boolean;
        status: number;
        headers: any;
        data: any;
        err?: undefined;
    } | {
        ok: boolean;
        err: any;
        status?: undefined;
        headers?: undefined;
        data?: undefined;
    }>;
    graphql(query: string, variables?: any, ctrl?: any): Promise<any>;
    CalculationsModule(entopts?: Record<string, any>): CalculationsModuleEntity;
    EconomicComplexityModule(entopts?: Record<string, any>): EconomicComplexityModuleEntity;
    Health(entopts?: Record<string, any>): HealthEntity;
    Member(entopts?: Record<string, any>): MemberEntity;
    ModuleStatus(entopts?: Record<string, any>): ModuleStatusEntity;
    RouteIndexGet(entopts?: Record<string, any>): RouteIndexGetEntity;
    TesseractCube(entopts?: Record<string, any>): TesseractCubeEntity;
    TesseractModule(entopts?: Record<string, any>): TesseractModuleEntity;
    TesseractSchema(entopts?: Record<string, any>): TesseractSchemaEntity;
    static test(testoptsarg?: any, sdkoptsarg?: any): DataUsaSDK;
    tester(testopts?: any, sdkopts?: any): DataUsaSDK;
    toJSON(): {
        name: string;
    };
    toString(): string;
    [inspect.custom](): string;
}
declare const SDK: typeof DataUsaSDK;
export { stdutil, config, BaseFeature, DataUsaEntityBase, DataUsaSDK, SDK, };
