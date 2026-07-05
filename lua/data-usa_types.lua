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
---@field extension string
---@field endpoint string

---@class Health

---@class HealthLoadMatch

---@class Member
---@field annotation table
---@field caption string
---@field name string
---@field type string

---@class MemberListMatch
---@field annotation? table
---@field caption? string
---@field name? string
---@field type? string

---@class ModuleStatus
---@field debug any
---@field module string
---@field status string
---@field version string

---@class ModuleStatusLoadMatch
---@field debug? any
---@field module? string
---@field status? string
---@field version? string

---@class RouteIndexGet

---@class RouteIndexGetLoadMatch

---@class TesseractCube
---@field annotation table
---@field caption string
---@field dimension table
---@field measure table
---@field name string

---@class TesseractCubeLoadMatch
---@field id string

---@class TesseractModule
---@field join? table
---@field pagination? table
---@field request table

---@class TesseractModuleLoadMatch
---@field extension string

---@class TesseractModuleCreateData
---@field extension string

---@class TesseractSchema
---@field annotation table
---@field caption string
---@field dimension table
---@field measure table
---@field name string

---@class TesseractSchemaListMatch
---@field annotation? table
---@field caption? string
---@field dimension? table
---@field measure? table
---@field name? string

local M = {}

return M
