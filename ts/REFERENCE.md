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
const calculations_module = client.CalculationsModule()
```

### Operations

#### `load(match: object, ctrl?: object)`

Load a single entity matching the given criteria.

```ts
const result = await client.CalculationsModule().load()
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
const economic_complexity_module = client.EconomicComplexityModule()
```

### Operations

#### `load(match: object, ctrl?: object)`

Load a single entity matching the given criteria.

```ts
const result = await client.EconomicComplexityModule().load()
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
const health = client.Health()
```

### Operations

#### `load(match: object, ctrl?: object)`

Load a single entity matching the given criteria.

```ts
const result = await client.Health().load()
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
const member = client.Member()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `annotation` | `Record<string, any>` | Yes |  |
| `caption` | `string` | Yes |  |
| `name` | `string` | Yes |  |
| `type` | `string` | Yes |  |

### Operations

#### `list(match: object, ctrl?: object)`

List entities matching the given criteria. Returns an array.

```ts
const results = await client.Member().list()
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
const module_status = client.ModuleStatus()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `debug` | `any` | Yes |  |
| `module` | `string` | Yes |  |
| `status` | `string` | Yes |  |
| `version` | `string` | Yes |  |

### Operations

#### `load(match: object, ctrl?: object)`

Load a single entity matching the given criteria.

```ts
const result = await client.ModuleStatus().load()
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
const route_index_get = client.RouteIndexGet()
```

### Operations

#### `load(match: object, ctrl?: object)`

Load a single entity matching the given criteria.

```ts
const result = await client.RouteIndexGet().load()
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
const tesseract_cube = client.TesseractCube()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `annotation` | `Record<string, any>` | Yes |  |
| `caption` | `string` | Yes |  |
| `dimension` | `any[]` | Yes |  |
| `measure` | `any[]` | Yes |  |
| `name` | `string` | Yes |  |

### Operations

#### `load(match: object, ctrl?: object)`

Load a single entity matching the given criteria.

```ts
const result = await client.TesseractCube().load({ id: 'tesseract_cube_id' })
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
const tesseract_module = client.TesseractModule()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `join` | `any[]` | No |  |
| `pagination` | `Record<string, any>` | No |  |
| `request` | `any[]` | Yes |  |

### Operations

#### `create(data: object, ctrl?: object)`

Create a new entity with the given data.

```ts
const result = await client.TesseractModule().create({
  request: /* any[] */,
})
```

#### `load(match: object, ctrl?: object)`

Load a single entity matching the given criteria.

```ts
const result = await client.TesseractModule().load()
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
const tesseract_schema = client.TesseractSchema()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `annotation` | `Record<string, any>` | Yes |  |
| `caption` | `string` | Yes |  |
| `dimension` | `any[]` | Yes |  |
| `measure` | `any[]` | Yes |  |
| `name` | `string` | Yes |  |

### Operations

#### `list(match: object, ctrl?: object)`

List entities matching the given criteria. Returns an array.

```ts
const results = await client.TesseractSchema().list()
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

