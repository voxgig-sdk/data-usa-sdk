# DataUsa TypeScript SDK Reference

Complete API reference for the DataUsa TypeScript SDK.


## DataUsaSDK

### Constructor

```ts
new DataUsaSDK(options?: object)
```

Create a new SDK client instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `options` | `object` | SDK configuration options. |
| `options.base` | `string` | Base URL for API requests. |
| `options.prefix` | `string` | URL prefix appended after base. |
| `options.suffix` | `string` | URL suffix appended after path. |
| `options.headers` | `object` | Custom headers for all requests. |
| `options.feature` | `object` | Feature configuration. |
| `options.system` | `object` | System overrides (e.g. custom fetch). |


### Static Methods

#### `DataUsaSDK.test(testopts?, sdkopts?)`

Create a test client with mock features active.

```ts
const client = DataUsaSDK.test()
```

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `testopts` | `object` | Test feature options. |
| `sdkopts` | `object` | Additional SDK options merged with test defaults. |

**Returns:** `DataUsaSDK` instance in test mode.


### Instance Methods

#### `CalculationsModule(data?: object)`

Create a new `CalculationsModule` entity instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `data` | `object` | Initial entity data. |

**Returns:** `CalculationsModuleEntity` instance.

#### `EconomicComplexityModule(data?: object)`

Create a new `EconomicComplexityModule` entity instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `data` | `object` | Initial entity data. |

**Returns:** `EconomicComplexityModuleEntity` instance.

#### `Health(data?: object)`

Create a new `Health` entity instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `data` | `object` | Initial entity data. |

**Returns:** `HealthEntity` instance.

#### `Member(data?: object)`

Create a new `Member` entity instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `data` | `object` | Initial entity data. |

**Returns:** `MemberEntity` instance.

#### `ModuleStatus(data?: object)`

Create a new `ModuleStatus` entity instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `data` | `object` | Initial entity data. |

**Returns:** `ModuleStatusEntity` instance.

#### `RouteIndexGet(data?: object)`

Create a new `RouteIndexGet` entity instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `data` | `object` | Initial entity data. |

**Returns:** `RouteIndexGetEntity` instance.

#### `TesseractCube(data?: object)`

Create a new `TesseractCube` entity instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `data` | `object` | Initial entity data. |

**Returns:** `TesseractCubeEntity` instance.

#### `TesseractModule(data?: object)`

Create a new `TesseractModule` entity instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `data` | `object` | Initial entity data. |

**Returns:** `TesseractModuleEntity` instance.

#### `TesseractSchema(data?: object)`

Create a new `TesseractSchema` entity instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `data` | `object` | Initial entity data. |

**Returns:** `TesseractSchemaEntity` instance.

#### `options()`

Return a deep copy of the current SDK options.

**Returns:** `object`

#### `utility()`

Return a copy of the SDK utility object.

**Returns:** `object`

#### `direct(fetchargs?: object)`

Make a direct HTTP request to any API endpoint.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `fetchargs.path` | `string` | URL path with optional `{param}` placeholders. |
| `fetchargs.method` | `string` | HTTP method (default: `GET`). |
| `fetchargs.params` | `object` | Path parameter values for `{param}` substitution. |
| `fetchargs.query` | `object` | Query string parameters. |
| `fetchargs.headers` | `object` | Request headers (merged with defaults). |
| `fetchargs.body` | `any` | Request body (objects are JSON-serialized). |
| `fetchargs.ctrl` | `object` | Control options (e.g. `{ explain: true }`). |

**Returns:** `Promise<{ ok, status, headers, data } | Error>`

#### `prepare(fetchargs?: object)`

Prepare a fetch definition without sending the request. Accepts the
same parameters as `direct()`.

**Returns:** `Promise<{ url, method, headers, body } | Error>`

#### `tester(testopts?, sdkopts?)`

Alias for `DataUsaSDK.test()`.

**Returns:** `DataUsaSDK` instance in test mode.


---

## CalculationsModuleEntity

```ts
const calculations_module = client.calculations_module
```

### Operations

#### `load(match: object, ctrl?: object)`

Load a single entity matching the given criteria.

```ts
const result = await client.calculations_module.load({ id: 'calculations_module_id' })
```

### Common Methods

#### `data(data?: object)`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `match(match?: object)`

Get or set the entity match criteria. Works the same as `data()`.

#### `make()`

Create a new `CalculationsModuleEntity` instance with the same client and
options.

#### `client()`

Return the parent `DataUsaSDK` instance.

#### `entopts()`

Return a copy of the entity options.


---

## EconomicComplexityModuleEntity

```ts
const economic_complexity_module = client.economic_complexity_module
```

### Operations

#### `load(match: object, ctrl?: object)`

Load a single entity matching the given criteria.

```ts
const result = await client.economic_complexity_module.load({ id: 'economic_complexity_module_id' })
```

### Common Methods

#### `data(data?: object)`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `match(match?: object)`

Get or set the entity match criteria. Works the same as `data()`.

#### `make()`

Create a new `EconomicComplexityModuleEntity` instance with the same client and
options.

#### `client()`

Return the parent `DataUsaSDK` instance.

