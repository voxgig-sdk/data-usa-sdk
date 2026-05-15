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
| `options["apikey"]` | `string` | API key for authentication. |
| `options["base"]` | `string` | Base URL for API requests. |
| `options["prefix"]` | `string` | URL prefix appended after base. |
| `options["suffix"]` | `string` | URL suffix appended after path. |
| `options["headers"]` | `map[string]any` | Custom headers for all requests. |
| `options["feature"]` | `map[string]any` | Feature configuration. |
| `options["system"]` | `map[string]any` | System overrides (e.g. custom fetch). |


### Static Methods

#### `TestSDK(testopts, sdkopts map[string]any) *DataUsaSDK`

Create a test client with mock features active. Both arguments may be `nil`.

```go
client := sdk.TestSDK(nil, nil)
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
calculations_module := client.CalculationsModule(nil)
```

### Operations

#### `Load(reqmatch, ctrl map[string]any) (any, error)`

Load a single entity matching the given criteria.

```go
result, err := client.CalculationsModule(nil).Load(map[string]any{"id": "calculations_module_id"}, nil)
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
economic_complexity_module := client.EconomicComplexityModule(nil)
```

### Operations

#### `Load(reqmatch, ctrl map[string]any) (any, error)`

Load a single entity matching the given criteria.

```go
result, err := client.EconomicComplexityModule(nil).Load(map[string]any{"id": "economic_complexity_module_id"}, nil)
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
```

### Operations

#### `Load(reqmatch, ctrl map[string]any) (any, error)`

Load a single entity matching the given criteria.

```go
result, err := client.Health(nil).Load(map[string]any{"id": "health_id"}, nil)
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
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `annotation` | ``$OBJECT`` | Yes |  |
| `caption` | ``$STRING`` | Yes |  |
| `name` | ``$STRING`` | Yes |  |
| `type` | ``$STRING`` | Yes |  |

### Operations

#### `List(reqmatch, ctrl map[string]any) (any, error)`

List entities matching the given criteria. Returns an array.

```go
results, err := client.Member(nil).List(nil, nil)
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
module_status := client.ModuleStatus(nil)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `debug` | ``$ANY`` | Yes |  |
| `module` | ``$STRING`` | Yes |  |
| `status` | ``$STRING`` | Yes |  |
| `version` | ``$STRING`` | Yes |  |

### Operations

#### `Load(reqmatch, ctrl map[string]any) (any, error)`

Load a single entity matching the given criteria.

```go
result, err := client.ModuleStatus(nil).Load(map[string]any{"id": "module_status_id"}, nil)
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
route_index_get := client.RouteIndexGet(nil)
```

### Operations

#### `Load(reqmatch, ctrl map[string]any) (any, error)`

Load a single entity matching the given criteria.

```go
result, err := client.RouteIndexGet(nil).Load(map[string]any{"id": "route_index_get_id"}, nil)
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
tesseract_cube := client.TesseractCube(nil)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `annotation` | ``$OBJECT`` | Yes |  |
| `caption` | ``$STRING`` | Yes |  |
| `dimension` | ``$ARRAY`` | Yes |  |
| `measure` | ``$ARRAY`` | Yes |  |
| `name` | ``$STRING`` | Yes |  |

### Operations

#### `Load(reqmatch, ctrl map[string]any) (any, error)`

Load a single entity matching the given criteria.

```go
result, err := client.TesseractCube(nil).Load(map[string]any{"id": "tesseract_cube_id"}, nil)
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
tesseract_module := client.TesseractModule(nil)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `join` | ``$ARRAY`` | No |  |
| `pagination` | ``$OBJECT`` | No |  |
| `request` | ``$ARRAY`` | Yes |  |

### Operations

#### `Create(reqdata, ctrl map[string]any) (any, error)`

Create a new entity with the given data.

```go
result, err := client.TesseractModule(nil).Create(map[string]any{
    "request": /* `$ARRAY` */,
}, nil)
```

#### `Load(reqmatch, ctrl map[string]any) (any, error)`

Load a single entity matching the given criteria.

```go
result, err := client.TesseractModule(nil).Load(map[string]any{"id": "tesseract_module_id"}, nil)
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
tesseract_schema := client.TesseractSchema(nil)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `annotation` | ``$OBJECT`` | Yes |  |
| `caption` | ``$STRING`` | Yes |  |
| `dimension` | ``$ARRAY`` | Yes |  |
| `measure` | ``$ARRAY`` | Yes |  |
| `name` | ``$STRING`` | Yes |  |

### Operations

#### `List(reqmatch, ctrl map[string]any) (any, error)`

List entities matching the given criteria. Returns an array.

```go
results, err := client.TesseractSchema(nil).List(nil, nil)
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

