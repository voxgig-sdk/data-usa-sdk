-- Typed models for the DataUsa SDK (LuaLS annotations).
--
-- GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
-- params (op.<name>.points[].args.params[]). Field/param types come from the
-- canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
-- @voxgig/apidef VALID_CANON). Annotations only — no runtime effect. Do not
-- edit by hand.

---@class CalculationsModule

---@class CalculationsModuleLoadMatch
---@field extension string
---@field filter? string
---@field param table
---@field token? string
---@field top? string

---@class EconomicComplexityModule

---@class EconomicComplexityModuleLoadMatch
---@field endpoint string

---@class Health

---@class HealthLoadMatch

---@class Member
---@field annotations table
---@field caption string
---@field name string
---@field type string

---@class MemberListMatch
---@field cube string
---@field level string
---@field limit? string
---@field locale? any
---@field parent? boolean
---@field search? string
---@field token? string

---@class ModuleStatus

---@class ModuleStatusLoadMatch

---@class RouteIndexGet

---@class RouteIndexGetLoadMatch

---@class TesseractCube
---@field annotations table
---@field caption string
---@field dimensions table
---@field id? string
---@field measures table
---@field name string

---@class TesseractCubeLoadMatch
---@field id string
---@field locale? any
---@field token? string

---@class TesseractModule
---@field joins? table
---@field pagination? table
---@field requests table

---@class TesseractModuleLoadMatch
---@field extension string
---@field alias? any
---@field cube string
---@field drilldown string
---@field exclude? string
---@field filter? table
---@field growth? any
---@field include? string
---@field limit? string
---@field locale? any
---@field measure string
---@field parent? string
---@field property? any
---@field ranking? string
---@field sort? string
---@field time? any
---@field token? string
---@field top? any

---@class TesseractModuleCreateData
---@field extension string
---@field token? string
---@field joins? table
---@field pagination? table
---@field requests table

---@class TesseractSchema
---@field annotations table
---@field caption string
---@field dimensions table
---@field measures table
---@field name string

---@class TesseractSchemaListMatch
---@field locale? any
---@field token? string

local M = {}

return M
