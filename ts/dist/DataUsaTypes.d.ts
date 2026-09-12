export interface CalculationsModule {
}
export interface CalculationsModuleLoadMatch {
    extension: string;
    filter?: string;
    param: Record<string, any>;
    token?: string;
    top?: string;
}
export interface EconomicComplexityModule {
}
export interface EconomicComplexityModuleLoadMatch {
    endpoint: string;
}
export interface Health {
}
export interface HealthLoadMatch {
}
export interface Member {
    annotations: Record<string, any>;
    caption: string;
    name: string;
    type: string;
}
export interface MemberListMatch {
    cube: string;
    level: string;
    limit?: string;
    locale?: any;
    parent?: boolean;
    search?: string;
    token?: string;
}
export interface ModuleStatus {
}
export interface ModuleStatusLoadMatch {
}
export interface RouteIndexGet {
}
export interface RouteIndexGetLoadMatch {
}
export interface TesseractCube {
    annotations: Record<string, any>;
    caption: string;
    dimensions: any[];
    id?: string;
    measures: any[];
    name: string;
}
export interface TesseractCubeLoadMatch {
    id: string;
    locale?: any;
    token?: string;
}
export interface TesseractModule {
    joins?: any[];
    pagination?: Record<string, any>;
    requests: any[];
}
export interface TesseractModuleLoadMatch {
    extension: string;
    alias?: any;
    cube: string;
    drilldown: string;
    exclude?: string;
    filter?: any[];
    growth?: any;
    include?: string;
    limit?: string;
    locale?: any;
    measure: string;
    parent?: string;
    property?: any;
    ranking?: string;
    sort?: string;
    time?: any;
    token?: string;
    top?: any;
}
export interface TesseractModuleCreateData {
    extension: string;
    token?: string;
    joins?: any[];
    pagination?: Record<string, any>;
    requests: any[];
}
export interface TesseractSchema {
    annotations: Record<string, any>;
    caption: string;
    dimensions: any[];
    measures: any[];
    name: string;
}
export interface TesseractSchemaListMatch {
    locale?: any;
    token?: string;
}
