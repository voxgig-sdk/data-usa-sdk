<?php
declare(strict_types=1);

// Typed models for the DataUsa SDK.
//
// GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
// params (op.<name>.points[].args.params[]). Field/param types come from the
// canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
// @voxgig/apidef VALID_CANON). Do not edit by hand.
//
// These are documentation-grade value objects (PHP 8 typed properties),
// registered on the composer classmap autoload. The SDK boundary exchanges
// assoc-arrays; these classes name the shapes for tooling and typed callers.

/** CalculationsModule entity data model. */
class CalculationsModule
{
}

/** Request payload for CalculationsModule#load. */
class CalculationsModuleLoadMatch
{
    public string $extension;
    public ?string $filter = null;
    public array $param;
    public ?string $token = null;
    public ?string $top = null;
}

/** EconomicComplexityModule entity data model. */
class EconomicComplexityModule
{
}

/** Request payload for EconomicComplexityModule#load. */
class EconomicComplexityModuleLoadMatch
{
    public string $endpoint;
}

/** Health entity data model. */
class Health
{
}

/** Request payload for Health#load. */
class HealthLoadMatch
{
}

/** Member entity data model. */
class Member
{
    public array $annotations;
    public string $caption;
    public string $name;
    public string $type;
}

/** Request payload for Member#list. */
class MemberListMatch
{
    public string $cube;
    public string $level;
    public ?string $limit = null;
    public mixed $locale = null;
    public ?bool $parent = null;
    public ?string $search = null;
    public ?string $token = null;
}

/** ModuleStatus entity data model. */
class ModuleStatus
{
}

/** Request payload for ModuleStatus#load. */
class ModuleStatusLoadMatch
{
}

/** RouteIndexGet entity data model. */
class RouteIndexGet
{
}

/** Request payload for RouteIndexGet#load. */
class RouteIndexGetLoadMatch
{
}

/** TesseractCube entity data model. */
class TesseractCube
{
    public array $annotations;
    public string $caption;
    public array $dimensions;
    public ?string $id = null;
    public array $measures;
    public string $name;
}

/** Request payload for TesseractCube#load. */
class TesseractCubeLoadMatch
{
    public string $id;
    public mixed $locale = null;
    public ?string $token = null;
}

/** TesseractModule entity data model. */
class TesseractModule
{
    public ?array $joins = null;
    public ?array $pagination = null;
    public array $requests;
}

/** Request payload for TesseractModule#load. */
class TesseractModuleLoadMatch
{
    public string $extension;
    public mixed $alias = null;
    public string $cube;
    public string $drilldown;
    public ?string $exclude = null;
    public ?array $filter = null;
    public mixed $growth = null;
    public ?string $include = null;
    public ?string $limit = null;
    public mixed $locale = null;
    public string $measure;
    public ?string $parent = null;
    public mixed $property = null;
    public ?string $ranking = null;
    public ?string $sort = null;
    public mixed $time = null;
    public ?string $token = null;
    public mixed $top = null;
}

/** Request payload for TesseractModule#create. */
class TesseractModuleCreateData
{
    public string $extension;
    public ?string $token = null;
    public ?array $joins = null;
    public ?array $pagination = null;
    public array $requests;
}

/** TesseractSchema entity data model. */
class TesseractSchema
{
    public array $annotations;
    public string $caption;
    public array $dimensions;
    public array $measures;
    public string $name;
}

/** Request payload for TesseractSchema#list. */
class TesseractSchemaListMatch
{
    public mixed $locale = null;
    public ?string $token = null;
}

