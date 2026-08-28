// Typed models for the DataUsa SDK.
//
// GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
// params (op.<name>.points[].args.params[]). Field/param types come from the
// canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
// @voxgig/apidef VALID_CANON). Do not edit by hand.
package entity

import (
	"encoding/json"

	"github.com/voxgig-sdk/data-usa-sdk/go/core"
)

// CalculationsModule is the typed data model for the calculations_module entity.
type CalculationsModule struct {
}

// CalculationsModuleLoadMatch is the typed request payload for CalculationsModule.LoadTyped.
type CalculationsModuleLoadMatch struct {
	Extension string `json:"extension"`
	Filter *string `json:"filter,omitempty"`
	Param map[string]any `json:"param"`
	Token *string `json:"token,omitempty"`
	Top *string `json:"top,omitempty"`
}

// EconomicComplexityModule is the typed data model for the economic_complexity_module entity.
type EconomicComplexityModule struct {
}

// EconomicComplexityModuleLoadMatch is the typed request payload for EconomicComplexityModule.LoadTyped.
type EconomicComplexityModuleLoadMatch struct {
	Endpoint string `json:"endpoint"`
}

// Health is the typed data model for the health entity.
type Health struct {
}

// HealthLoadMatch is the typed request payload for Health.LoadTyped.
type HealthLoadMatch struct {
}

// Member is the typed data model for the member entity.
type Member struct {
	Annotations map[string]any `json:"annotations"`
	Caption string `json:"caption"`
	Name string `json:"name"`
	Type string `json:"type"`
}

// MemberListMatch is the typed request payload for Member.ListTyped.
type MemberListMatch struct {
	Cube string `json:"cube"`
	Level string `json:"level"`
	Limit *string `json:"limit,omitempty"`
	Locale *any `json:"locale,omitempty"`
	Parent *bool `json:"parent,omitempty"`
	Search *string `json:"search,omitempty"`
	Token *string `json:"token,omitempty"`
}

// ModuleStatus is the typed data model for the module_status entity.
type ModuleStatus struct {
}

// ModuleStatusLoadMatch is the typed request payload for ModuleStatus.LoadTyped.
type ModuleStatusLoadMatch struct {
}

// RouteIndexGet is the typed data model for the route_index_get entity.
type RouteIndexGet struct {
}

// RouteIndexGetLoadMatch is the typed request payload for RouteIndexGet.LoadTyped.
type RouteIndexGetLoadMatch struct {
}

// TesseractCube is the typed data model for the tesseract_cube entity.
type TesseractCube struct {
	Annotations map[string]any `json:"annotations"`
	Caption string `json:"caption"`
	Dimensions []any `json:"dimensions"`
	Id *string `json:"id,omitempty"`
	Measures []any `json:"measures"`
	Name string `json:"name"`
}

// TesseractCubeLoadMatch is the typed request payload for TesseractCube.LoadTyped.
type TesseractCubeLoadMatch struct {
	Id string `json:"id"`
	Locale *any `json:"locale,omitempty"`
	Token *string `json:"token,omitempty"`
}

// TesseractModule is the typed data model for the tesseract_module entity.
type TesseractModule struct {
	Joins *[]any `json:"joins,omitempty"`
	Pagination *map[string]any `json:"pagination,omitempty"`
	Requests []any `json:"requests"`
}

// TesseractModuleLoadMatch is the typed request payload for TesseractModule.LoadTyped.
type TesseractModuleLoadMatch struct {
	Extension string `json:"extension"`
	Alias *any `json:"alias,omitempty"`
	Cube string `json:"cube"`
	Drilldown string `json:"drilldown"`
	Exclude *string `json:"exclude,omitempty"`
	Filter *[]any `json:"filter,omitempty"`
	Growth *any `json:"growth,omitempty"`
	Include *string `json:"include,omitempty"`
	Limit *string `json:"limit,omitempty"`
	Locale *any `json:"locale,omitempty"`
	Measure string `json:"measure"`
	Parent *string `json:"parent,omitempty"`
	Property *any `json:"property,omitempty"`
	Ranking *string `json:"ranking,omitempty"`
	Sort *string `json:"sort,omitempty"`
	Time *any `json:"time,omitempty"`
	Token *string `json:"token,omitempty"`
	Top *any `json:"top,omitempty"`
}

// TesseractModuleCreateData is the typed request payload for TesseractModule.CreateTyped.
type TesseractModuleCreateData struct {
	Extension string `json:"extension"`
	Token *string `json:"token,omitempty"`
	Joins *[]any `json:"joins,omitempty"`
	Pagination *map[string]any `json:"pagination,omitempty"`
	Requests []any `json:"requests"`
}

// TesseractSchema is the typed data model for the tesseract_schema entity.
type TesseractSchema struct {
	Annotations map[string]any `json:"annotations"`
	Caption string `json:"caption"`
	Dimensions []any `json:"dimensions"`
	Measures []any `json:"measures"`
	Name string `json:"name"`
}

// TesseractSchemaListMatch is the typed request payload for TesseractSchema.ListTyped.
type TesseractSchemaListMatch struct {
	Locale *any `json:"locale,omitempty"`
	Token *string `json:"token,omitempty"`
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

// entityData unwraps an entity to its data map.
//
// Operations resolve to the ENTITY, not the raw data (see AGENTS.md), and an
// entity's fields are UNEXPORTED — marshalling one directly yields `{}`, so
// every typed accessor would silently hand back a zero-valued struct. The
// typed boundary therefore takes the data hop first.
func entityData(v any) any {
	if ent, ok := v.(core.Entity); ok {
		return ent.Data()
	}
	return v
}

// typedFrom decodes a runtime value (an entity, or the map[string]any the op
// pipeline produced) into a typed model T via a JSON round-trip. On any error
// it returns the zero value of T; the op's own (value, error) tuple carries
// the real error.
func typedFrom[T any](v any) T {
	var out T
	v = entityData(v)
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

// typedSliceFrom decodes a runtime list value into a typed slice []T via a
// JSON round-trip, for list ops. `list` resolves to a slice of ENTITY
// instances, so each element takes the data hop.
func typedSliceFrom[T any](v any) []T {
	var out []T
	if v == nil {
		return out
	}
	if list, ok := v.([]any); ok {
		unwrapped := make([]any, 0, len(list))
		for _, item := range list {
			unwrapped = append(unwrapped, entityData(item))
		}
		v = unwrapped
	}
	b, err := json.Marshal(v)
	if err != nil {
		return out
	}
	_ = json.Unmarshal(b, &out)
	return out
}
