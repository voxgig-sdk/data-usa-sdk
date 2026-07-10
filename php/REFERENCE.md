# DataUsa PHP SDK Reference

Complete API reference for the DataUsa PHP SDK.


## DataUsaSDK

### Constructor

```php
require_once __DIR__ . '/datausa_sdk.php';

$client = new DataUsaSDK($options);
```

Create a new SDK client instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `$options` | `array` | SDK configuration options. |
| `$options["base"]` | `string` | Base URL for API requests. |
| `$options["prefix"]` | `string` | URL prefix appended after base. |
| `$options["suffix"]` | `string` | URL suffix appended after path. |
| `$options["headers"]` | `array` | Custom headers for all requests. |
| `$options["feature"]` | `array` | Feature configuration. |
| `$options["system"]` | `array` | System overrides (e.g. custom fetch). |


### Static Methods

#### `DataUsaSDK::test($testopts = null, $sdkopts = null)`

Create a test client with mock features active. Both arguments may be `null`.

```php
$client = DataUsaSDK::test();
```


### Instance Methods

#### `CalculationsModule($data = null)`

Create a new `CalculationsModuleEntity` instance. Pass `null` for no initial data.

#### `EconomicComplexityModule($data = null)`

Create a new `EconomicComplexityModuleEntity` instance. Pass `null` for no initial data.

#### `Health($data = null)`

Create a new `HealthEntity` instance. Pass `null` for no initial data.

#### `Member($data = null)`

Create a new `MemberEntity` instance. Pass `null` for no initial data.

#### `ModuleStatus($data = null)`

Create a new `ModuleStatusEntity` instance. Pass `null` for no initial data.

#### `RouteIndexGet($data = null)`

Create a new `RouteIndexGetEntity` instance. Pass `null` for no initial data.

#### `TesseractCube($data = null)`

Create a new `TesseractCubeEntity` instance. Pass `null` for no initial data.

#### `TesseractModule($data = null)`

Create a new `TesseractModuleEntity` instance. Pass `null` for no initial data.

#### `TesseractSchema($data = null)`

Create a new `TesseractSchemaEntity` instance. Pass `null` for no initial data.

#### `options_map(): array`

Return a deep copy of the current SDK options.

#### `get_utility(): DataUsaUtility`

Return a copy of the SDK utility object.

#### `direct(array $fetchargs = []): array`

Make a direct HTTP request to any API endpoint. This is the raw-HTTP escape
hatch: it does **not** throw. It returns a result array
`["ok" => bool, "status" => int, "headers" => array, "data" => mixed]`, or
`["ok" => false, "err" => \Exception]` on failure. Branch on `$result["ok"]`.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `$fetchargs["path"]` | `string` | URL path with optional `{param}` placeholders. |
| `$fetchargs["method"]` | `string` | HTTP method (default: `"GET"`). |
| `$fetchargs["params"]` | `array` | Path parameter values for `{param}` substitution. |
| `$fetchargs["query"]` | `array` | Query string parameters. |
| `$fetchargs["headers"]` | `array` | Request headers (merged with defaults). |
| `$fetchargs["body"]` | `mixed` | Request body (arrays are JSON-serialized). |
| `$fetchargs["ctrl"]` | `array` | Control options. |

**Returns:** `array` — the result dict (see above); never throws.

#### `prepare(array $fetchargs = []): mixed`

Prepare a fetch definition without sending the request. Returns the
`$fetchdef` array. Throws on error.


---

## CalculationsModuleEntity

```php
$calculations_module = $client->CalculationsModule();
```

### Operations

#### `load(array $reqmatch, ?array $ctrl = null): mixed`

Load a single entity matching the given criteria. Throws on error.

```php
$result = $client->CalculationsModule()->load(["extension" => "extension"]);
```

### Common Methods

#### `data_get(): array`

Get the entity data. Returns a copy of the current data.

#### `data_set($data): void`

Set the entity data.

#### `match_get(): array`

Get the entity match criteria.

#### `match_set($match): void`

Set the entity match criteria.

#### `make(): CalculationsModuleEntity`

Create a new `CalculationsModuleEntity` instance with the same client and
options.

#### `get_name(): string`

Return the entity name.


---

## EconomicComplexityModuleEntity

```php
$economic_complexity_module = $client->EconomicComplexityModule();
```

### Operations

#### `load(array $reqmatch, ?array $ctrl = null): mixed`

Load a single entity matching the given criteria. Throws on error.

```php
$result = $client->EconomicComplexityModule()->load();
```

### Common Methods

#### `data_get(): array`

Get the entity data. Returns a copy of the current data.

#### `data_set($data): void`

Set the entity data.

#### `match_get(): array`

Get the entity match criteria.

#### `match_set($match): void`

Set the entity match criteria.

#### `make(): EconomicComplexityModuleEntity`

Create a new `EconomicComplexityModuleEntity` instance with the same client and
options.

#### `get_name(): string`

Return the entity name.


---

## HealthEntity

```php
$health = $client->Health();
```

### Operations

#### `load(array $reqmatch, ?array $ctrl = null): mixed`

Load a single entity matching the given criteria. Throws on error.

```php
$result = $client->Health()->load();
```

### Common Methods

#### `data_get(): array`

Get the entity data. Returns a copy of the current data.

#### `data_set($data): void`

Set the entity data.

#### `match_get(): array`

Get the entity match criteria.

#### `match_set($match): void`

Set the entity match criteria.

#### `make(): HealthEntity`

Create a new `HealthEntity` instance with the same client and
options.

#### `get_name(): string`

Return the entity name.


---

