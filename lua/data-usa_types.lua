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

---@class EconomicComplexityModule

---@class EconomicComplexityModuleLoadMatch
---@field extension? string
---@field endpoint? string

---@class Health

---@class HealthLoadMatch

---@class Member
---@field annotations table
---@field caption string
---@field name string
---@field type string

---@class MemberListMatch
---@field annotations? table
---@field caption? string
---@field name? string
---@field type? string

---@class ModuleStatus

---@class ModuleStatusLoadMatch

---@class RouteIndexGet

---@class RouteIndexGetLoadMatch

---@class TesseractCube
---@field annotations table
---@field caption string
---@field dimensions table
---@field measures table
---@field name string

---@class TesseractCubeLoadMatch
---@field id string

---@class TesseractModule
---@field joins? table
---@field pagination? table
---@field requests table

---@class TesseractModuleLoadMatch
---@field extension? string

---@class TesseractModuleCreateData
---@field extension string
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
---@field annotations? table
---@field caption? string
---@field dimensions? table
---@field measures? table
---@field name? string

local M = {}

return M
