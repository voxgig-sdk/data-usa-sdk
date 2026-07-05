# DataUsa Ruby SDK Reference

Complete API reference for the DataUsa Ruby SDK.


## DataUsaSDK

### Constructor

```ruby
require_relative 'DataUsa_sdk'

client = DataUsaSDK.new(options)
```

Create a new SDK client instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `options` | `Hash` | SDK configuration options. |
| `options["base"]` | `String` | Base URL for API requests. |
| `options["prefix"]` | `String` | URL prefix appended after base. |
| `options["suffix"]` | `String` | URL suffix appended after path. |
| `options["headers"]` | `Hash` | Custom headers for all requests. |
| `options["feature"]` | `Hash` | Feature configuration. |
| `options["system"]` | `Hash` | System overrides (e.g. custom fetch). |


### Static Methods

#### `DataUsaSDK.test(testopts = nil, sdkopts = nil)`

Create a test client with mock features active. Both arguments may be `nil`.

```ruby
client = DataUsaSDK.test
```


### Instance Methods

#### `CalculationsModule(data = nil)`

Create a new `CalculationsModule` entity instance. Pass `nil` for no initial data.

#### `EconomicComplexityModule(data = nil)`

Create a new `EconomicComplexityModule` entity instance. Pass `nil` for no initial data.

#### `Health(data = nil)`

Create a new `Health` entity instance. Pass `nil` for no initial data.

#### `Member(data = nil)`

Create a new `Member` entity instance. Pass `nil` for no initial data.

#### `ModuleStatus(data = nil)`

Create a new `ModuleStatus` entity instance. Pass `nil` for no initial data.

#### `RouteIndexGet(data = nil)`

Create a new `RouteIndexGet` entity instance. Pass `nil` for no initial data.

#### `TesseractCube(data = nil)`

Create a new `TesseractCube` entity instance. Pass `nil` for no initial data.

#### `TesseractModule(data = nil)`

Create a new `TesseractModule` entity instance. Pass `nil` for no initial data.

#### `TesseractSchema(data = nil)`

Create a new `TesseractSchema` entity instance. Pass `nil` for no initial data.

#### `options_map -> Hash`

Return a deep copy of the current SDK options.

#### `get_utility -> Utility`

Return a copy of the SDK utility object.

#### `direct(fetchargs = {}) -> Hash`

Make a direct HTTP request to any API endpoint. Returns a result hash
(`{ "ok" => ..., "status" => ..., "data" => ..., "err" => ... }`); it
does not raise — inspect `result["ok"]`.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `fetchargs["path"]` | `String` | URL path with optional `{param}` placeholders. |
| `fetchargs["method"]` | `String` | HTTP method (default: `"GET"`). |
| `fetchargs["params"]` | `Hash` | Path parameter values for `{param}` substitution. |
| `fetchargs["query"]` | `Hash` | Query string parameters. |
| `fetchargs["headers"]` | `Hash` | Request headers (merged with defaults). |
| `fetchargs["body"]` | `any` | Request body (hashes are JSON-serialized). |
| `fetchargs["ctrl"]` | `Hash` | Control options (e.g. `{ "explain" => true }`). |

**Returns:** `Hash`

#### `prepare(fetchargs = {}) -> Hash`

Prepare a fetch definition without sending the request. Accepts the
same parameters as `direct()`. Raises on error.

**Returns:** `Hash` (the fetch definition; raises on error)


---

## CalculationsModuleEntity

```ruby
calculations_module = client.CalculationsModule
```

### Operations

#### `load(reqmatch, ctrl = nil) -> result`

Load a single entity matching the given criteria. Raises on error.

```ruby
result = client.CalculationsModule.load()
```

### Common Methods

#### `data_get -> Hash`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get -> Hash`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make -> Entity`

Create a new `CalculationsModuleEntity` instance with the same client and
options.

#### `get_name -> String`

Return the entity name.


---

## EconomicComplexityModuleEntity

```ruby
economic_complexity_module = client.EconomicComplexityModule
```

### Operations

#### `load(reqmatch, ctrl = nil) -> result`

Load a single entity matching the given criteria. Raises on error.

```ruby
result = client.EconomicComplexityModule.load()
```

### Common Methods

#### `data_get -> Hash`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get -> Hash`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make -> Entity`

Create a new `EconomicComplexityModuleEntity` instance with the same client and
options.

#### `get_name -> String`

Return the entity name.


---

## HealthEntity

```ruby
health = client.Health
```

### Operations

#### `load(reqmatch, ctrl = nil) -> result`

