# DataUsa Golang SDK Reference

Complete API reference for the DataUsa Golang SDK.


## DataUsaSDK

### Constructor

```go
func NewDataUsaSDK(options map[string]any) *DataUsaSDK
```

Create a new SDK client instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `options` | `map[string]any` | SDK configuration options. |
| `options["base"]` | `string` | Base URL for API requests. |
| `options["prefix"]` | `string` | URL prefix appended after base. |
| `options["suffix"]` | `string` | URL suffix appended after path. |
| `options["headers"]` | `map[string]any` | Custom headers for all requests. |
| `options["feature"]` | `map[string]any` | Feature configuration. |
| `options["system"]` | `map[string]any` | System overrides (e.g. custom fetch). |


### Static Methods

#### `Test() *DataUsaSDK`

No-arg convenience constructor for the common no-options test case.

```go
client := sdk.Test()
```

#### `TestSDK(testopts, sdkopts map[string]any) *DataUsaSDK`

Test client with options. Both arguments may be `nil`.

```go
client := sdk.TestSDK(testopts, sdkopts)
```


### Instance Methods

#### `CalculationsModule(data map[string]any) DataUsaEntity`

Create a new `CalculationsModule` entity instance. Pass `nil` for no initial data.

#### `EconomicComplexityModule(data map[string]any) DataUsaEntity`

Create a new `EconomicComplexityModule` entity instance. Pass `nil` for no initial data.

#### `Health(data map[string]any) DataUsaEntity`

Create a new `Health` entity instance. Pass `nil` for no initial data.

#### `Member(data map[string]any) DataUsaEntity`

Create a new `Member` entity instance. Pass `nil` for no initial data.

#### `ModuleStatus(data map[string]any) DataUsaEntity`

Create a new `ModuleStatus` entity instance. Pass `nil` for no initial data.

#### `RouteIndexGet(data map[string]any) DataUsaEntity`

Create a new `RouteIndexGet` entity instance. Pass `nil` for no initial data.

#### `TesseractCube(data map[string]any) DataUsaEntity`

Create a new `TesseractCube` entity instance. Pass `nil` for no initial data.

#### `TesseractModule(data map[string]any) DataUsaEntity`

Create a new `TesseractModule` entity instance. Pass `nil` for no initial data.

#### `TesseractSchema(data map[string]any) DataUsaEntity`

Create a new `TesseractSchema` entity instance. Pass `nil` for no initial data.

#### `OptionsMap() map[string]any`

Return a deep copy of the current SDK options.

#### `GetUtility() *Utility`

Return a copy of the SDK utility object.

#### `Direct(fetchargs map[string]any) (map[string]any, error)`

Make a direct HTTP request to any API endpoint.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `fetchargs["path"]` | `string` | URL path with optional `{param}` placeholders. |
| `fetchargs["method"]` | `string` | HTTP method (default: `"GET"`). |
| `fetchargs["params"]` | `map[string]any` | Path parameter values for `{param}` substitution. |
| `fetchargs["query"]` | `map[string]any` | Query string parameters. |
| `fetchargs["headers"]` | `map[string]any` | Request headers (merged with defaults). |
| `fetchargs["body"]` | `any` | Request body (maps are JSON-serialized). |
| `fetchargs["ctrl"]` | `map[string]any` | Control options (e.g. `map[string]any{"explain": true}`). |

**Returns:** `(map[string]any, error)`

#### `Prepare(fetchargs map[string]any) (map[string]any, error)`

Prepare a fetch definition without sending the request. Accepts the
same parameters as `Direct()`.

**Returns:** `(map[string]any, error)`


---

## CalculationsModuleEntity

```go
calculationsModule := client.CalculationsModule(nil)
fmt.Println(calculationsModule.GetName()) // "calculations_module"
```

### Operations

#### `Load(reqmatch, ctrl map[string]any) (any, error)`

Load a single entity matching the given criteria.

```go
result, err := client.CalculationsModule(nil).Load(map[string]any{"extension": "extension"}, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```

### Common Methods

#### `Data(args ...any) any`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `Match(args ...any) any`

Get or set the entity match criteria. Works the same as `Data()`.

#### `Make() Entity`

Create a new `CalculationsModuleEntity` instance with the same client and
options.

#### `GetName() string`

Return the entity name.


---

## EconomicComplexityModuleEntity

```go
economicComplexityModule := client.EconomicComplexityModule(nil)
fmt.Println(economicComplexityModule.GetName()) // "economic_complexity_module"
```

### Operations

#### `Load(reqmatch, ctrl map[string]any) (any, error)`

Load a single entity matching the given criteria.

```go
result, err := client.EconomicComplexityModule(nil).Load(nil, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```

### Common Methods

#### `Data(args ...any) any`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `Match(args ...any) any`

Get or set the entity match criteria. Works the same as `Data()`.

#### `Make() Entity`

Create a new `EconomicComplexityModuleEntity` instance with the same client and
options.

#### `GetName() string`

Return the entity name.


---

## HealthEntity

```go
health := client.Health(nil)
fmt.Println(health.GetName()) // "health"
```

### Operations

#### `Load(reqmatch, ctrl map[string]any) (any, error)`

Load a single entity matching the given criteria.

```go
result, err := client.Health(nil).Load(nil, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```

### Common Methods

#### `Data(args ...any) any`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `Match(args ...any) any`

Get or set the entity match criteria. Works the same as `Data()`.

#### `Make() Entity`

Create a new `HealthEntity` instance with the same client and
options.

