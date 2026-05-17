# DataUsa Golang SDK

The Golang SDK for the DataUsa API. Provides an entity-oriented interface using standard Go conventions — no generics required, data flows as `map[string]any`.


## Install
```bash
go get github.com/voxgig-sdk/data-usa-sdk/go
```

If the module is not yet published to a registry, use a `replace` directive
in your `go.mod` to point to a local checkout:

```bash
go mod edit -replace github.com/voxgig-sdk/data-usa-sdk/go=../path/to/github.com/voxgig-sdk/data-usa-sdk/go
```


## Tutorial: your first API call

This tutorial walks through creating a client, listing entities, and
loading a specific record.

### 1. Create a client

```go
package main

import (
    "fmt"
    "os"

    sdk "github.com/voxgig-sdk/data-usa-sdk/go"
    "github.com/voxgig-sdk/data-usa-sdk/go/core"
)

func main() {
    client := sdk.NewDataUsaSDK(map[string]any{
        "apikey": os.Getenv("DATA-USA_APIKEY"),
    })
```

### 3. Load a calculationsmodule

```go
    result, err = client.CalculationsModule(nil).Load(
        map[string]any{"id": "example_id"}, nil,
    )
    if err != nil {
        panic(err)
    }

    rm = core.ToMapAny(result)
    if rm["ok"] == true {
        fmt.Println(rm["data"])
    }
}
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
client := sdk.TestSDK(nil, nil)

result, err := client.Planet(nil).Load(
    map[string]any{"id": "test01"}, nil,
)
// result contains mock response data
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
DATA-USA_TEST_LIVE=TRUE
DATA-USA_APIKEY=<your-key>
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
| `"apikey"` | `string` | API key for authentication. |
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
| `EconomicComplexityModule` | `(data map[string]any) DataUsaEntity` | Create a EconomicComplexityModule entity instance. |
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
| `Update` | `(reqdata, ctrl map[string]any) (any, error)` | Update an existing entity. |
| `Remove` | `(reqmatch, ctrl map[string]any) (any, error)` | Remove an entity. |
| `Data` | `(args ...any) any` | Get or set entity data. |
| `Match` | `(args ...any) any` | Get or set entity match criteria. |
| `Make` | `() Entity` | Create a new instance with the same options. |
| `GetName` | `() string` | Return the entity name. |

### Result shape

Entity operations return `(any, error)`. The `any` value is a
`map[string]any` with these keys:

| Key | Type | Description |
| --- | --- | --- |
| `"ok"` | `bool` | `true` if the HTTP status is 2xx. |
| `"status"` | `int` | HTTP status code. |
| `"headers"` | `map[string]any` | Response headers. |
| `"data"` | `any` | Parsed JSON response body. |

On error, `"ok"` is `false` and `"err"` contains the error value.

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
result, err := client.CalculationsModule(nil).Load(map[string]any{"id": "calculations_module_id"}, nil)
```


### EconomicComplexityModule

Create an instance: `economic_complexity_module := client.EconomicComplexityModule(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `Load(match, ctrl)` | Load a single entity by match criteria. |

#### Example: Load

```go
result, err := client.EconomicComplexityModule(nil).Load(map[string]any{"id": "economic_complexity_module_id"}, nil)
```


### Health

Create an instance: `health := client.Health(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `Load(match, ctrl)` | Load a single entity by match criteria. |

#### Example: Load

```go
result, err := client.Health(nil).Load(map[string]any{"id": "health_id"}, nil)
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
| `annotation` | ``$OBJECT`` |  |
| `caption` | ``$STRING`` |  |
| `name` | ``$STRING`` |  |
| `type` | ``$STRING`` |  |

#### Example: List

```go
results, err := client.Member(nil).List(nil, nil)
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
| `debug` | ``$ANY`` |  |
| `module` | ``$STRING`` |  |
| `status` | ``$STRING`` |  |
| `version` | ``$STRING`` |  |

#### Example: Load

```go
result, err := client.ModuleStatus(nil).Load(map[string]any{"id": "module_status_id"}, nil)
```


### RouteIndexGet

Create an instance: `route_index_get := client.RouteIndexGet(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `Load(match, ctrl)` | Load a single entity by match criteria. |

#### Example: Load

```go
result, err := client.RouteIndexGet(nil).Load(map[string]any{"id": "route_index_get_id"}, nil)
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
| `annotation` | ``$OBJECT`` |  |
| `caption` | ``$STRING`` |  |
| `dimension` | ``$ARRAY`` |  |
| `measure` | ``$ARRAY`` |  |
| `name` | ``$STRING`` |  |

#### Example: Load

```go
result, err := client.TesseractCube(nil).Load(map[string]any{"id": "tesseract_cube_id"}, nil)
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
| `join` | ``$ARRAY`` |  |
| `pagination` | ``$OBJECT`` |  |
| `request` | ``$ARRAY`` |  |

#### Example: Load

```go
result, err := client.TesseractModule(nil).Load(map[string]any{"id": "tesseract_module_id"}, nil)
```

#### Example: Create

```go
result, err := client.TesseractModule(nil).Create(map[string]any{
    "request": /* `$ARRAY` */,
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
| `annotation` | ``$OBJECT`` |  |
| `caption` | ``$STRING`` |  |
| `dimension` | ``$ARRAY`` |  |
| `measure` | ``$ARRAY`` |  |
| `name` | ``$STRING`` |  |

#### Example: List

```go
results, err := client.TesseractSchema(nil).List(nil, nil)
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
error is returned to the caller. An unexpected panic triggers the
`PreUnexpected` hook.

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
moon := client.Moon(nil)
moon.Load(map[string]any{"planet_id": "earth", "id": "luna"}, nil)

// moon.Data() now returns the loaded moon data
// moon.Match() returns the last match criteria
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
