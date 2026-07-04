# DataUsa Python SDK Reference

Complete API reference for the DataUsa Python SDK.


## DataUsaSDK

### Constructor

```python
from data-usa_sdk import DataUsaSDK

client = DataUsaSDK(options)
```

Create a new SDK client instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `options` | `dict` | SDK configuration options. |
| `options["base"]` | `str` | Base URL for API requests. |
| `options["prefix"]` | `str` | URL prefix appended after base. |
| `options["suffix"]` | `str` | URL suffix appended after path. |
| `options["headers"]` | `dict` | Custom headers for all requests. |
| `options["feature"]` | `dict` | Feature configuration. |
| `options["system"]` | `dict` | System overrides (e.g. custom fetch). |


### Static Methods

#### `DataUsaSDK.test(testopts=None, sdkopts=None)`

Create a test client with mock features active. Both arguments may be `None`.

```python
client = DataUsaSDK.test()
```


### Instance Methods

#### `CalculationsModule(data=None)`

Create a new `CalculationsModuleEntity` instance. Pass `None` for no initial data.

#### `EconomicComplexityModule(data=None)`

Create a new `EconomicComplexityModuleEntity` instance. Pass `None` for no initial data.

#### `Health(data=None)`

Create a new `HealthEntity` instance. Pass `None` for no initial data.

#### `Member(data=None)`

Create a new `MemberEntity` instance. Pass `None` for no initial data.

#### `ModuleStatus(data=None)`

Create a new `ModuleStatusEntity` instance. Pass `None` for no initial data.

#### `RouteIndexGet(data=None)`

Create a new `RouteIndexGetEntity` instance. Pass `None` for no initial data.

#### `TesseractCube(data=None)`

Create a new `TesseractCubeEntity` instance. Pass `None` for no initial data.

#### `TesseractModule(data=None)`

Create a new `TesseractModuleEntity` instance. Pass `None` for no initial data.

#### `TesseractSchema(data=None)`

Create a new `TesseractSchemaEntity` instance. Pass `None` for no initial data.

#### `options_map() -> dict`

Return a deep copy of the current SDK options.

#### `get_utility() -> Utility`

Return a copy of the SDK utility object.

#### `direct(fetchargs=None) -> dict`

Make a direct HTTP request to any API endpoint. Returns a result `dict` with `ok`, `status`, `headers`, and `data` (or `err` on failure). This escape hatch never raises — branch on `result["ok"]`.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `fetchargs["path"]` | `str` | URL path with optional `{param}` placeholders. |
| `fetchargs["method"]` | `str` | HTTP method (default: `"GET"`). |
| `fetchargs["params"]` | `dict` | Path parameter values. |
| `fetchargs["query"]` | `dict` | Query string parameters. |
| `fetchargs["headers"]` | `dict` | Request headers (merged with defaults). |
| `fetchargs["body"]` | `any` | Request body (dicts are JSON-serialized). |

**Returns:** `result_dict`

#### `prepare(fetchargs=None) -> dict`

Prepare a fetch definition without sending. Returns the `fetchdef` and raises on error.


---

## CalculationsModuleEntity

```python
calculations_module = client.CalculationsModule()
```

### Operations

#### `load(reqmatch, ctrl=None) -> dict`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```python
result = client.CalculationsModule().load({"id": "calculations_module_id"})
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `CalculationsModuleEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## EconomicComplexityModuleEntity

```python
economic_complexity_module = client.EconomicComplexityModule()
```

### Operations

#### `load(reqmatch, ctrl=None) -> dict`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```python
result = client.EconomicComplexityModule().load({"id": "economic_complexity_module_id"})
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `EconomicComplexityModuleEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## HealthEntity

```python
health = client.Health()
```

### Operations

#### `load(reqmatch, ctrl=None) -> dict`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```python
result = client.Health().load({"id": "health_id"})
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `HealthEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## MemberEntity

```python
member = client.Member()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `annotation` | ``$OBJECT`` | Yes |  |
| `caption` | ``$STRING`` | Yes |  |
| `name` | ``$STRING`` | Yes |  |
| `type` | ``$STRING`` | Yes |  |

### Operations

#### `list(reqmatch, ctrl=None) -> list`

List entities matching the given criteria. Returns a list and raises on error.

```python
results = client.Member().list({})
for member in results:
    print(member)
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `MemberEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## ModuleStatusEntity

```python
module_status = client.ModuleStatus()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `debug` | ``$ANY`` | Yes |  |
| `module` | ``$STRING`` | Yes |  |
| `status` | ``$STRING`` | Yes |  |
| `version` | ``$STRING`` | Yes |  |

### Operations

#### `load(reqmatch, ctrl=None) -> dict`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```python
result = client.ModuleStatus().load({"id": "module_status_id"})
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `ModuleStatusEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## RouteIndexGetEntity

```python
route_index_get = client.RouteIndexGet()
```

### Operations

#### `load(reqmatch, ctrl=None) -> dict`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```python
result = client.RouteIndexGet().load({"id": "route_index_get_id"})
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `RouteIndexGetEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## TesseractCubeEntity

```python
tesseract_cube = client.TesseractCube()
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

#### `load(reqmatch, ctrl=None) -> dict`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```python
result = client.TesseractCube().load({"id": "tesseract_cube_id"})
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `TesseractCubeEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## TesseractModuleEntity

```python
tesseract_module = client.TesseractModule()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `join` | ``$ARRAY`` | No |  |
| `pagination` | ``$OBJECT`` | No |  |
| `request` | ``$ARRAY`` | Yes |  |

### Operations

#### `create(reqdata, ctrl=None) -> dict`

Create a new entity with the given data. Returns the created entity data and raises on error.

```python
result = client.TesseractModule().create({
    "request": ...,  # `$ARRAY`
})
```

#### `load(reqmatch, ctrl=None) -> dict`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```python
result = client.TesseractModule().load({"id": "tesseract_module_id"})
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `TesseractModuleEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## TesseractSchemaEntity

```python
tesseract_schema = client.TesseractSchema()
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

#### `list(reqmatch, ctrl=None) -> list`

List entities matching the given criteria. Returns a list and raises on error.

```python
results = client.TesseractSchema().list({})
for tesseract_schema in results:
    print(tesseract_schema)
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `TesseractSchemaEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `test` | 0.0.1 | In-memory mock transport for testing without a live server |


Features are activated via the `feature` option:

```python
client = DataUsaSDK({
    "feature": {
        "test": {"active": True},
    },
})
```

