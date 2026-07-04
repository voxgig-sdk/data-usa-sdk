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
  extension: string
  endpoint: string
}

export interface Health {
}

export type HealthLoadMatch = Partial<Health>

export interface Member {
  annotation: Record<string, any>
  caption: string
  name: string
  type: string
}

export type MemberListMatch = Partial<Member>

export interface ModuleStatus {
  debug: any
  module: string
  status: string
  version: string
}

export type ModuleStatusLoadMatch = Partial<ModuleStatus>

export interface RouteIndexGet {
}

export type RouteIndexGetLoadMatch = Partial<RouteIndexGet>

export interface TesseractCube {
  annotation: Record<string, any>
  caption: string
  dimension: any[]
  measure: any[]
  name: string
}

export interface TesseractCubeLoadMatch {
  id: string
}

export interface TesseractModule {
  join?: any[]
  pagination?: Record<string, any>
  request: any[]
}

export interface TesseractModuleLoadMatch {
  extension: string
}

export interface TesseractModuleCreateData {
  extension: string
}

export interface TesseractSchema {
  annotation: Record<string, any>
  caption: string
  dimension: any[]
  measure: any[]
  name: string
}

export type TesseractSchemaListMatch = Partial<TesseractSchema>

