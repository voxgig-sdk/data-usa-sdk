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


class CalculationsModuleLoadMatch(TypedDict):
    extension: str


class EconomicComplexityModule(TypedDict):
    pass


class EconomicComplexityModuleLoadMatch(TypedDict):
    extension: str
    endpoint: str


class Health(TypedDict):
    pass


class HealthLoadMatch(TypedDict):
    pass


class Member(TypedDict):
    annotation: dict
    caption: str
    name: str
    type: str


class MemberListMatch(TypedDict, total=False):
    annotation: dict
    caption: str
    name: str
    type: str


class ModuleStatus(TypedDict):
    debug: Any
    module: str
    status: str
    version: str


class ModuleStatusLoadMatch(TypedDict, total=False):
    debug: Any
    module: str
    status: str
    version: str


class RouteIndexGet(TypedDict):
    pass


class RouteIndexGetLoadMatch(TypedDict):
    pass


class TesseractCube(TypedDict):
    annotation: dict
    caption: str
    dimension: list
    measure: list
    name: str


class TesseractCubeLoadMatch(TypedDict):
    id: str


class TesseractModuleRequired(TypedDict):
    request: list


class TesseractModule(TesseractModuleRequired, total=False):
    join: list
    pagination: dict


class TesseractModuleLoadMatch(TypedDict):
    extension: str


class TesseractModuleCreateData(TypedDict):
    extension: str


class TesseractSchema(TypedDict):
    annotation: dict
    caption: str
    dimension: list
    measure: list
    name: str


class TesseractSchemaListMatch(TypedDict, total=False):
    annotation: dict
    caption: str
    dimension: list
    measure: list
    name: str