#### `GetName() string`

Return the entity name.


---

## MemberEntity

```go
member := client.Member(nil)
fmt.Println(member.GetName()) // "member"
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `annotation` | `map[string]any` | Yes |  |
| `caption` | `string` | Yes |  |
| `name` | `string` | Yes |  |
| `type` | `string` | Yes |  |

### Operations

#### `List(reqmatch, ctrl map[string]any) (any, error)`

List entities matching the given criteria. Returns an array.

```go
results, err := client.Member(nil).List(nil, nil)
if err != nil {
    panic(err)
}
fmt.Println(results)
```

### Common Methods

#### `Data(args ...any) any`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `Match(args ...any) any`

Get or set the entity match criteria. Works the same as `Data()`.

#### `Make() Entity`

Create a new `MemberEntity` instance with the same client and
options.

#### `GetName() string`

Return the entity name.


---

## ModuleStatusEntity

```go
moduleStatus := client.ModuleStatus(nil)
fmt.Println(moduleStatus.GetName()) // "module_status"
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `debug` | `any` | Yes |  |
| `module` | `string` | Yes |  |
| `status` | `string` | Yes |  |
| `version` | `string` | Yes |  |

### Operations

#### `Load(reqmatch, ctrl map[string]any) (any, error)`

Load a single entity matching the given criteria.

```go
result, err := client.ModuleStatus(nil).Load(nil, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```

### Common Methods

#### `Data(args ...any) any`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `Match(args ...any) any`

Get or set the entity match criteria. Works the same as `Data()`.

#### `Make() Entity`

Create a new `ModuleStatusEntity` instance with the same client and
options.

#### `GetName() string`

Return the entity name.


---

## RouteIndexGetEntity

```go
routeIndexGet := client.RouteIndexGet(nil)
fmt.Println(routeIndexGet.GetName()) // "route_index_get"
```

### Operations

#### `Load(reqmatch, ctrl map[string]any) (any, error)`

Load a single entity matching the given criteria.

```go
result, err := client.RouteIndexGet(nil).Load(nil, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```

### Common Methods

#### `Data(args ...any) any`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `Match(args ...any) any`

Get or set the entity match criteria. Works the same as `Data()`.

#### `Make() Entity`

Create a new `RouteIndexGetEntity` instance with the same client and
options.

#### `GetName() string`

Return the entity name.


---

## TesseractCubeEntity

```go
tesseractCube := client.TesseractCube(nil)
fmt.Println(tesseractCube.GetName()) // "tesseract_cube"
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `annotation` | `map[string]any` | Yes |  |
| `caption` | `string` | Yes |  |
| `dimension` | `[]any` | Yes |  |
| `measure` | `[]any` | Yes |  |
| `name` | `string` | Yes |  |

### Operations

#### `Load(reqmatch, ctrl map[string]any) (any, error)`

Load a single entity matching the given criteria.

```go
result, err := client.TesseractCube(nil).Load(map[string]any{"id": "tesseract_cube_id"}, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```

### Common Methods

#### `Data(args ...any) any`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `Match(args ...any) any`

Get or set the entity match criteria. Works the same as `Data()`.

#### `Make() Entity`

Create a new `TesseractCubeEntity` instance with the same client and
options.

#### `GetName() string`

Return the entity name.


---

## TesseractModuleEntity

```go
tesseractModule := client.TesseractModule(nil)
fmt.Println(tesseractModule.GetName()) // "tesseract_module"
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `join` | `[]any` | No |  |
| `pagination` | `map[string]any` | No |  |
| `request` | `[]any` | Yes |  |

### Operations

#### `Load(reqmatch, ctrl map[string]any) (any, error)`

Load a single entity matching the given criteria.

```go
result, err := client.TesseractModule(nil).Load(nil, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```

#### `Create(reqdata, ctrl map[string]any) (any, error)`

Create a new entity with the given data.

```go
result, err := client.TesseractModule(nil).Create(map[string]any{
    "extension": "example_extension",
}, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```

### Common Methods

#### `Data(args ...any) any`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `Match(args ...any) any`

Get or set the entity match criteria. Works the same as `Data()`.

#### `Make() Entity`

Create a new `TesseractModuleEntity` instance with the same client and
options.

#### `GetName() string`

Return the entity name.


---

## TesseractSchemaEntity

```go
tesseractSchema := client.TesseractSchema(nil)
fmt.Println(tesseractSchema.GetName()) // "tesseract_schema"
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `annotation` | `map[string]any` | Yes |  |
| `caption` | `string` | Yes |  |
| `dimension` | `[]any` | Yes |  |
| `measure` | `[]any` | Yes |  |
| `name` | `string` | Yes |  |

### Operations

#### `List(reqmatch, ctrl map[string]any) (any, error)`

List entities matching the given criteria. Returns an array.

```go
results, err := client.TesseractSchema(nil).List(nil, nil)
if err != nil {
    panic(err)
}
fmt.Println(results)
```

### Common Methods

#### `Data(args ...any) any`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `Match(args ...any) any`

Get or set the entity match criteria. Works the same as `Data()`.

#### `Make() Entity`

Create a new `TesseractSchemaEntity` instance with the same client and
options.

#### `GetName() string`

Return the entity name.


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `test` | 0.0.1 | In-memory mock transport for testing without a live server |


Features are activated via the `feature` option:

```go
client := sdk.NewDataUsaSDK(map[string]any{
    "feature": map[string]any{
        "test": map[string]any{"active": true},
    },
})
```

