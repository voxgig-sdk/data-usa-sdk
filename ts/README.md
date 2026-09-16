# DataUsa TypeScript SDK



The TypeScript SDK for the DataUsa API — a type-safe, entity-oriented client with full async/await support.

The API is exposed as capitalised, semantic **Entities** — e.g.
`client.CalculationsModule()` — each with a small set of operations (`list`, `load`, `create`)
instead of raw URL paths and query parameters. This keeps the surface
predictable and low-friction for both humans and AI agents.

> Also generated from this model: `go`, `go-cli`, `go-mcp`, `lua`, `php`, `py`, `rb` — see
> the [top-level README](../README.md).


## Install
This package is not yet published to npm. Install it from the GitHub
release tag (`ts/vX.Y.Z`):

- Releases: [https://github.com/voxgig-sdk/data-usa-sdk/releases](https://github.com/voxgig-sdk/data-usa-sdk/releases)


## Tutorial: your first API call

This tutorial walks through creating a client, listing entities, and
loading a specific record.

### 1. Create a client

```ts
import { DataUsaSDK } from '@voxgig-sdk/data-usa-sdk'

const client = new DataUsaSDK()
```

### 3. Load an economiccomplexitymodule

EconomicComplexityModule is nested under endpoint, so provide the `endpoint`.
`load()` returns the entity directly and throws on failure:

```ts
try {
  const economiccomplexitymodule = await client.EconomicComplexityModule().load({
    endpoint: 'example_endpoint',
  })
  console.log(economiccomplexitymodule)
} catch (err) {
  console.error('load failed:', err)
}
```


## Error handling

Entity operations reject on failure, so wrap them in `try` / `catch`:

```ts
try {
  const routeindexget = await client.RouteIndexGet().load()
  console.log(routeindexget)
} catch (err) {
  console.error('load failed:', err)
}
```

The low-level `direct()` method does **not** throw — it returns the
value or an `Error`, so check the result before using it:

```ts
const result = await client.direct({
  path: '/api/resource/{id}',
  method: 'GET',
  params: { id: 'example_id' },
})

if (result instanceof Error) {
  throw result
}
```


## How-to guides

### Make a direct HTTP request

For endpoints not covered by entity methods:

```ts
const result = await client.direct({
  path: '/api/resource/{id}',
  method: 'GET',
  params: { id: 'example' },
})

if (result instanceof Error) {
  throw result
}
if (result.ok) {
  console.log(result.status)  // 200
  console.log(result.data)    // response body
}
```

### Prepare a request without sending it

```ts
const fetchdef = await client.prepare({
  path: '/api/resource/{id}',
  method: 'DELETE',
  params: { id: 'example' },
})

// Inspect before sending
console.log(fetchdef.url)
console.log(fetchdef.method)
console.log(fetchdef.headers)
```

### Use test mode

Create a mock client for unit testing — no server required:

```ts
const client = DataUsaSDK.test()

const routeindexget = await client.RouteIndexGet().load()
// routeindexget is the entity, populated with mock response data
// — call routeindexget.data() for the record itself
console.log(routeindexget)
```

You can also use the instance method:

```ts
const client = new DataUsaSDK()
const testClient = client.tester()
```

### Retain entity state across calls

Entity instances remember their last match and data:

```ts
const entity = client.RouteIndexGet()

// First call runs the operation and stores its result
await entity.load()

// Subsequent calls reuse the stored state
const data = entity.data()
console.log(data)
```

### Add custom middleware

Pass features via the `extend` option:

```ts
const logger = {
  hooks: {
    PreRequest: (ctx: any) => {
      console.log('Requesting:', ctx.spec.method, ctx.spec.path)
    },
    PreResponse: (ctx: any) => {
      console.log('Status:', ctx.out.request?.status)
    },
  },
}

const client = new DataUsaSDK({
  extend: [logger],
})
```

### Run live tests

Create a `.env.local` file at the project root:

```
DATA_USA_TEST_LIVE=TRUE
```

Then run:

```bash
cd ts && npm test
```

Live entity tests continue independent operations after errors and attempt
supported cleanup. Their final result reports failures and missing prerequisites
after the remaining work completes. The model and test inputs determine which
API operations the generated scenarios cover.


## Reference

### DataUsaSDK

#### Constructor

```ts
new DataUsaSDK(options?: {
  base?: string
  prefix?: string
  suffix?: string
  feature?: Record<string, { active: boolean }>
  extend?: Feature[]
})
```

| Option | Type | Description |
| --- | --- | --- |
| `base` | `string` | Base URL of the API server. |
| `prefix` | `string` | URL path prefix prepended to all requests. |
| `suffix` | `string` | URL path suffix appended to all requests. |
| `feature` | `object` | Feature activation flags (e.g. `{ test: { active: true } }`). |
| `extend` | `Feature[]` | Additional feature instances to load. |

#### Methods

| Method | Returns | Description |
| --- | --- | --- |
| `options()` | `object` | Deep copy of current SDK options. |
| `utility()` | `Utility` | Deep copy of the SDK utility object. |
| `prepare(fetchargs?)` | `Promise<FetchDef>` | Build an HTTP request definition without sending it. |
| `direct(fetchargs?)` | `Promise<DirectResult>` | Build and send an HTTP request. |
| `CalculationsModule(data?)` | `CalculationsModuleEntity` | Create a CalculationsModule entity instance. |
| `EconomicComplexityModule(data?)` | `EconomicComplexityModuleEntity` | Create an EconomicComplexityModule entity instance. |
| `Health(data?)` | `HealthEntity` | Create a Health entity instance. |
| `Member(data?)` | `MemberEntity` | Create a Member entity instance. |
| `ModuleStatus(data?)` | `ModuleStatusEntity` | Create a ModuleStatus entity instance. |
| `RouteIndexGet(data?)` | `RouteIndexGetEntity` | Create a RouteIndexGet entity instance. |
| `TesseractCube(data?)` | `TesseractCubeEntity` | Create a TesseractCube entity instance. |
| `TesseractModule(data?)` | `TesseractModuleEntity` | Create a TesseractModule entity instance. |
| `TesseractSchema(data?)` | `TesseractSchemaEntity` | Create a TesseractSchema entity instance. |
| `tester(testopts?, sdkopts?)` | `DataUsaSDK` | Create a test-mode client instance. |

#### Static methods

| Method | Returns | Description |
| --- | --- | --- |
| `DataUsaSDK.test(testopts?, sdkopts?)` | `DataUsaSDK` | Create a test-mode client. |

### Entity interface

All entities share the same interface.

#### Methods

| Method | Signature | Description |
| --- | --- | --- |
| `load` | `load(reqmatch?, ctrl?): Promise<Entity>` | Load a single entity by match criteria. |
| `list` | `list(reqmatch?, ctrl?): Promise<Entity[]>` | List entities matching the criteria. |
| `create` | `create(reqdata?, ctrl?): Promise<Entity>` | Create a new entity. |
| `data` | `data(data?: Partial<Entity>): Entity` | Get or set entity data. |
| `match` | `match(match?: Partial<Entity>): Partial<Entity>` | Get or set entity match criteria. |
| `make` | `make(): Entity` | Create a new instance with the same options. |
| `client` | `client(): DataUsaSDK` | Return the parent SDK client. |
| `entopts` | `entopts(): object` | Return a copy of the entity options. |

#### Return values

Entity operations resolve to the entity data directly — there is no
result envelope:

- `load` and `create` resolve to a single entity object.
- `list` resolves to an **array** of entity objects (iterate it directly;
  there is no `.data` and no `.ok`).

On a failed request these methods **throw**, so wrap calls in
`try`/`catch` to handle errors. Only `direct()` returns the result
envelope described below.

### DirectResult shape

The `direct()` method returns:

```ts
{
  ok: boolean
  status: number
  headers: object
  data: any
}
```

On error, `ok` is `false` and an `err` property contains the error.

### FetchDef shape

The `prepare()` method returns:

```ts
{
  url: string
  method: string
  headers: Record<string, string>
  body?: any
}
```

### Entities

#### CalculationsModule

| Field | Description |
| --- | --- |

Operations: load.

API path: `/calcs/merge.{extension}`

#### EconomicComplexityModule

| Field | Description |
| --- | --- |

Operations: load.

API path: `/complexity/eci_subnational.{extension}`

#### Health

| Field | Description |
| --- | --- |

Operations: load.

API path: `/_health`

#### Member

| Field | Description |
| --- | --- |
| `annotations` |  |
| `caption` |  |
| `name` |  |
| `type` | Types of the data the user can expect to find in the associated column. |

Operations: list.

API path: `/tesseract/members`

#### ModuleStatus

| Field | Description |
| --- | --- |

Operations: load.

API path: `/calcs/`

#### RouteIndexGet

| Field | Description |
| --- | --- |

Operations: load.

API path: `/`

#### TesseractCube

| Field | Description |
| --- | --- |
| `annotations` |  |
| `caption` |  |
| `dimensions` |  |
| `id` |  |
| `measures` |  |
| `name` |  |

Operations: load.

API path: `/complexity/cubes/{cube_name}`

#### TesseractModule

| Field | Description |
| --- | --- |
| `joins` |  |
| `pagination` | Pagination instructions. |
| `requests` |  |

Operations: create, load.

API path: `/tesseract/multiquery.{extension}`

#### TesseractSchema

| Field | Description |
| --- | --- |
| `annotations` |  |
| `caption` |  |
| `dimensions` |  |
| `measures` |  |
| `name` |  |

Operations: list.

API path: `/complexity/cubes`



## Entities


### CalculationsModule

Create an instance: `const calculations_module = client.CalculationsModule()`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Example: Load

```ts
const calculations_module = await client.CalculationsModule().load({ extension: 'extension', param: {} })
```


### EconomicComplexityModule

Create an instance: `const economic_complexity_module = client.EconomicComplexityModule()`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Example: Load

```ts
const economic_complexity_module = await client.EconomicComplexityModule().load({ endpoint: 'endpoint' })
```


### Health

Create an instance: `const health = client.Health()`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Example: Load

```ts
const health = await client.Health().load()
```


### Member

Create an instance: `const member = client.Member()`

#### Operations

| Method | Description |
| --- | --- |
| `list(match)` | List entities matching the criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `annotations` | `Record<string, any>` |  |
| `caption` | `string` |  |
| `name` | `string` |  |
| `type` | `string` | Types of the data the user can expect to find in the associated column. |

#### Example: List

```ts
const members = await client.Member().list({ cube: "example", level: "example" })
```


### ModuleStatus

Create an instance: `const module_status = client.ModuleStatus()`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Example: Load

```ts
const module_status = await client.ModuleStatus().load()
```


### RouteIndexGet

Create an instance: `const route_index_get = client.RouteIndexGet()`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Example: Load

```ts
const route_index_get = await client.RouteIndexGet().load()
```


### TesseractCube

Create an instance: `const tesseract_cube = client.TesseractCube()`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `annotations` | `Record<string, any>` |  |
| `caption` | `string` |  |
| `dimensions` | `any[]` |  |
| `id` | `string` |  |
| `measures` | `any[]` |  |
| `name` | `string` |  |

#### Example: Load

```ts
const tesseract_cube = await client.TesseractCube().load({ id: 'tesseract_cube_id' })
```


### TesseractModule

Create an instance: `const tesseract_module = client.TesseractModule()`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `joins` | `any[]` |  |
| `pagination` | `Record<string, any>` | Pagination instructions. |
| `requests` | `any[]` |  |

#### Example: Load

```ts
const tesseract_module = await client.TesseractModule().load({ extension: 'extension', cube: 'cube', drilldown: 'drilldown', measure: 'measure' })
```

#### Example: Create

```ts
const tesseract_module = await client.TesseractModule().create({
  extension: 'example_extension',
  requests: [],
})
```


### TesseractSchema

Create an instance: `const tesseract_schema = client.TesseractSchema()`

#### Operations

| Method | Description |
| --- | --- |
| `list(match)` | List entities matching the criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `annotations` | `Record<string, any>` |  |
| `caption` | `string` |  |
| `dimensions` | `any[]` |  |
| `measures` | `any[]` |  |
| `name` | `string` |  |

#### Example: List

```ts
const tesseract_schemas = await client.TesseractSchema().list()
```

## Features

This SDK ships 4 optional features. Each is **inactive until you
switch it on**, so an SDK you have not configured behaves exactly as if none of
them existed — no retries, no cache, no logging, no measurable overhead.

Activate a feature by name in the client options, alongside the options shown
above:

| Feature | What it does |
|---|---|
| [`ratelimit`](#ratelimit) | Client-side rate limiting via a token bucket |
| [`retry`](#retry) | Automatic retry of transient failures with exponential backoff |
| [`test`](#test) | In-memory mock transport for testing without a live server |
| [`timeout`](#timeout) | Per-request timeout with transport abort |

> **Order matters for `ratelimit`, `retry`, `timeout`.** These wrap the
> transport, so each one wraps whatever is already installed: the order you
> activate them in IS the nesting order. Activating them as an ordered list
> rather than a map is what fixes that order.

### ratelimit

Client-side rate limiting via a token bucket.

| Option | Default |
|---|---|
| `active` | `false` |
| `burst` | `5` |
| `rate` | `5` |

Set `feature.ratelimit.active` to enable it, then override any of the options above.

`ratelimit` wraps the transport, so its position among the other
transport features decides what it sees. A feature activated later wraps one
activated earlier.

### retry

Automatic retry of transient failures with exponential backoff.

| Option | Default |
|---|---|
| `active` | `false` |
| `factor` | `2` |
| `maxDelay` | `2000` |
| `minDelay` | `50` |
| `retries` | `2` |
| `statuses` | `[408, 425, 429, 500, 502, 503, 504]` |

Set `feature.retry.active` to enable it, then override any of the options above.

`retry` wraps the transport, so its position among the other
transport features decides what it sees. A feature activated later wraps one
activated earlier.

### test

In-memory mock transport for testing without a live server.

| Option | Default |
|---|---|
| `active` | `false` |

Set `feature.test.active` to enable it, then override any of the options above.

### timeout

Per-request timeout with transport abort.

| Option | Default |
|---|---|
| `active` | `false` |
| `ms` | `30000` |

Set `feature.timeout.active` to enable it, then override any of the options above.

`timeout` wraps the transport, so its position among the other
transport features decides what it sees. A feature activated later wraps one
activated earlier.


## Open types

2 fields are carried as open values rather than typed structures.
This follows from the API definition, not from a gap in this SDK: the
definition describes them with untagged unions —
`oneOf`/`anyOf` branches with no `discriminator` — so it never states which
variant a given value is. Nothing can select a branch reliably, so the SDK
passes the value through unchanged rather than assert a shape the API does not
guarantee.

| Entity | Field | Variants | Nesting |
| --- | --- | --- | --- |
| `tesseract_module` | `requests` | 5 | 15 levels |
| `tesseract_module` | `joins` | 3 | 7 levels |

These values round-trip unchanged — read them, modify them, send them back. If
the API adds a `discriminator` to the definition, regenerating will type them.
Every other field is typed normally.

## Advanced

> The sections above cover everyday use. The material below explains the
> SDK's internals — useful when extending it with custom features, but not
> needed for normal use.

### The operation pipeline

Every entity operation follows a six-stage pipeline. Each stage fires a
feature hook before executing:

```
PrePoint → PreSpec → PreRequest → PreResponse → PreResult → PreDone
```

- **PrePoint**: Resolves which API endpoint to call based on the
  operation name and entity configuration.
- **PreSpec**: Builds the HTTP spec — URL, method, headers, body —
  from the resolved point and the caller's parameters.
- **PreRequest**: Sends the HTTP request. Features can intercept here
  to replace the transport (as TestFeature does with mocks).
- **PreResponse**: Parses the raw HTTP response.
- **PreResult**: Extracts the business data from the parsed response.
- **PreDone**: Final stage before returning to the caller. Entity
  state (match, data) is updated here.

If any stage errors, the pipeline short-circuits and the error surfaces
to the caller — see [Error handling](#error-handling) for how that looks
in this language.

### Features and hooks

Features are the extension mechanism. A feature is an object with a
`hooks` map. Each hook key is a pipeline stage name, and the value is
a function that receives the context.

The SDK ships with built-in features:

- **RatelimitFeature**: Client-side rate limiting via a token bucket
- **RetryFeature**: Automatic retry of transient failures with exponential backoff
- **TestFeature**: In-memory mock transport for testing without a live server
- **TimeoutFeature**: Per-request timeout with transport abort

Features are initialized in order. Hooks fire in the order features
were added, so later features can override earlier ones.

### Module structure

```
data-usa/
├── src/
│   ├── DataUsaSDK.ts        # Main SDK class
│   ├── entity/             # Entity implementations
│   ├── feature/            # Built-in features (Base, Test, Log)
│   └── utility/            # Utility functions
├── test/                   # Test suites
└── dist/                   # Compiled output
```

Import the SDK from the package root:

```ts
import { DataUsaSDK } from '@voxgig-sdk/data-usa-sdk'
```

### Entity state

Entity instances are stateful. After a successful `load`, the entity
stores the returned data and match criteria internally. Subsequent
calls on the same instance can rely on this state.

```ts
const routeindexget = client.RouteIndexGet()
await routeindexget.load()

// routeindexget.data() now returns the routeindexget data from the last `load`
// routeindexget.match() returns the last match criteria
```

Call `make()` to create a fresh instance with the same configuration
but no stored state.

### Direct vs entity access

The entity interface handles URL construction, parameter placement,
and response parsing automatically. Use it for standard CRUD operations.

The `direct` method gives full control over the HTTP request. Use it
for non-standard endpoints, bulk operations, or any path not modelled
as an entity. The `prepare` method is useful for debugging — it
shows exactly what `direct` would send.


## Full Reference

See [REFERENCE.md](REFERENCE.md) for complete API reference
documentation including all method signatures, entity field schemas,
and detailed usage examples.