Load a single entity matching the given criteria. Raises on error.

```ruby
result = client.Health.load()
```

### Common Methods

#### `data_get -> Hash`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get -> Hash`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make -> Entity`

Create a new `HealthEntity` instance with the same client and
options.

#### `get_name -> String`

Return the entity name.


---

## MemberEntity

```ruby
member = client.Member
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `annotation` | `Hash` | Yes |  |
| `caption` | `String` | Yes |  |
| `name` | `String` | Yes |  |
| `type` | `String` | Yes |  |

### Operations

#### `list(reqmatch = nil, ctrl = nil) -> Array`

List entities matching the given criteria (call with no argument to list all). Returns an array. Raises on error.

```ruby
results = client.Member.list
```

### Common Methods

#### `data_get -> Hash`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get -> Hash`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make -> Entity`

Create a new `MemberEntity` instance with the same client and
options.

#### `get_name -> String`

Return the entity name.


---

## ModuleStatusEntity

```ruby
module_status = client.ModuleStatus
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `debug` | `Object` | Yes |  |
| `module` | `String` | Yes |  |
| `status` | `String` | Yes |  |
| `version` | `String` | Yes |  |

### Operations

#### `load(reqmatch, ctrl = nil) -> result`

Load a single entity matching the given criteria. Raises on error.

```ruby
result = client.ModuleStatus.load()
```

### Common Methods

#### `data_get -> Hash`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get -> Hash`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make -> Entity`

Create a new `ModuleStatusEntity` instance with the same client and
options.

#### `get_name -> String`

Return the entity name.


---

## RouteIndexGetEntity

```ruby
route_index_get = client.RouteIndexGet
```

### Operations

#### `load(reqmatch, ctrl = nil) -> result`

Load a single entity matching the given criteria. Raises on error.

```ruby
result = client.RouteIndexGet.load()
```

### Common Methods

#### `data_get -> Hash`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get -> Hash`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make -> Entity`

Create a new `RouteIndexGetEntity` instance with the same client and
options.

#### `get_name -> String`

Return the entity name.


---

## TesseractCubeEntity

```ruby
tesseract_cube = client.TesseractCube
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `annotation` | `Hash` | Yes |  |
| `caption` | `String` | Yes |  |
| `dimension` | `Array` | Yes |  |
| `measure` | `Array` | Yes |  |
| `name` | `String` | Yes |  |

### Operations

#### `load(reqmatch, ctrl = nil) -> result`

Load a single entity matching the given criteria. Raises on error.

```ruby
result = client.TesseractCube.load({ "id" => "tesseract_cube_id" })
```

### Common Methods

#### `data_get -> Hash`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get -> Hash`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make -> Entity`

Create a new `TesseractCubeEntity` instance with the same client and
options.

#### `get_name -> String`

Return the entity name.


---

## TesseractModuleEntity

```ruby
tesseract_module = client.TesseractModule
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `join` | `Array` | No |  |
| `pagination` | `Hash` | No |  |
| `request` | `Array` | Yes |  |

### Operations

#### `create(reqdata, ctrl = nil) -> result`

Create a new entity with the given data. Raises on error.

```ruby
result = client.TesseractModule.create({
  "request" => [], # Array
})
```

#### `load(reqmatch, ctrl = nil) -> result`

Load a single entity matching the given criteria. Raises on error.

```ruby
result = client.TesseractModule.load()
```

### Common Methods

#### `data_get -> Hash`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get -> Hash`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make -> Entity`

Create a new `TesseractModuleEntity` instance with the same client and
options.

#### `get_name -> String`

Return the entity name.


---

## TesseractSchemaEntity

```ruby
tesseract_schema = client.TesseractSchema
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `annotation` | `Hash` | Yes |  |
| `caption` | `String` | Yes |  |
| `dimension` | `Array` | Yes |  |
| `measure` | `Array` | Yes |  |
| `name` | `String` | Yes |  |

### Operations

#### `list(reqmatch = nil, ctrl = nil) -> Array`

List entities matching the given criteria (call with no argument to list all). Returns an array. Raises on error.

```ruby
results = client.TesseractSchema.list
```

### Common Methods

#### `data_get -> Hash`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get -> Hash`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make -> Entity`

Create a new `TesseractSchemaEntity` instance with the same client and
options.

#### `get_name -> String`

Return the entity name.


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `test` | 0.0.1 | In-memory mock transport for testing without a live server |


Features are activated via the `feature` option:

```ruby
client = DataUsaSDK.new({
  "feature" => {
    "test" => { "active" => true },
  },
})
```

