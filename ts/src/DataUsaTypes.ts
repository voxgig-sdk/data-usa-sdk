// Typed models for the DataUsa SDK.
//
// GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
// params (op.<name>.points[].args.params[]). Field/param types come from the
// canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
// @voxgig/apidef VALID_CANON). Do not edit by hand.

export interface CalculationsModule {
}

export interface CalculationsModuleLoadMatch {
  extension: string
}

export interface EconomicComplexityModule {
}

export interface EconomicComplexityModuleLoadMatch {
  extension?: string
  endpoint?: string
}

export interface Health {
}

export interface HealthLoadMatch {
}

export interface Member {
  annotations: Record<string, any>
  caption: string
  name: string
  type: string
}

export interface MemberListMatch {
  annotations?: Record<string, any>
  caption?: string
  name?: string
  type?: string
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
  annotations: Record<string, any>
  caption: string
  dimensions: any[]
  measures: any[]
  name: string
}

export interface TesseractCubeLoadMatch {
  id: string
}

export interface TesseractModule {
  joins?: any[]
  pagination?: Record<string, any>
  requests: any[]
}

export interface TesseractModuleLoadMatch {
  extension?: string
}

export interface TesseractModuleCreateData {
  extension: string
  joins?: any[]
  pagination?: Record<string, any>
  requests: any[]
}

export interface TesseractSchema {
  annotations: Record<string, any>
  caption: string
  dimensions: any[]
  measures: any[]
  name: string
}

export interface TesseractSchemaListMatch {
  annotations?: Record<string, any>
  caption?: string
  dimensions?: any[]
  measures?: any[]
  name?: string
}

