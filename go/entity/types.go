// Typed models for the DataUsa SDK.
//
// GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
// params (op.<name>.points[].args.params[]). Field/param types come from the
// canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
// @voxgig/apidef VALID_CANON). Do not edit by hand.
package entity

import "encoding/json"

// CalculationsModule is the typed data model for the calculations_module entity.
type CalculationsModule struct {
}

// CalculationsModuleLoadMatch is the typed request payload for CalculationsModule.LoadTyped.
type CalculationsModuleLoadMatch struct {
	Extension string `json:"extension"`
}

// EconomicComplexityModule is the typed data model for the economic_complexity_module entity.
type EconomicComplexityModule struct {
}

// EconomicComplexityModuleLoadMatch is the typed request payload for EconomicComplexityModule.LoadTyped.
type EconomicComplexityModuleLoadMatch struct {
	Extension string `json:"extension"`
	Endpoint string `json:"endpoint"`
}

// Health is the typed data model for the health entity.
type Health struct {
}

// HealthLoadMatch mirrors the health fields as an all-optional match
// filter (Go analog of Partial<Health>).
type HealthLoadMatch struct {
}

// Member is the typed data model for the member entity.
type Member struct {
	Annotation map[string]any `json:"annotation"`
	Caption string `json:"caption"`
	Name string `json:"name"`
	Type string `json:"type"`
}

// MemberListMatch mirrors the member fields as an all-optional match
// filter (Go analog of Partial<Member>).
type MemberListMatch struct {
	Annotation *map[string]any `json:"annotation,omitempty"`
	Caption *string `json:"caption,omitempty"`
	Name *string `json:"name,omitempty"`
	Type *string `json:"type,omitempty"`
}

// ModuleStatus is the typed data model for the module_status entity.
type ModuleStatus struct {
	Debug any `json:"debug"`
	Module string `json:"module"`
	Status string `json:"status"`
	Version string `json:"version"`
}

// ModuleStatusLoadMatch mirrors the module_status fields as an all-optional match
// filter (Go analog of Partial<ModuleStatus>).
type ModuleStatusLoadMatch struct {
	Debug *any `json:"debug,omitempty"`
	Module *string `json:"module,omitempty"`
	Status *string `json:"status,omitempty"`
	Version *string `json:"version,omitempty"`
}

// RouteIndexGet is the typed data model for the route_index_get entity.
type RouteIndexGet struct {
}

// RouteIndexGetLoadMatch mirrors the route_index_get fields as an all-optional match
// filter (Go analog of Partial<RouteIndexGet>).
type RouteIndexGetLoadMatch struct {
}

// TesseractCube is the typed data model for the tesseract_cube entity.
type TesseractCube struct {
	Annotation map[string]any `json:"annotation"`
	Caption string `json:"caption"`
	Dimension []any `json:"dimension"`
	Measure []any `json:"measure"`
	Name string `json:"name"`
}

// TesseractCubeLoadMatch is the typed request payload for TesseractCube.LoadTyped.
type TesseractCubeLoadMatch struct {
	Id string `json:"id"`
}

// TesseractModule is the typed data model for the tesseract_module entity.
type TesseractModule struct {
	Join *[]any `json:"join,omitempty"`
	Pagination *map[string]any `json:"pagination,omitempty"`
	Request []any `json:"request"`
}

// TesseractModuleLoadMatch is the typed request payload for TesseractModule.LoadTyped.
type TesseractModuleLoadMatch struct {
	Extension string `json:"extension"`
}

// TesseractModuleCreateData is the typed request payload for TesseractModule.CreateTyped.
type TesseractModuleCreateData struct {
	Extension string `json:"extension"`
}

// TesseractSchema is the typed data model for the tesseract_schema entity.
type TesseractSchema struct {
	Annotation map[string]any `json:"annotation"`
	Caption string `json:"caption"`
	Dimension []any `json:"dimension"`
	Measure []any `json:"measure"`
	Name string `json:"name"`
}

// TesseractSchemaListMatch mirrors the tesseract_schema fields as an all-optional match
// filter (Go analog of Partial<TesseractSchema>).
type TesseractSchemaListMatch struct {
	Annotation *map[string]any `json:"annotation,omitempty"`
	Caption *string `json:"caption,omitempty"`
	Dimension *[]any `json:"dimension,omitempty"`
	Measure *[]any `json:"measure,omitempty"`
	Name *string `json:"name,omitempty"`
}

// asMap turns a typed request/data struct into the map[string]any the
// runtime op pipeline consumes, honouring the json tags above.
func asMap(v any) map[string]any {
	out := map[string]any{}
	b, err := json.Marshal(v)
	if err != nil {
		return out
	}
	_ = json.Unmarshal(b, &out)
	return out
}

// typedFrom decodes a runtime value (a map[string]any produced by the op
// pipeline) into a typed model T via a JSON round-trip. On any error it
// returns the zero value of T; the op's own (value, error) tuple carries the
// real error.
func typedFrom[T any](v any) T {
	var out T
	if v == nil {
		return out
	}
	b, err := json.Marshal(v)
	if err != nil {
		return out
	}
	_ = json.Unmarshal(b, &out)
	return out
}

// typedSliceFrom decodes a runtime list value ([]any of maps) into a typed
// slice []T via a JSON round-trip, for list ops.
func typedSliceFrom[T any](v any) []T {
	var out []T
	if v == nil {
		return out
	}
	b, err := json.Marshal(v)
	if err != nil {
		return out
	}
	_ = json.Unmarshal(b, &out)
	return out
}