## MemberEntity

```php
$member = $client->Member();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `annotation` | `array` | Yes |  |
| `caption` | `string` | Yes |  |
| `name` | `string` | Yes |  |
| `type` | `string` | Yes |  |

### Operations

#### `list(?array $reqmatch = null, ?array $ctrl = null): mixed`

List entities matching the given criteria (call with no argument to list all). Returns an array. Throws on error.

```php
$results = $client->Member()->list();
```

### Common Methods

#### `data_get(): array`

Get the entity data. Returns a copy of the current data.

#### `data_set($data): void`

Set the entity data.

#### `match_get(): array`

Get the entity match criteria.

#### `match_set($match): void`

Set the entity match criteria.

#### `make(): MemberEntity`

Create a new `MemberEntity` instance with the same client and
options.

#### `get_name(): string`

Return the entity name.


---

## ModuleStatusEntity

```php
$module_status = $client->ModuleStatus();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `debug` | `mixed` | Yes |  |
| `module` | `string` | Yes |  |
| `status` | `string` | Yes |  |
| `version` | `string` | Yes |  |

### Operations

#### `load(array $reqmatch, ?array $ctrl = null): mixed`

Load a single entity matching the given criteria. Throws on error.

```php
$result = $client->ModuleStatus()->load();
```

### Common Methods

#### `data_get(): array`

Get the entity data. Returns a copy of the current data.

#### `data_set($data): void`

Set the entity data.

#### `match_get(): array`

Get the entity match criteria.

#### `match_set($match): void`

Set the entity match criteria.

#### `make(): ModuleStatusEntity`

Create a new `ModuleStatusEntity` instance with the same client and
options.

#### `get_name(): string`

Return the entity name.


---

## RouteIndexGetEntity

```php
$route_index_get = $client->RouteIndexGet();
```

### Operations

#### `load(array $reqmatch, ?array $ctrl = null): mixed`

Load a single entity matching the given criteria. Throws on error.

```php
$result = $client->RouteIndexGet()->load();
```

### Common Methods

#### `data_get(): array`

Get the entity data. Returns a copy of the current data.

#### `data_set($data): void`

Set the entity data.

#### `match_get(): array`

Get the entity match criteria.

#### `match_set($match): void`

Set the entity match criteria.

#### `make(): RouteIndexGetEntity`

Create a new `RouteIndexGetEntity` instance with the same client and
options.

#### `get_name(): string`

Return the entity name.


---

## TesseractCubeEntity

```php
$tesseract_cube = $client->TesseractCube();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `annotation` | `array` | Yes |  |
| `caption` | `string` | Yes |  |
| `dimension` | `array` | Yes |  |
| `measure` | `array` | Yes |  |
| `name` | `string` | Yes |  |

### Operations

#### `load(array $reqmatch, ?array $ctrl = null): mixed`

Load a single entity matching the given criteria. Throws on error.

```php
$result = $client->TesseractCube()->load(["id" => "tesseract_cube_id"]);
```

### Common Methods

#### `data_get(): array`

Get the entity data. Returns a copy of the current data.

#### `data_set($data): void`

Set the entity data.

#### `match_get(): array`

Get the entity match criteria.

#### `match_set($match): void`

Set the entity match criteria.

#### `make(): TesseractCubeEntity`

Create a new `TesseractCubeEntity` instance with the same client and
options.

#### `get_name(): string`

Return the entity name.


---

## TesseractModuleEntity

```php
$tesseract_module = $client->TesseractModule();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `join` | `array` | No |  |
| `pagination` | `array` | No |  |
| `request` | `array` | Yes |  |

### Operations

#### `create(array $reqdata, ?array $ctrl = null): mixed`

Create a new entity with the given data. Throws on error.

```php
$result = $client->TesseractModule()->create([
  "extension" => null, // string
]);
```

#### `load(array $reqmatch, ?array $ctrl = null): mixed`

Load a single entity matching the given criteria. Throws on error.

```php
$result = $client->TesseractModule()->load();
```

### Common Methods

#### `data_get(): array`

Get the entity data. Returns a copy of the current data.

#### `data_set($data): void`

Set the entity data.

#### `match_get(): array`

Get the entity match criteria.

#### `match_set($match): void`

Set the entity match criteria.

#### `make(): TesseractModuleEntity`

Create a new `TesseractModuleEntity` instance with the same client and
options.

#### `get_name(): string`

Return the entity name.


---

## TesseractSchemaEntity

```php
$tesseract_schema = $client->TesseractSchema();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `annotation` | `array` | Yes |  |
| `caption` | `string` | Yes |  |
| `dimension` | `array` | Yes |  |
| `measure` | `array` | Yes |  |
| `name` | `string` | Yes |  |

### Operations

#### `list(?array $reqmatch = null, ?array $ctrl = null): mixed`

List entities matching the given criteria (call with no argument to list all). Returns an array. Throws on error.

```php
$results = $client->TesseractSchema()->list();
```

### Common Methods

#### `data_get(): array`

Get the entity data. Returns a copy of the current data.

#### `data_set($data): void`

Set the entity data.

#### `match_get(): array`

Get the entity match criteria.

#### `match_set($match): void`

Set the entity match criteria.

#### `make(): TesseractSchemaEntity`

Create a new `TesseractSchemaEntity` instance with the same client and
options.

#### `get_name(): string`

Return the entity name.


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `test` | 0.0.1 | In-memory mock transport for testing without a live server |


Features are activated via the `feature` option:

```php
$client = new DataUsaSDK([
  "feature" => [
    "test" => ["active" => true],
  ],
]);
```

