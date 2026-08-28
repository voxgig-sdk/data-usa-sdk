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
#
# @!attribute [rw] filter
#   @return [String, nil]
#
# @!attribute [rw] param
#   @return [Hash]
#
# @!attribute [rw] token
#   @return [String, nil]
#
# @!attribute [rw] top
#   @return [String, nil]
CalculationsModuleLoadMatch = Struct.new(
  :extension,
  :filter,
  :param,
  :token,
  :top,
  keyword_init: true
)

# EconomicComplexityModule entity data model.
class EconomicComplexityModule
end

# Request payload for EconomicComplexityModule#load.
#
# @!attribute [rw] endpoint
#   @return [String]
EconomicComplexityModuleLoadMatch = Struct.new(
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
# @!attribute [rw] annotations
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
  :annotations,
  :caption,
  :name,
  :type,
  keyword_init: true
)

# Request payload for Member#list.
#
# @!attribute [rw] cube
#   @return [String]
#
# @!attribute [rw] level
#   @return [String]
#
# @!attribute [rw] limit
#   @return [String, nil]
#
# @!attribute [rw] locale
#   @return [Object, nil]
#
# @!attribute [rw] parent
#   @return [Boolean, nil]
#
# @!attribute [rw] search
#   @return [String, nil]
#
# @!attribute [rw] token
#   @return [String, nil]
MemberListMatch = Struct.new(
  :cube,
  :level,
  :limit,
  :locale,
  :parent,
  :search,
  :token,
  keyword_init: true
)

# ModuleStatus entity data model.
class ModuleStatus
end

# Request payload for ModuleStatus#load.
class ModuleStatusLoadMatch
end

# RouteIndexGet entity data model.
class RouteIndexGet
end

# Request payload for RouteIndexGet#load.
class RouteIndexGetLoadMatch
end

# TesseractCube entity data model.
#
# @!attribute [rw] annotations
#   @return [Hash]
#
# @!attribute [rw] caption
#   @return [String]
#
# @!attribute [rw] dimensions
#   @return [Array]
#
# @!attribute [rw] id
#   @return [String, nil]
#
# @!attribute [rw] measures
#   @return [Array]
#
# @!attribute [rw] name
#   @return [String]
TesseractCube = Struct.new(
  :annotations,
  :caption,
  :dimensions,
  :id,
  :measures,
  :name,
  keyword_init: true
)

# Request payload for TesseractCube#load.
#
# @!attribute [rw] id
#   @return [String]
#
# @!attribute [rw] locale
#   @return [Object, nil]
#
# @!attribute [rw] token
#   @return [String, nil]
TesseractCubeLoadMatch = Struct.new(
  :id,
  :locale,
  :token,
  keyword_init: true
)

# TesseractModule entity data model.
#
# @!attribute [rw] joins
#   @return [Array, nil]
#
# @!attribute [rw] pagination
#   @return [Hash, nil]
#
# @!attribute [rw] requests
#   @return [Array]
TesseractModule = Struct.new(
  :joins,
  :pagination,
  :requests,
  keyword_init: true
)

# Request payload for TesseractModule#load.
#
# @!attribute [rw] extension
#   @return [String]
#
# @!attribute [rw] alias
#   @return [Object, nil]
#
# @!attribute [rw] cube
#   @return [String]
#
# @!attribute [rw] drilldown
#   @return [String]
#
# @!attribute [rw] exclude
#   @return [String, nil]
#
# @!attribute [rw] filter
#   @return [Array, nil]
#
# @!attribute [rw] growth
#   @return [Object, nil]
#
# @!attribute [rw] include
#   @return [String, nil]
#
# @!attribute [rw] limit
#   @return [String, nil]
#
# @!attribute [rw] locale
#   @return [Object, nil]
#
# @!attribute [rw] measure
#   @return [String]
#
# @!attribute [rw] parent
#   @return [String, nil]
#
# @!attribute [rw] property
#   @return [Object, nil]
#
# @!attribute [rw] ranking
#   @return [String, nil]
#
# @!attribute [rw] sort
#   @return [String, nil]
#
# @!attribute [rw] time
#   @return [Object, nil]
#
# @!attribute [rw] token
#   @return [String, nil]
#
# @!attribute [rw] top
#   @return [Object, nil]
TesseractModuleLoadMatch = Struct.new(
  :extension,
  :alias,
  :cube,
  :drilldown,
  :exclude,
  :filter,
  :growth,
  :include,
  :limit,
  :locale,
  :measure,
  :parent,
  :property,
  :ranking,
  :sort,
  :time,
  :token,
  :top,
  keyword_init: true
)

# Request payload for TesseractModule#create.
#
# @!attribute [rw] extension
#   @return [String]
#
# @!attribute [rw] token
#   @return [String, nil]
#
# @!attribute [rw] joins
#   @return [Array, nil]
#
# @!attribute [rw] pagination
#   @return [Hash, nil]
#
# @!attribute [rw] requests
#   @return [Array]
TesseractModuleCreateData = Struct.new(
  :extension,
  :token,
  :joins,
  :pagination,
  :requests,
  keyword_init: true
)

# TesseractSchema entity data model.
#
# @!attribute [rw] annotations
#   @return [Hash]
#
# @!attribute [rw] caption
#   @return [String]
#
# @!attribute [rw] dimensions
#   @return [Array]
#
# @!attribute [rw] measures
#   @return [Array]
#
# @!attribute [rw] name
#   @return [String]
TesseractSchema = Struct.new(
  :annotations,
  :caption,
  :dimensions,
  :measures,
  :name,
  keyword_init: true
)

# Request payload for TesseractSchema#list.
#
# @!attribute [rw] locale
#   @return [Object, nil]
#
# @!attribute [rw] token
#   @return [String, nil]
TesseractSchemaListMatch = Struct.new(
  :locale,
  :token,
  keyword_init: true
)

