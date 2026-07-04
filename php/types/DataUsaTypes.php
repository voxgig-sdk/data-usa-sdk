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
}

/** EconomicComplexityModule entity data model. */
class EconomicComplexityModule
{
}

/** Request payload for EconomicComplexityModule#load. */
class EconomicComplexityModuleLoadMatch
{
    public string $extension;
    public string $endpoint;
}

/** Health entity data model. */
class Health
{
}

/** Match filter for Health#load (any subset of Health fields). */
class HealthLoadMatch
{
}

/** Member entity data model. */
class Member
{
    public array $annotation;
    public string $caption;
    public string $name;
    public string $type;
}

/** Match filter for Member#list (any subset of Member fields). */
class MemberListMatch
{
    public ?array $annotation = null;
    public ?string $caption = null;
    public ?string $name = null;
    public ?string $type = null;
}

/** ModuleStatus entity data model. */
class ModuleStatus
{
    public mixed $debug;
    public string $module;
    public string $status;
    public string $version;
}

/** Match filter for ModuleStatus#load (any subset of ModuleStatus fields). */
class ModuleStatusLoadMatch
{
    public mixed $debug = null;
    public ?string $module = null;
    public ?string $status = null;
    public ?string $version = null;
}

/** RouteIndexGet entity data model. */
class RouteIndexGet
{
}

/** Match filter for RouteIndexGet#load (any subset of RouteIndexGet fields). */
class RouteIndexGetLoadMatch
{
}

/** TesseractCube entity data model. */
class TesseractCube
{
    public array $annotation;
    public string $caption;
    public array $dimension;
    public array $measure;
    public string $name;
}

/** Request payload for TesseractCube#load. */
class TesseractCubeLoadMatch
{
    public string $id;
}

/** TesseractModule entity data model. */
class TesseractModule
{
    public ?array $join = null;
    public ?array $pagination = null;
    public array $request;
}

/** Request payload for TesseractModule#load. */
class TesseractModuleLoadMatch
{
    public string $extension;
}

/** Request payload for TesseractModule#create. */
class TesseractModuleCreateData
{
    public string $extension;
}

/** TesseractSchema entity data model. */
class TesseractSchema
{
    public array $annotation;
    public string $caption;
    public array $dimension;
    public array $measure;
    public string $name;
}

/** Match filter for TesseractSchema#list (any subset of TesseractSchema fields). */
class TesseractSchemaListMatch
{
    public ?array $annotation = null;
    public ?string $caption = null;
    public ?array $dimension = null;
    public ?array $measure = null;
    public ?string $name = null;
}

