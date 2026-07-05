# frozen_string_literal: true

# Typed models for the DataUsa SDK.
#
# GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
# params (op.<name>.points[].args.params[]). Member types come from the
# canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
# @voxgig/apidef VALID_CANON). Ruby types are unenforced; these YARD
# annotations document the shapes. Do not edit by hand.

# CalculationsModule entity data model.
class CalculationsModule
end

# Request payload for CalculationsModule#load.
#
# @!attribute [rw] extension
#   @return [String]
CalculationsModuleLoadMatch = Struct.new(
  :extension,
  keyword_init: true
)

# EconomicComplexityModule entity data model.
class EconomicComplexityModule
end

# Request payload for EconomicComplexityModule#load.
#
# @!attribute [rw] extension
#   @return [String]
#
# @!attribute [rw] endpoint
#   @return [String]
EconomicComplexityModuleLoadMatch = Struct.new(
  :extension,
  :endpoint,
  keyword_init: true
)

# Health entity data model.
class Health
end

# Request payload for Health#load.
class HealthLoadMatch
end

# Member entity data model.
#
# @!attribute [rw] annotation
#   @return [Hash]
#
# @!attribute [rw] caption
#   @return [String]
#
# @!attribute [rw] name
#   @return [String]
#
# @!attribute [rw] type
#   @return [String]
Member = Struct.new(
  :annotation,
  :caption,
  :name,
  :type,
  keyword_init: true
)

# Request payload for Member#list.
#
# @!attribute [rw] annotation
#   @return [Hash, nil]
#
# @!attribute [rw] caption
#   @return [String, nil]
#
# @!attribute [rw] name
#   @return [String, nil]
#
# @!attribute [rw] type
#   @return [String, nil]
MemberListMatch = Struct.new(
  :annotation,
  :caption,
  :name,
  :type,
  keyword_init: true
)

# ModuleStatus entity data model.
#
# @!attribute [rw] debug
#   @return [Object]
#
# @!attribute [rw] module
#   @return [String]
#
# @!attribute [rw] status
#   @return [String]
#
# @!attribute [rw] version
#   @return [String]
ModuleStatus = Struct.new(
  :debug,
  :module,
  :status,
  :version,
  keyword_init: true
)

# Request payload for ModuleStatus#load.
#
# @!attribute [rw] debug
#   @return [Object, nil]
#
# @!attribute [rw] module
#   @return [String, nil]
#
# @!attribute [rw] status
#   @return [String, nil]
#
# @!attribute [rw] version
#   @return [String, nil]
ModuleStatusLoadMatch = Struct.new(
  :debug,
  :module,
  :status,
  :version,
  keyword_init: true
)

# RouteIndexGet entity data model.
class RouteIndexGet
end

# Request payload for RouteIndexGet#load.
class RouteIndexGetLoadMatch
end

# TesseractCube entity data model.
#
# @!attribute [rw] annotation
#   @return [Hash]
#
# @!attribute [rw] caption
#   @return [String]
#
# @!attribute [rw] dimension
#   @return [Array]
#
# @!attribute [rw] measure
#   @return [Array]
#
# @!attribute [rw] name
#   @return [String]
TesseractCube = Struct.new(
  :annotation,
  :caption,
  :dimension,
  :measure,
  :name,
  keyword_init: true
)

# Request payload for TesseractCube#load.
#
# @!attribute [rw] id
#   @return [String]
TesseractCubeLoadMatch = Struct.new(
  :id,
  keyword_init: true
)

# TesseractModule entity data model.
#
# @!attribute [rw] join
#   @return [Array, nil]
#
# @!attribute [rw] pagination
#   @return [Hash, nil]
#
# @!attribute [rw] request
#   @return [Array]
TesseractModule = Struct.new(
  :join,
  :pagination,
  :request,
  keyword_init: true
)

# Request payload for TesseractModule#load.
#
# @!attribute [rw] extension
#   @return [String]
TesseractModuleLoadMatch = Struct.new(
  :extension,
  keyword_init: true
)

# Request payload for TesseractModule#create.
#
# @!attribute [rw] extension
#   @return [String]
TesseractModuleCreateData = Struct.new(
  :extension,
  keyword_init: true
)

# TesseractSchema entity data model.
#
# @!attribute [rw] annotation
#   @return [Hash]
#
# @!attribute [rw] caption
#   @return [String]
#
# @!attribute [rw] dimension
#   @return [Array]
#
# @!attribute [rw] measure
#   @return [Array]
#
# @!attribute [rw] name
#   @return [String]
TesseractSchema = Struct.new(
  :annotation,
  :caption,
  :dimension,
  :measure,
  :name,
  keyword_init: true
)

# Request payload for TesseractSchema#list.
#
# @!attribute [rw] annotation
#   @return [Hash, nil]
#
# @!attribute [rw] caption
#   @return [String, nil]
#
# @!attribute [rw] dimension
#   @return [Array, nil]
#
# @!attribute [rw] measure
#   @return [Array, nil]
#
# @!attribute [rw] name
#   @return [String, nil]
TesseractSchemaListMatch = Struct.new(
  :annotation,
  :caption,
  :dimension,
  :measure,
  :name,
  keyword_init: true
)

