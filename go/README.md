# DataUsa Golang SDK



The Golang SDK for the DataUsa API — an entity-oriented client using standard Go conventions. No generics required; data flows as `map[string]any`.

It exposes the API as capitalised, semantic **Entities** — e.g. `client.CalculationsModule(nil)` — each with the same small set of operations (`List`, `Load`, `Create`) instead of raw URL paths and query strings. You call meaning, not endpoints, which keeps the cognitive load low.

> Other languages, the CLI, and MCP server live alongside this one — see
> the [top-level README](../README.md).


## Install
```bash
go get github.com/voxgig-sdk/data-usa-sdk/go@latest
```

The Go module proxy resolves the version from the `go/vX.Y.Z` GitHub
release tag — see [Releases](https://github.com/voxgig-sdk/data-usa-sdk/releases) for the available versions.

To vendor from a local checkout instead, clone this repo alongside your
project and add a `replace` directive pointing at the checked-out
`go/` directory:

```bash
go mod edit -replace github.com/voxgig-sdk/data-usa-sdk/go=../data-usa-sdk/go
```


## Tutorial: your first API call

This tutorial walks through creating a client, listing entities, and
loading a specific record.

### Quickstart

A complete program: create a client, then call the entity operations.
Each operation returns `(value, error)` — the value is the data itself
(there is no `{ok, data}` wrapper), so check `err` and use the value
directly.

```go
package main

import (
    "fmt"
    sdk "github.com/voxgig-sdk/data-usa-sdk/go"
)

func main() {
    client := sdk.New()

    // Load a single calculationsmodule — the value is the loaded record.
    calculationsmodule, err := client.CalculationsModule(nil).Load(nil, nil)
    if err != nil {
        panic(err)
    }
    fmt.Println(calculationsmodule)
}
```


## Error handling

Every entity operation returns `(value, error)`. Check `err` before
using the value — there is no exception to catch:

```go
calculationsmodule, err := client.CalculationsModule(nil).Load(nil, nil)
if err != nil {
    // handle err
    return
}
_ = calculationsmodule
```

`Direct` follows the same `(value, error)` convention:

```go
result, err := client.Direct(map[string]any{
    "path":   "/api/resource/{id}",
    "method": "GET",
    "params": map[string]any{"id": "example_id"},
})
if err != nil {
    // handle err
}
_ = result
```


## How-to guides

### Make a direct HTTP request

For endpoints not covered by entity methods:

```go
result, err := client.Direct(map[string]any{
    "path":   "/api/resource/{id}",
    "method": "GET",
    "params": map[string]any{"id": "example"},
})
if err != nil {
    panic(err)
}

if result["ok"] == true {
    fmt.Println(result["status"]) // 200
    fmt.Println(result["data"])   // response body
}
```

### Prepare a request without sending it

```go
fetchdef, err := client.Prepare(map[string]any{
    "path":   "/api/resource/{id}",
    "method": "DELETE",
    "params": map[string]any{"id": "example"},
})
if err != nil {
    panic(err)
}

fmt.Println(fetchdef["url"])
fmt.Println(fetchdef["method"])
fmt.Println(fetchdef["headers"])
```

### Use test mode

Create a mock client for unit testing — no server required:

```go
client := sdk.Test()

calculationsmodule, err := client.CalculationsModule(nil).Load(
    nil, nil,
)
if err != nil {
    panic(err)
}
fmt.Println(calculationsmodule) // the returned mock data
```

### Use a custom fetch function

Replace the HTTP transport with your own function:

```go
mockFetch := func(url string, init map[string]any) (map[string]any, error) {
    return map[string]any{
        "status":     200,
        "statusText": "OK",
        "headers":    map[string]any{},
        "json": (func() any)(func() any {
            return map[string]any{"id": "mock01"}
        }),
    }, nil
}

client := sdk.NewDataUsaSDK(map[string]any{
    "base": "http://localhost:8080",
    "system": map[string]any{
        "fetch": (func(string, map[string]any) (map[string]any, error))(mockFetch),
    },
})
```

### Run live tests

Create a `.env.local` file at the project root:

```
DATA_USA_TEST_LIVE=TRUE
```

Then run:

```bash
cd go && go test ./test/...
```


## Reference

### NewDataUsaSDK

```go
func NewDataUsaSDK(options map[string]any) *DataUsaSDK
```

Creates a new SDK client.

| Option | Type | Description |
| --- | --- | --- |
| `"base"` | `string` | Base URL of the API server. |
| `"prefix"` | `string` | URL path prefix prepended to all requests. |
| `"suffix"` | `string` | URL path suffix appended to all requests. |
| `"feature"` | `map[string]any` | Feature activation flags. |
| `"extend"` | `[]any` | Additional Feature instances to load. |
| `"system"` | `map[string]any` | System overrides (e.g. custom `"fetch"` function). |

### TestSDK

```go
func TestSDK(testopts map[string]any, sdkopts map[string]any) *DataUsaSDK
```

Creates a test-mode client with mock transport. Both arguments may be `nil`.

### DataUsaSDK methods

| Method | Signature | Description |
| --- | --- | --- |
| `OptionsMap` | `() map[string]any` | Deep copy of current SDK options. |
| `GetUtility` | `() *Utility` | Copy of the SDK utility object. |
| `Prepare` | `(fetchargs map[string]any) (map[string]any, error)` | Build an HTTP request definition without sending. |
| `Direct` | `(fetchargs map[string]any) (map[string]any, error)` | Build and send an HTTP request. |
| `CalculationsModule` | `(data map[string]any) DataUsaEntity` | Create a CalculationsModule entity instance. |
| `EconomicComplexityModule` | `(data map[string]any) DataUsaEntity` | Create an EconomicComplexityModule entity instance. |
| `Health` | `(data map[string]any) DataUsaEntity` | Create a Health entity instance. |
| `Member` | `(data map[string]any) DataUsaEntity` | Create a Member entity instance. |
| `ModuleStatus` | `(data map[string]any) DataUsaEntity` | Create a ModuleStatus entity instance. |
| `RouteIndexGet` | `(data map[string]any) DataUsaEntity` | Create a RouteIndexGet entity instance. |
| `TesseractCube` | `(data map[string]any) DataUsaEntity` | Create a TesseractCube entity instance. |
| `TesseractModule` | `(data map[string]any) DataUsaEntity` | Create a TesseractModule entity instance. |
| `TesseractSchema` | `(data map[string]any) DataUsaEntity` | Create a TesseractSchema entity instance. |

### Entity interface (DataUsaEntity)

All entities implement the `DataUsaEntity` interface.

| Method | Signature | Description |
| --- | --- | --- |
| `Load` | `(reqmatch, ctrl map[string]any) (any, error)` | Load a single entity by match criteria. |
| `List` | `(reqmatch, ctrl map[string]any) (any, error)` | List entities matching the criteria. |
| `Create` | `(reqdata, ctrl map[string]any) (any, error)` | Create a new entity. |
| `Data` | `(args ...any) any` | Get or set entity data. |
| `Match` | `(args ...any) any` | Get or set entity match criteria. |
| `Make` | `() Entity` | Create a new instance with the same options. |
| `GetName` | `() string` | Return the entity name. |

### Result shape

Entity operations return `(value, error)`. The `value` is the
operation's data **directly** — there is no wrapper:

| Operation | `value` |
| --- | --- |
| `Load` / `Create` | the entity record (`map[string]any`) |
| `List` | a `[]any` of entity records |

Check `err` first, then use the value directly (or the typed
`...Typed` variants, which return the entity's model struct and a typed
slice):

    calculationsmodule, err := client.CalculationsModule(nil).Load(nil, nil)
    if err != nil { /* handle */ }
    // calculationsmodule is the returned record

Only `Direct()` returns a response envelope — a `map[string]any` with
`"ok"`, `"status"`, `"headers"`, and `"data"` keys.

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
| `"annotation"` |  |
| `"caption"` |  |
| `"name"` |  |
| `"type"` |  |

Operations: List.

API path: `/tesseract/members`

#### ModuleStatus

| Field | Description |
| --- | --- |
| `"debug"` |  |
| `"module"` |  |
| `"status"` |  |
| `"version"` |  |

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
| `"annotation"` |  |
| `"caption"` |  |
| `"dimension"` |  |
| `"measure"` |  |
| `"name"` |  |

Operations: Load.

API path: `/complexity/cubes/{cube_name}`

#### TesseractModule

| Field | Description |
| --- | --- |
| `"join"` |  |
| `"pagination"` |  |
| `"request"` |  |

Operations: Create, Load.

API path: `/tesseract/multiquery.{extension}`

#### TesseractSchema

| Field | Description |
| --- | --- |
| `"annotation"` |  |
| `"caption"` |  |
| `"dimension"` |  |
| `"measure"` |  |
| `"name"` |  |

Operations: List.

API path: `/complexity/cubes`



## Entities


### CalculationsModule

Create an instance: `calculations_module := client.CalculationsModule(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `Load(match, ctrl)` | Load a single entity by match criteria. |

#### Example: Load

```go
calculations_module, err := client.CalculationsModule(nil).Load(nil, nil)
if err != nil {
    panic(err)
}
fmt.Println(calculations_module) // the loaded record
```


### EconomicComplexityModule

Create an instance: `economic_complexity_module := client.EconomicComplexityModule(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `Load(match, ctrl)` | Load a single entity by match criteria. |

#### Example: Load

```go
economic_complexity_module, err := client.EconomicComplexityModule(nil).Load(nil, nil)
if err != nil {
    panic(err)
}
fmt.Println(economic_complexity_module) // the loaded record
```


### Health

Create an instance: `health := client.Health(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `Load(match, ctrl)` | Load a single entity by match criteria. |

#### Example: Load

```go
health, err := client.Health(nil).Load(nil, nil)
if err != nil {
    panic(err)
}
fmt.Println(health) // the loaded record
```


### Member

Create an instance: `member := client.Member(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `List(match, ctrl)` | List entities matching the criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `annotation` | `map[string]any` |  |
| `caption` | `string` |  |
| `name` | `string` |  |
| `type` | `string` |  |

#### Example: List

```go
members, err := client.Member(nil).List(nil, nil)
if err != nil {
    panic(err)
}
fmt.Println(members) // the array of records
```


### ModuleStatus

Create an instance: `module_status := client.ModuleStatus(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `Load(match, ctrl)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `debug` | `any` |  |
| `module` | `string` |  |
| `status` | `string` |  |
| `version` | `string` |  |

#### Example: Load

```go
module_status, err := client.ModuleStatus(nil).Load(nil, nil)
if err != nil {
    panic(err)
}
fmt.Println(module_status) // the loaded record
```


### RouteIndexGet

Create an instance: `route_index_get := client.RouteIndexGet(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `Load(match, ctrl)` | Load a single entity by match criteria. |

#### Example: Load

```go
route_index_get, err := client.RouteIndexGet(nil).Load(nil, nil)
if err != nil {
    panic(err)
}
fmt.Println(route_index_get) // the loaded record
```


### TesseractCube

Create an instance: `tesseract_cube := client.TesseractCube(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `Load(match, ctrl)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `annotation` | `map[string]any` |  |
| `caption` | `string` |  |
| `dimension` | `[]any` |  |
| `measure` | `[]any` |  |
| `name` | `string` |  |

#### Example: Load

```go
tesseract_cube, err := client.TesseractCube(nil).Load(map[string]any{"id": "tesseract_cube_id"}, nil)
if err != nil {
    panic(err)
}
fmt.Println(tesseract_cube) // the loaded record
```


### TesseractModule

Create an instance: `tesseract_module := client.TesseractModule(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `Create(data, ctrl)` | Create a new entity with the given data. |
| `Load(match, ctrl)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `join` | `[]any` |  |
| `pagination` | `map[string]any` |  |
| `request` | `[]any` |  |

#### Example: Load

```go
tesseract_module, err := client.TesseractModule(nil).Load(nil, nil)
if err != nil {
    panic(err)
}
fmt.Println(tesseract_module) // the loaded record
```

#### Example: Create

```go
result, err := client.TesseractModule(nil).Create(map[string]any{
    "request": /* []any */,
}, nil)
```


### TesseractSchema

Create an instance: `tesseract_schema := client.TesseractSchema(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `List(match, ctrl)` | List entities matching the criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `annotation` | `map[string]any` |  |
| `caption` | `string` |  |
| `dimension` | `[]any` |  |
| `measure` | `[]any` |  |
| `name` | `string` |  |

#### Example: List

```go
tesseract_schemas, err := client.TesseractSchema(nil).List(nil, nil)
if err != nil {
    panic(err)
}
fmt.Println(tesseract_schemas) // the array of records
```


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

Features are the extension mechanism. A feature implements the
`Feature` interface and provides hooks — functions keyed by pipeline
stage names.

The SDK ships with built-in features:

- **TestFeature**: In-memory mock transport for testing without a live server

Features are initialized in order. Hooks fire in the order features
were added, so later features can override earlier ones.

### Data as maps

The Go SDK uses `map[string]any` throughout rather than typed structs.
This mirrors the dynamic nature of the API and keeps the SDK
flexible — no code generation is needed when the API schema changes.

Use `core.ToMapAny()` to safely cast results and nested data.

### Package structure

```
github.com/voxgig-sdk/data-usa-sdk/go/
├── data-usa.go        # Root package — type aliases and constructors
├── core/               # SDK core — client, types, pipeline
├── entity/             # Entity implementations
├── feature/            # Built-in features (Base, Test, Log)
├── utility/            # Utility functions and struct library
└── test/               # Test suites
```

The root package (`github.com/voxgig-sdk/data-usa-sdk/go`) re-exports everything needed
for normal use. Import sub-packages only when you need specific types
like `core.ToMapAny`.

### Entity state

Entity instances are stateful. After a successful `Load`, the entity
stores the returned data and match criteria internally.

```go
calculationsmodule := client.CalculationsModule(nil)
calculationsmodule.Load(nil, nil)

// calculationsmodule.Data() now returns the calculationsmodule data from the last load
// calculationsmodule.Match() returns the last match criteria
```

Call `Make()` to create a fresh instance with the same configuration
but no stored state.

### Direct vs entity access

The entity interface handles URL construction, parameter placement,
and response parsing automatically. Use it for standard CRUD operations.

`Direct()` gives full control over the HTTP request. Use it for
non-standard endpoints, bulk operations, or any path not modelled as
an entity. `Prepare()` builds the request without sending it — useful
for debugging or custom transport.


## Full Reference

See [REFERENCE.md](REFERENCE.md) for complete API reference
documentation including all method signatures, entity field schemas,
and detailed usage examples.
