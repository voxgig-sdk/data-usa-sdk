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
#   @return [String, nil]
#
# @!attribute [rw] endpoint
#   @return [String, nil]
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
# @!attribute [rw] annotations
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
  :annotations,
  :caption,
  :name,
  :type,
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
# @!attribute [rw] measures
#   @return [Array]
#
# @!attribute [rw] name
#   @return [String]
TesseractCube = Struct.new(
  :annotations,
  :caption,
  :dimensions,
  :measures,
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
#   @return [String, nil]
TesseractModuleLoadMatch = Struct.new(
  :extension,
  keyword_init: true
)

# Request payload for TesseractModule#create.
#
# @!attribute [rw] extension
#   @return [String]
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
# @!attribute [rw] annotations
#   @return [Hash, nil]
#
# @!attribute [rw] caption
#   @return [String, nil]
#
# @!attribute [rw] dimensions
#   @return [Array, nil]
#
# @!attribute [rw] measures
#   @return [Array, nil]
#
# @!attribute [rw] name
#   @return [String, nil]
TesseractSchemaListMatch = Struct.new(
  :annotations,
  :caption,
  :dimensions,
  :measures,
  :name,
  keyword_init: true
)