#### `entopts()`

Return a copy of the entity options.


---

## HealthEntity

```ts
const health = client.health
```

### Operations

#### `load(match: object, ctrl?: object)`

Load a single entity matching the given criteria.

```ts
const result = await client.health.load({ id: 'health_id' })
```

### Common Methods

#### `data(data?: object)`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `match(match?: object)`

Get or set the entity match criteria. Works the same as `data()`.

#### `make()`

Create a new `HealthEntity` instance with the same client and
options.

#### `client()`

Return the parent `DataUsaSDK` instance.

#### `entopts()`

Return a copy of the entity options.


---

## MemberEntity

```ts
const member = client.member
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `annotation` | ``$OBJECT`` | Yes |  |
| `caption` | ``$STRING`` | Yes |  |
| `name` | ``$STRING`` | Yes |  |
| `type` | ``$STRING`` | Yes |  |

### Operations

#### `list(match: object, ctrl?: object)`

List entities matching the given criteria. Returns an array.

```ts
const results = await client.member.list()
```

### Common Methods

#### `data(data?: object)`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `match(match?: object)`

Get or set the entity match criteria. Works the same as `data()`.

#### `make()`

Create a new `MemberEntity` instance with the same client and
options.

#### `client()`

Return the parent `DataUsaSDK` instance.

#### `entopts()`

Return a copy of the entity options.


---

## ModuleStatusEntity

```ts
const module_status = client.module_status
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `debug` | ``$ANY`` | Yes |  |
| `module` | ``$STRING`` | Yes |  |
| `status` | ``$STRING`` | Yes |  |
| `version` | ``$STRING`` | Yes |  |

### Operations

#### `load(match: object, ctrl?: object)`

Load a single entity matching the given criteria.

```ts
const result = await client.module_status.load({ id: 'module_status_id' })
```

### Common Methods

#### `data(data?: object)`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `match(match?: object)`

Get or set the entity match criteria. Works the same as `data()`.

#### `make()`

Create a new `ModuleStatusEntity` instance with the same client and
options.

#### `client()`

Return the parent `DataUsaSDK` instance.

#### `entopts()`

Return a copy of the entity options.


---

## RouteIndexGetEntity

```ts
const route_index_get = client.route_index_get
```

### Operations

#### `load(match: object, ctrl?: object)`

Load a single entity matching the given criteria.

```ts
const result = await client.route_index_get.load({ id: 'route_index_get_id' })
```

### Common Methods

#### `data(data?: object)`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `match(match?: object)`

Get or set the entity match criteria. Works the same as `data()`.

#### `make()`

Create a new `RouteIndexGetEntity` instance with the same client and
options.

#### `client()`

Return the parent `DataUsaSDK` instance.

#### `entopts()`

Return a copy of the entity options.


---

## TesseractCubeEntity

```ts
const tesseract_cube = client.tesseract_cube
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

#### `load(match: object, ctrl?: object)`

Load a single entity matching the given criteria.

```ts
const result = await client.tesseract_cube.load({ id: 'tesseract_cube_id' })
```

### Common Methods

#### `data(data?: object)`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `match(match?: object)`

Get or set the entity match criteria. Works the same as `data()`.

#### `make()`

Create a new `TesseractCubeEntity` instance with the same client and
options.

#### `client()`

Return the parent `DataUsaSDK` instance.

#### `entopts()`

Return a copy of the entity options.


---

## TesseractModuleEntity

```ts
const tesseract_module = client.tesseract_module
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `join` | ``$ARRAY`` | No |  |
| `pagination` | ``$OBJECT`` | No |  |
| `request` | ``$ARRAY`` | Yes |  |

### Operations

#### `create(data: object, ctrl?: object)`

Create a new entity with the given data.

```ts
const result = await client.tesseract_module.create({
  request: /* `$ARRAY` */,
})
```

#### `load(match: object, ctrl?: object)`

Load a single entity matching the given criteria.

```ts
const result = await client.tesseract_module.load({ id: 'tesseract_module_id' })
```

### Common Methods

#### `data(data?: object)`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `match(match?: object)`

Get or set the entity match criteria. Works the same as `data()`.

#### `make()`

Create a new `TesseractModuleEntity` instance with the same client and
options.

#### `client()`

Return the parent `DataUsaSDK` instance.

#### `entopts()`

Return a copy of the entity options.


---

## TesseractSchemaEntity

```ts
const tesseract_schema = client.tesseract_schema
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

#### `list(match: object, ctrl?: object)`

List entities matching the given criteria. Returns an array.

```ts
const results = await client.tesseract_schema.list()
```

### Common Methods

#### `data(data?: object)`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `match(match?: object)`

Get or set the entity match criteria. Works the same as `data()`.

#### `make()`

Create a new `TesseractSchemaEntity` instance with the same client and
options.

#### `client()`

Return the parent `DataUsaSDK` instance.

#### `entopts()`

Return a copy of the entity options.


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `test` | 0.0.1 | In-memory mock transport for testing without a live server |


Features are activated via the `feature` option:

```ts
const client = new DataUsaSDK({
  feature: {
    test: { active: true },
  }
})
```

