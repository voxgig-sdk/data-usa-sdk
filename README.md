# DataUsa SDK

Query DataUSA's aggregated US public-data cubes through a Tesseract OLAP backend

> TypeScript, Python, PHP, Golang, Ruby, Lua SDKs, a CLI, an interactive REPL, and an MCP server for AI agents — all generated from one OpenAPI spec by [@voxgig/sdkgen](https://github.com/voxgig/sdkgen).

## About FastAPI

[DataUSA](https://datausa.io) bills itself as the most comprehensive visualisation engine for US public-government data, covering places, occupations, industries and education. It is run as a partnership between Deloitte, [Datawheel](https://www.datawheel.us/) and MIT Media Lab professor Cesar Hidalgo.

This SDK targets the public Tesseract OLAP server at `honduras.datausa.io`, which is the backend that powers DataUSA visualisations. [Tesseract](https://www.datawheel.us/) is Datawheel's OLAP engine that exposes multidimensional data cubes (schemas, cubes, dimensions, measures, members) over a REST API for drilldown / cut / measure queries.

What you can do through the API:
- Discover the available schemas, cubes and modules served by the instance.
- Inspect cube metadata — dimensions, hierarchies, levels and measures.
- List members of a level (e.g. the set of US states, industries, occupations).
- Run economic-complexity and calculation modules that DataUSA layers on top of the cubes.
- Check service health and module status before issuing larger queries.

The endpoint is a read-only public service with no documented authentication. It is a shared community resource — be considerate with query volume and prefer narrow drilldowns and cuts over wide scans.

## Try it

**TypeScript**
```bash
npm install data-usa
```

**Python**
```bash
pip install data-usa-sdk
```

**PHP**
```bash
composer require voxgig/data-usa-sdk
```

**Golang**
```bash
go get github.com/voxgig-sdk/data-usa-sdk/go
```

**Ruby**
```bash
gem install data-usa-sdk
```

**Lua**
```bash
luarocks install data-usa-sdk
```

## 30-second quickstart

### TypeScript

```ts
import { DataUsaSDK } from 'data-usa'

const client = new DataUsaSDK({})

```

See the [TypeScript README](ts/README.md) for the
full guide, or scroll down for the same example in other languages.

## What's in the box

| Surface | Use it for | Path |
| --- | --- | --- |
| **SDK** (TypeScript, Python, PHP, Golang, Ruby, Lua) | App integration | `ts/` `py/` `php/` `go/` `rb/` `lua/` |
| **CLI** | Scripts, CI, ops, one-off API calls | `go-cli/` |
| **MCP server** | AI agents (Claude, Cursor, Cline) | `go-mcp/` |

## Use it from an AI agent (MCP)

The generated MCP server exposes every operation in this SDK as an
[MCP](https://modelcontextprotocol.io) tool that Claude, Cursor or Cline
can call directly. Build and register it:

```bash
cd go-mcp && go build -o data-usa-mcp .
```

Then add it to your agent's MCP config (Claude Desktop, Cursor, etc.):

```json
{
  "mcpServers": {
    "data-usa": {
      "command": "/abs/path/to/data-usa-mcp"
    }
  }
}
```

## Entities

The API exposes 9 entities:

| Entity | Description | API path |
| --- | --- | --- |
| **CalculationsModule** | Endpoints for Tesseract's calculations module, which applies derived computations (growth, share, RCA, etc.) on top of cube measures. | `/calcs/merge.{extension}` |
| **EconomicComplexityModule** | Economic-complexity analytics (ECI, PCI, relatedness, opportunity gain) over trade / industry cubes — a signature DataUSA / Datawheel feature. | `/complexity/eci_subnational.{extension}` |
| **Health** | Service health-check endpoint used to verify the Tesseract server is up and responsive. | `/_health` |
| **Member** | Lookup of the members of a dimension level (e.g. the list of states, counties, NAICS industries) for a given cube. | `/tesseract/members` |
| **ModuleStatus** | Reports which Tesseract modules (calculations, economic complexity, etc.) are loaded and available on this instance. | `/calcs/` |
| **RouteIndexGet** | Root index route that lists the available top-level routes / modules on the Tesseract server. | `/` |
| **TesseractCube** | Metadata and data-query routes for an individual OLAP cube — dimensions, hierarchies, levels and measures, plus drilldown / cut / measure queries. | `/complexity/cubes/{cube_name}` |
| **TesseractModule** | Generic Tesseract module discovery endpoint describing which extension modules the server exposes. | `/tesseract/multiquery.{extension}` |
| **TesseractSchema** | Top-level schema description listing the cubes and shared dimensions served by this Tesseract instance. | `/complexity/cubes` |

Each entity supports the following operations where available: **load**,
**list**, **create**, **update**, and **remove**.

## Quickstart in other languages

### Python

```python
from datausa_sdk import DataUsaSDK

client = DataUsaSDK({})


# Load a specific calculationsmodule
calculationsmodule, err = client.CalculationsModule(None).load(
    {"id": "example_id"}, None
)
```

### PHP

```php
<?php
require_once 'datausa_sdk.php';

$client = new DataUsaSDK([]);


// Load a specific calculationsmodule
[$calculationsmodule, $err] = $client->CalculationsModule(null)->load(
    ["id" => "example_id"], null
);
```

### Golang

```go
import sdk "github.com/voxgig-sdk/data-usa-sdk/go"

client := sdk.NewDataUsaSDK(map[string]any{})

```

### Ruby

```ruby
require_relative "DataUsa_sdk"

client = DataUsaSDK.new({})


# Load a specific calculationsmodule
calculationsmodule, err = client.CalculationsModule(nil).load(
  { "id" => "example_id" }, nil
)
```

### Lua

```lua
local sdk = require("data-usa_sdk")

local client = sdk.new({})


-- Load a specific calculationsmodule
local calculationsmodule, err = client:CalculationsModule(nil):load(
  { id = "example_id" }, nil
)
```

## Unit testing in offline mode

Every SDK ships a test mode that swaps the HTTP transport for an
in-memory mock, so unit tests run offline.

### TypeScript

```ts
const client = DataUsaSDK.test()
const result = await client.CalculationsModule().load({ id: 'test01' })
// result.ok === true, result.data contains mock data
```

### Python

```python
client = DataUsaSDK.test(None, None)
result, err = client.CalculationsModule(None).load(
    {"id": "test01"}, None
)
```

### PHP

```php
$client = DataUsaSDK::test(null, null);
[$result, $err] = $client->CalculationsModule(null)->load(
    ["id" => "test01"], null
);
```

### Golang

```go
client := sdk.TestSDK(nil, nil)
result, err := client.CalculationsModule(nil).Load(
    map[string]any{"id": "test01"}, nil,
)
```

### Ruby

```ruby
client = DataUsaSDK.test(nil, nil)
result, err = client.CalculationsModule(nil).load(
  { "id" => "test01" }, nil
)
```

### Lua

```lua
local client = sdk.test(nil, nil)
local result, err = client:CalculationsModule(nil):load(
  { id = "test01" }, nil
)
```

## How it works

Every SDK call runs the same five-stage pipeline:

1. **Point** — resolve the API endpoint from the operation definition.
2. **Spec** — build the HTTP specification (URL, method, headers, body).
3. **Request** — send the HTTP request.
4. **Response** — receive and parse the response.
5. **Result** — extract the result data for the caller.

A feature hook fires at each stage (e.g. `PrePoint`, `PreSpec`,
`PreRequest`), so features can inspect or modify the pipeline without
forking the SDK.

### Features

| Feature | Purpose |
| --- | --- |
| **TestFeature** | In-memory mock transport for testing without a live server |

Pass custom features via the `extend` option at construction time.

### Direct and Prepare

For endpoints the entity model doesn't cover, use the low-level methods:

- **`direct(fetchargs)`** — build and send an HTTP request in one step.
- **`prepare(fetchargs)`** — build the request without sending it.

Both accept a map with `path`, `method`, `params`, `query`,
`headers`, and `body`. See the [How-to guides](#how-to-guides) below.

## How-to guides

### Make a direct API call

When the entity interface does not cover an endpoint, use `direct`:

**TypeScript:**
```ts
const result = await client.direct({
  path: '/api/resource/{id}',
  method: 'GET',
  params: { id: 'example' },
})
console.log(result.data)
```

**Python:**
```python
result, err = client.direct({
    "path": "/api/resource/{id}",
    "method": "GET",
    "params": {"id": "example"},
})
```

**PHP:**
```php
[$result, $err] = $client->direct([
    "path" => "/api/resource/{id}",
    "method" => "GET",
    "params" => ["id" => "example"],
]);
```

**Go:**
```go
result, err := client.Direct(map[string]any{
    "path":   "/api/resource/{id}",
    "method": "GET",
    "params": map[string]any{"id": "example"},
})
```

**Ruby:**
```ruby
result, err = client.direct({
  "path" => "/api/resource/{id}",
  "method" => "GET",
  "params" => { "id" => "example" },
})
```

**Lua:**
```lua
local result, err = client:direct({
  path = "/api/resource/{id}",
  method = "GET",
  params = { id = "example" },
})
```

## Per-language documentation

- [TypeScript](ts/README.md)
- [Python](py/README.md)
- [PHP](php/README.md)
- [Golang](go/README.md)
- [Ruby](rb/README.md)
- [Lua](lua/README.md)

## Using the FastAPI

- Upstream: [https://datausa.io](https://datausa.io)
- API docs: [https://datausa.io/about/api](https://datausa.io/about/api)

- Underlying datasets are aggregated US public / government data sources surfaced by DataUSA.
- DataUSA is a collaboration between Deloitte, Datawheel and Cesar Hidalgo (MIT Media Lab); attribution to DataUSA and the original data publishers is expected.
- No explicit licence is published on the Tesseract endpoint itself — review datausa.io terms before redistribution.
- The visualisation stack uses the open-source D3plus engine from Datawheel.

---

Generated from the FastAPI OpenAPI spec by [@voxgig/sdkgen](https://github.com/voxgig/sdkgen).
