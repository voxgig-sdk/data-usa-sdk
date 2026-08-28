# Typed models for the DataUsa SDK.
#
# GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
# params (op.<name>.points[].args.params[]). Field/param types come from the
# canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
# @voxgig/apidef VALID_CANON). Do not edit by hand.
#
# These are TypedDicts, not dataclasses: the SDK ops return/accept plain dicts
# at runtime, and a TypedDict IS a dict shape, so the types match the runtime.
# Optional (req:false) keys are modelled as TypedDict key-optionality
# (total=False), split into a required base + total=False subclass when a type
# has both required and optional keys.

from __future__ import annotations

from typing import TypedDict, Any


class CalculationsModule(TypedDict):
    pass


class CalculationsModuleLoadMatchRequired(TypedDict):
    extension: str
    param: dict


class CalculationsModuleLoadMatch(CalculationsModuleLoadMatchRequired, total=False):
    filter: str
    token: str
    top: str


class EconomicComplexityModule(TypedDict):
    pass


class EconomicComplexityModuleLoadMatch(TypedDict):
    endpoint: str


class Health(TypedDict):
    pass


class HealthLoadMatch(TypedDict):
    pass


class Member(TypedDict):
    annotations: dict
    caption: str
    name: str
    type: str


class MemberListMatchRequired(TypedDict):
    cube: str
    level: str


class MemberListMatch(MemberListMatchRequired, total=False):
    limit: str
    locale: Any
    parent: bool
    search: str
    token: str


class ModuleStatus(TypedDict):
    pass


class ModuleStatusLoadMatch(TypedDict):
    pass


class RouteIndexGet(TypedDict):
    pass


class RouteIndexGetLoadMatch(TypedDict):
    pass


class TesseractCubeRequired(TypedDict):
    annotations: dict
    caption: str
    dimensions: list
    measures: list
    name: str


class TesseractCube(TesseractCubeRequired, total=False):
    id: str


class TesseractCubeLoadMatchRequired(TypedDict):
    id: str


class TesseractCubeLoadMatch(TesseractCubeLoadMatchRequired, total=False):
    locale: Any
    token: str


class TesseractModuleRequired(TypedDict):
    requests: list


class TesseractModule(TesseractModuleRequired, total=False):
    joins: list
    pagination: dict


class TesseractModuleLoadMatchRequired(TypedDict):
    extension: str
    cube: str
    drilldown: str
    measure: str


class TesseractModuleLoadMatch(TesseractModuleLoadMatchRequired, total=False):
    alias: Any
    exclude: str
    filter: list
    growth: Any
    include: str
    limit: str
    locale: Any
    parent: str
    property: Any
    ranking: str
    sort: str
    time: Any
    token: str
    top: Any


class TesseractModuleCreateDataRequired(TypedDict):
    extension: str
    requests: list


class TesseractModuleCreateData(TesseractModuleCreateDataRequired, total=False):
    token: str
    joins: list
    pagination: dict


class TesseractSchema(TypedDict):
    annotations: dict
    caption: str
    dimensions: list
    measures: list
    name: str


class TesseractSchemaListMatch(TypedDict, total=False):
    locale: Any
    token: str
