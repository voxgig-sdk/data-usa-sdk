# DataUsa Lua SDK Reference

Complete API reference for the DataUsa Lua SDK.


## DataUsaSDK

### Constructor

```lua
local sdk = require("data-usa_sdk")
local client = sdk.new(options)
```

Create a new SDK client instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `options` | `table` | SDK configuration options. |
| `options.base` | `string` | Base URL for API requests. |
| `options.prefix` | `string` | URL prefix appended after base. |
| `options.suffix` | `string` | URL suffix appended after path. |
| `options.headers` | `table` | Custom headers for all requests. |
| `options.feature` | `table` | Feature configuration. |
| `options.system` | `table` | System overrides (e.g. custom fetch). |


### Static Methods

#### `sdk.test(testopts?, sdkopts?)`

Create a test client with mock features active. Both arguments are optional.

```lua
local client = sdk.test()
```


### Instance Methods

#### `CalculationsModule(data)`

Create a new `CalculationsModule` entity instance. Pass `nil` for no initial data.

#### `EconomicComplexityModule(data)`

Create a new `EconomicComplexityModule` entity instance. Pass `nil` for no initial data.

#### `Health(data)`

Create a new `Health` entity instance. Pass `nil` for no initial data.

#### `Member(data)`

Create a new `Member` entity instance. Pass `nil` for no initial data.

#### `ModuleStatus(data)`

Create a new `ModuleStatus` entity instance. Pass `nil` for no initial data.

#### `RouteIndexGet(data)`

Create a new `RouteIndexGet` entity instance. Pass `nil` for no initial data.

#### `TesseractCube(data)`

Create a new `TesseractCube` entity instance. Pass `nil` for no initial data.

#### `TesseractModule(data)`

Create a new `TesseractModule` entity instance. Pass `nil` for no initial data.

#### `TesseractSchema(data)`

Create a new `TesseractSchema` entity instance. Pass `nil` for no initial data.

#### `options_map() -> table`

Return a deep copy of the current SDK options.

#### `get_utility() -> Utility`

Return a copy of the SDK utility object.

#### `direct(fetchargs) -> table, err`

Make a direct HTTP request to any API endpoint.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `fetchargs.path` | `string` | URL path with optional `{param}` placeholders. |
| `fetchargs.method` | `string` | HTTP method (default: `"GET"`). |
| `fetchargs.params` | `table` | Path parameter values for `{param}` substitution. |
| `fetchargs.query` | `table` | Query string parameters. |
| `fetchargs.headers` | `table` | Request headers (merged with defaults). |
| `fetchargs.body` | `any` | Request body (tables are JSON-serialized). |
| `fetchargs.ctrl` | `table` | Control options (e.g. `{ explain = true }`). |

**Returns:** `table, err`

#### `prepare(fetchargs) -> table, err`

Prepare a fetch definition without sending the request. Accepts the
same parameters as `direct()`.

**Returns:** `table, err`


---

## CalculationsModuleEntity

```lua
local calculations_module = client:calculations_module(nil)
```

### Operations

#### `load(reqmatch, ctrl) -> any, err`

Load a single entity matching the given criteria.

```lua
local result, err = client:calculations_module():load({ id = "calculations_module_id" })
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `CalculationsModuleEntity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## EconomicComplexityModuleEntity

```lua
local economic_complexity_module = client:economic_complexity_module(nil)
```

### Operations

#### `load(reqmatch, ctrl) -> any, err`

Load a single entity matching the given criteria.

```lua
local result, err = client:economic_complexity_module():load({ id = "economic_complexity_module_id" })
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `EconomicComplexityModuleEntity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## HealthEntity

```lua
local health = client:health(nil)
```

### Operations

#### `load(reqmatch, ctrl) -> any, err`

Load a single entity matching the given criteria.

```lua
local result, err = client:health():load({ id = "health_id" })
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `HealthEntity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## MemberEntity

```lua
local member = client:member(nil)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `annotation` | ``$OBJECT`` | Yes |  |
| `caption` | ``$STRING`` | Yes |  |
| `name` | ``$STRING`` | Yes |  |
| `type` | ``$STRING`` | Yes |  |

### Operations

#### `list(reqmatch, ctrl) -> any, err`

List entities matching the given criteria. Returns an array.

```lua
local results, err = client:member():list()
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `MemberEntity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## ModuleStatusEntity

```lua
local module_status = client:module_status(nil)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `debug` | ``$ANY`` | Yes |  |
| `module` | ``$STRING`` | Yes |  |
| `status` | ``$STRING`` | Yes |  |
| `version` | ``$STRING`` | Yes |  |

### Operations

#### `load(reqmatch, ctrl) -> any, err`

Load a single entity matching the given criteria.

```lua
local result, err = client:module_status():load({ id = "module_status_id" })
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `ModuleStatusEntity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## RouteIndexGetEntity

```lua
local route_index_get = client:route_index_get(nil)
```

### Operations

#### `load(reqmatch, ctrl) -> any, err`

Load a single entity matching the given criteria.

```lua
local result, err = client:route_index_get():load({ id = "route_index_get_id" })
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `RouteIndexGetEntity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## TesseractCubeEntity

```lua
local tesseract_cube = client:tesseract_cube(nil)
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

#### `load(reqmatch, ctrl) -> any, err`

Load a single entity matching the given criteria.

```lua
local result, err = client:tesseract_cube():load({ id = "tesseract_cube_id" })
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `TesseractCubeEntity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## TesseractModuleEntity

```lua
local tesseract_module = client:tesseract_module(nil)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `join` | ``$ARRAY`` | No |  |
| `pagination` | ``$OBJECT`` | No |  |
| `request` | ``$ARRAY`` | Yes |  |

### Operations

#### `create(reqdata, ctrl) -> any, err`

Create a new entity with the given data.

```lua
local result, err = client:tesseract_module():create({
  request = --[[ `$ARRAY` ]],
})
```

#### `load(reqmatch, ctrl) -> any, err`

Load a single entity matching the given criteria.

```lua
local result, err = client:tesseract_module():load({ id = "tesseract_module_id" })
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `TesseractModuleEntity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## TesseractSchemaEntity

```lua
local tesseract_schema = client:tesseract_schema(nil)
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

#### `list(reqmatch, ctrl) -> any, err`

List entities matching the given criteria. Returns an array.

```lua
local results, err = client:tesseract_schema():list()
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `TesseractSchemaEntity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `test` | 0.0.1 | In-memory mock transport for testing without a live server |


Features are activated via the `feature` option:

```lua
local client = sdk.new({
  feature = {
    test = { active = true },
  },
})
```

