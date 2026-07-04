# DataUsa PHP SDK



The PHP SDK for the DataUsa API — an entity-oriented client using PHP conventions.

> Other languages, the CLI, and MCP server live alongside this one — see
> the [top-level README](../README.md).


## Install
This package is not yet published to Packagist. Install it from the
GitHub release tag (`php/vX.Y.Z`):

- Releases: [https://github.com/voxgig-sdk/data-usa-sdk/releases](https://github.com/voxgig-sdk/data-usa-sdk/releases)


## Tutorial: your first API call

This tutorial walks through creating a client, listing entities, and
loading a specific record.

### 1. Create a client

```php
<?php
require_once 'datausa_sdk.php';

$client = new DataUsaSDK();
```

### 3. Load a calculationsmodule

```php
try {
    $result = $client->calculationsmodule()->load(["id" => "example_id"]);
    print_r($result);
} catch (\Exception $err) {
    echo "Error: " . $err->getMessage();
}
```


## How-to guides

### Make a direct HTTP request

For endpoints not covered by entity methods:

```php
// direct() is the raw-HTTP escape hatch: it returns a result array
// (it does not throw). Branch on $result["ok"].
$result = $client->direct([
    "path" => "/api/resource/{id}",
    "method" => "GET",
    "params" => ["id" => "example"],
]);

if ($result["ok"]) {
    echo $result["status"];  // 200
    print_r($result["data"]);  // response body
} else {
    echo "Error: " . $result["err"]->getMessage();
}
```

### Prepare a request without sending it

```php
// prepare() throws on error and returns the fetch definition.
$fetchdef = $client->prepare([
    "path" => "/api/resource/{id}",
    "method" => "DELETE",
    "params" => ["id" => "example"],
]);

echo $fetchdef["url"];
echo $fetchdef["method"];
print_r($fetchdef["headers"]);
```

### Use test mode

Create a mock client for unit testing — no server required:

```php
$client = DataUsaSDK::test();

$result = $client->calculationsmodule()->load(["id" => "test01"]);
// $result contains mock response data
```

### Use a custom fetch function

Replace the HTTP transport with your own function:

```php
$mock_fetch = function ($url, $init) {
    return [
        [
            "status" => 200,
            "statusText" => "OK",
            "headers" => [],
            "json" => function () { return ["id" => "mock01"]; },
        ],
        null,
    ];
};

$client = new DataUsaSDK([
    "base" => "http://localhost:8080",
    "system" => [
        "fetch" => $mock_fetch,
    ],
]);
```

### Run live tests

Create a `.env.local` file at the project root:

```
DATA_USA_TEST_LIVE=TRUE
```

Then run:

```bash
cd php && ./vendor/bin/phpunit test/
```


## Reference

### DataUsaSDK

```php
require_once 'datausa_sdk.php';
$client = new DataUsaSDK($options);
```

Creates a new SDK client.

| Option | Type | Description |
| --- | --- | --- |
| `base` | `string` | Base URL of the API server. |
| `prefix` | `string` | URL path prefix prepended to all requests. |
| `suffix` | `string` | URL path suffix appended to all requests. |
| `feature` | `array` | Feature activation flags. |
| `extend` | `array` | Additional Feature instances to load. |
| `system` | `array` | System overrides (e.g. custom `fetch` callable). |

### test

```php
$client = DataUsaSDK::test($testopts, $sdkopts);
```

Creates a test-mode client with mock transport. Both arguments may be `null`.

### DataUsaSDK methods

| Method | Signature | Description |
| --- | --- | --- |
| `options_map` | `(): array` | Deep copy of current SDK options. |
| `get_utility` | `(): Utility` | Copy of the SDK utility object. |
| `prepare` | `(array $fetchargs): array` | Build an HTTP request definition without sending. |
| `direct` | `(array $fetchargs): array` | Build and send an HTTP request. |
| `CalculationsModule` | `($data): CalculationsModuleEntity` | Create a CalculationsModule entity instance. |
| `EconomicComplexityModule` | `($data): EconomicComplexityModuleEntity` | Create a EconomicComplexityModule entity instance. |
| `Health` | `($data): HealthEntity` | Create a Health entity instance. |
| `Member` | `($data): MemberEntity` | Create a Member entity instance. |
| `ModuleStatus` | `($data): ModuleStatusEntity` | Create a ModuleStatus entity instance. |
| `RouteIndexGet` | `($data): RouteIndexGetEntity` | Create a RouteIndexGet entity instance. |
| `TesseractCube` | `($data): TesseractCubeEntity` | Create a TesseractCube entity instance. |
| `TesseractModule` | `($data): TesseractModuleEntity` | Create a TesseractModule entity instance. |
| `TesseractSchema` | `($data): TesseractSchemaEntity` | Create a TesseractSchema entity instance. |

### Entity interface

All entities share the same interface.

| Method | Signature | Description |
| --- | --- | --- |
| `load` | `($reqmatch, $ctrl): array` | Load a single entity by match criteria. |
| `list` | `($reqmatch, $ctrl): array` | List entities matching the criteria. |
| `create` | `($reqdata, $ctrl): array` | Create a new entity. |
| `update` | `($reqdata, $ctrl): array` | Update an existing entity. |
| `remove` | `($reqmatch, $ctrl): array` | Remove an entity. |
| `data_get` | `(): array` | Get entity data. |
| `data_set` | `($data): void` | Set entity data. |
| `match_get` | `(): array` | Get entity match criteria. |
| `match_set` | `($match): void` | Set entity match criteria. |
| `make` | `(): Entity` | Create a new instance with the same options. |
| `get_name` | `(): string` | Return the entity name. |

### Result shape

Entity operations return the bare result data (an `array` for single-entity
ops, a `list` for `list`) and throw on error. Wrap calls in
`try`/`catch` to handle failures.

The `direct()` escape hatch never throws — it returns a result `array`
you branch on via `$result["ok"]`:

| Key | Type | Description |
| --- | --- | --- |
| `ok` | `bool` | `true` if the HTTP status is 2xx. |
| `status` | `int` | HTTP status code. |
| `headers` | `array` | Response headers. |
| `data` | `mixed` | Parsed JSON response body. |

On error, `ok` is `false` and `$err` contains the error value.

### Entities

#### CalculationsModule

| Field | Description |
| --- | --- |

Operations: Load.

API path: `/calcs/merge.{extension}`

#### EconomicComplexityModule

| Field | Description |
| --- | --- |

Operations: Load.

API path: `/complexity/eci_subnational.{extension}`

#### Health

| Field | Description |
| --- | --- |

Operations: Load.

API path: `/_health`

#### Member

| Field | Description |
| --- | --- |
| `annotation` |  |
| `caption` |  |
| `name` |  |
| `type` |  |

Operations: List.

API path: `/tesseract/members`

#### ModuleStatus

| Field | Description |
| --- | --- |
| `debug` |  |
| `module` |  |
| `status` |  |
| `version` |  |

Operations: Load.

API path: `/calcs/`

#### RouteIndexGet

| Field | Description |
| --- | --- |

Operations: Load.

API path: `/`

#### TesseractCube

| Field | Description |
| --- | --- |
| `annotation` |  |
| `caption` |  |
| `dimension` |  |
| `measure` |  |
| `name` |  |

Operations: Load.

API path: `/complexity/cubes/{cube_name}`

#### TesseractModule

| Field | Description |
| --- | --- |
| `join` |  |
| `pagination` |  |
| `request` |  |

Operations: Create, Load.

API path: `/tesseract/multiquery.{extension}`

#### TesseractSchema

| Field | Description |
| --- | --- |
| `annotation` |  |
| `caption` |  |
| `dimension` |  |
| `measure` |  |
| `name` |  |

Operations: List.

API path: `/complexity/cubes`



## Entities


### CalculationsModule

Create an instance: `const calculations_module = client.calculations_module`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Example: Load

```ts
const calculations_module = await client.calculations_module.load({ id: 'calculations_module_id' })
```


### EconomicComplexityModule

Create an instance: `const economic_complexity_module = client.economic_complexity_module`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Example: Load

```ts
const economic_complexity_module = await client.economic_complexity_module.load({ id: 'economic_complexity_module_id' })
```


### Health

Create an instance: `const health = client.health`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Example: Load

```ts
const health = await client.health.load({ id: 'health_id' })
```


### Member

Create an instance: `const member = client.member`

#### Operations

| Method | Description |
| --- | --- |
| `list(match)` | List entities matching the criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `annotation` | ``$OBJECT`` |  |
| `caption` | ``$STRING`` |  |
| `name` | ``$STRING`` |  |
| `type` | ``$STRING`` |  |

#### Example: List

```ts
const members = await client.member.list()
```


### ModuleStatus

Create an instance: `const module_status = client.module_status`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `debug` | ``$ANY`` |  |
| `module` | ``$STRING`` |  |
| `status` | ``$STRING`` |  |
| `version` | ``$STRING`` |  |

#### Example: Load

```ts
const module_status = await client.module_status.load({ id: 'module_status_id' })
```


### RouteIndexGet

Create an instance: `const route_index_get = client.route_index_get`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Example: Load

```ts
const route_index_get = await client.route_index_get.load({ id: 'route_index_get_id' })
```


### TesseractCube

Create an instance: `const tesseract_cube = client.tesseract_cube`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `annotation` | ``$OBJECT`` |  |
| `caption` | ``$STRING`` |  |
| `dimension` | ``$ARRAY`` |  |
| `measure` | ``$ARRAY`` |  |
| `name` | ``$STRING`` |  |

#### Example: Load

```ts
const tesseract_cube = await client.tesseract_cube.load({ id: 'tesseract_cube_id' })
```


### TesseractModule

Create an instance: `const tesseract_module = client.tesseract_module`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `join` | ``$ARRAY`` |  |
| `pagination` | ``$OBJECT`` |  |
| `request` | ``$ARRAY`` |  |

#### Example: Load

```ts
const tesseract_module = await client.tesseract_module.load({ id: 'tesseract_module_id' })
```

#### Example: Create

```ts
const tesseract_module = await client.tesseract_module.create({
  request: /* `$ARRAY` */,
})
```


### TesseractSchema

Create an instance: `const tesseract_schema = client.tesseract_schema`

#### Operations

| Method | Description |
| --- | --- |
| `list(match)` | List entities matching the criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `annotation` | ``$OBJECT`` |  |
| `caption` | ``$STRING`` |  |
| `dimension` | ``$ARRAY`` |  |
| `measure` | ``$ARRAY`` |  |
| `name` | ``$STRING`` |  |

#### Example: List

```ts
const tesseract_schemas = await client.tesseract_schema.list()
```


## Explanation

### The operation pipeline

Every entity operation (load, list, create, update, remove) follows a
six-stage pipeline. Each stage fires a feature hook before executing:

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

If any stage returns an error, the pipeline short-circuits and the
error is returned to the caller as the second element in the return array.

### Features and hooks

Features are the extension mechanism. A feature is a PHP class
with hook methods named after pipeline stages (e.g. `PrePoint`,
`PreSpec`). Each method receives the context.

The SDK ships with built-in features:

- **TestFeature**: In-memory mock transport for testing without a live server

Features are initialized in order. Hooks fire in the order features
were added, so later features can override earlier ones.

### Data as arrays

The PHP SDK uses plain PHP associative arrays throughout rather than typed
objects. This mirrors the dynamic nature of the API and keeps the
SDK flexible — no code generation is needed when the API schema
changes.

Use `Helpers::to_map()` to safely validate that a value is an array.

### Directory structure

```
php/
├── datausa_sdk.php          -- Main SDK class
├── config.php                     -- Configuration
├── features.php                   -- Feature factory
├── core/                          -- Core types and context
├── entity/                        -- Entity implementations
├── feature/                       -- Built-in features (Base, Test, Log)
├── utility/                       -- Utility functions and struct library
└── test/                          -- Test suites
```

The main class (`datausa_sdk.php`) exports the SDK class
and test helper. Import entity or utility modules directly only
when needed.

### Entity state

Entity instances are stateful. After a successful `load`, the entity
stores the returned data and match criteria internally.

```php
$calculationsmodule = $client->calculationsmodule();
$calculationsmodule->load(["id" => "example_id"]);

// $calculationsmodule->dataGet() now returns the loaded calculationsmodule data
// $calculationsmodule->matchGet() returns the last match criteria
```

Call `make()` to create a fresh instance with the same configuration
but no stored state.

### Direct vs entity access

The entity interface handles URL construction, parameter placement,
and response parsing automatically. Use it for standard CRUD operations.

`direct()` gives full control over the HTTP request. Use it for
non-standard endpoints, bulk operations, or any path not modelled as
an entity. `prepare()` builds the request without sending it — useful
for debugging or custom transport.


## Full Reference

See [REFERENCE.md](REFERENCE.md) for complete API reference
documentation including all method signatures, entity field schemas,
and detailed usage examples.
