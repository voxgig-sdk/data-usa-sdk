# Typed models for the DataUsa SDK.
#
# GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
# params (op.<name>.points[].args.params[]). Field/param types come from the
# canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
# @voxgig/apidef VALID_CANON). Do not edit by hand.

from __future__ import annotations

from dataclasses import dataclass
from typing import Optional, Any


@dataclass
class CalculationsModule:
    pass


@dataclass
class CalculationsModuleLoadMatch:
    extension: str


@dataclass
class EconomicComplexityModule:
    pass


@dataclass
class EconomicComplexityModuleLoadMatch:
    extension: str
    endpoint: str


@dataclass
class Health:
    pass


@dataclass
class HealthLoadMatch:
    pass


@dataclass
class Member:
    annotation: dict
    caption: str
    name: str
    type: str


@dataclass
class MemberListMatch:
    annotation: Optional[dict] = None
    caption: Optional[str] = None
    name: Optional[str] = None
    type: Optional[str] = None


@dataclass
class ModuleStatus:
    debug: Any
    module: str
    status: str
    version: str


@dataclass
class ModuleStatusLoadMatch:
    debug: Optional[Any] = None
    module: Optional[str] = None
    status: Optional[str] = None
    version: Optional[str] = None


@dataclass
class RouteIndexGet:
    pass


@dataclass
class RouteIndexGetLoadMatch:
    pass


@dataclass
class TesseractCube:
    annotation: dict
    caption: str
    dimension: list
    measure: list
    name: str


@dataclass
class TesseractCubeLoadMatch:
    id: str


@dataclass
class TesseractModule:
    request: list
    join: Optional[list] = None
    pagination: Optional[dict] = None


@dataclass
class TesseractModuleLoadMatch:
    extension: str


@dataclass
class TesseractModuleCreateData:
    extension: str


@dataclass
class TesseractSchema:
    annotation: dict
    caption: str
    dimension: list
    measure: list
    name: str


@dataclass
class TesseractSchemaListMatch:
    annotation: Optional[dict] = None
    caption: Optional[str] = None
    dimension: Optional[list] = None
    measure: Optional[list] = None
    name: Optional[str] = None

