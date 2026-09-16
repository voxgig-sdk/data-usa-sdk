# FastAPI

The FastAPI API.

## Start here

This guide introduces the API, the client libraries, and the companion tools in this repository. Start with the API capabilities, choose a client for your application, and use the linked reference when you need exact request and response details.

The selected API surface contains 9 entities and 35 HTTP routes. There are 6 SDK targets and 2 companion tools.

An entity groups related API operations. An operation can have several routes with different inputs or authentication requirements. The SDK exposes the entity and its operations using the conventions of the selected language.

## What the API provides

### CalculationsModule

Results: Successful Response.

SDK operations: `load`.

### EconomicComplexityModule

Results: Successful Response.

SDK operations: `load`.

### Health

Results: Successful Response.

SDK operations: `load`.

### Member

Results: Successful Response.

SDK operations: `list`.

Key fields to recognise:

- `type`: Types of the data the user can expect to find in the associated column.

### ModuleStatus

Results: Successful Response.

SDK operations: `load`.

### RouteIndexGet

SDK operations: `load`.

### TesseractCube

Results: Successful Response.

SDK operations: `load`.

### TesseractModule

Results: Successful Response.

SDK operations: `create`, `load`.

Key fields to recognise:

- `pagination`: Pagination instructions.

### TesseractSchema

Results: Successful Response.

SDK operations: `list`.

### Route map

Use this map to locate a capability. Consult the entity reference before supplying request data; routes for the same operation can require different fields.

| Entity | SDK operation | HTTP route | Authentication |
| --- | --- | --- | --- |
| CalculationsModule | `load` | `GET /calcs/merge.{extension}` | See reference |
| CalculationsModule | `load` | `GET /calcs/pums.{extension}` | See reference |
| CalculationsModule | `load` | `GET /calcs/acs.{extension}` | See reference |
| EconomicComplexityModule | `load` | `GET /complexity/eci_subnational.{extension}` | See reference |
| EconomicComplexityModule | `load` | `GET /complexity/pci_subnational.{extension}` | See reference |
| EconomicComplexityModule | `load` | `GET /complexity/relatedness_subnational.{extension}` | See reference |
| EconomicComplexityModule | `load` | `GET /complexity/relative_relatedness_subnational.{extension}` | See reference |
| EconomicComplexityModule | `load` | `GET /complexity/rca_historical.{extension}` | See reference |
| EconomicComplexityModule | `load` | `GET /complexity/rca_subnational.{extension}` | See reference |
| EconomicComplexityModule | `load` | `GET /complexity/peii.{extension}` | See reference |
| EconomicComplexityModule | `load` | `GET /complexity/pgi.{extension}` | See reference |
| EconomicComplexityModule | `load` | `GET /complexity/eci.{extension}` | See reference |
| EconomicComplexityModule | `load` | `GET /complexity/pci.{extension}` | See reference |
| EconomicComplexityModule | `load` | `GET /complexity/opportunity_gain.{extension}` | See reference |
| EconomicComplexityModule | `load` | `GET /complexity/relatedness.{extension}` | See reference |
| EconomicComplexityModule | `load` | `GET /complexity/relative_relatedness.{extension}` | See reference |
| EconomicComplexityModule | `load` | `GET /complexity/rca.{extension}` | See reference |
| EconomicComplexityModule | `load` | `GET /complexity/{endpoint}` | See reference |
| Health | `load` | `GET /_health` | See reference |
| Member | `list` | `GET /tesseract/members` | See reference |
| ModuleStatus | `load` | `GET /calcs/` | See reference |
| ModuleStatus | `load` | `GET /complexity/` | See reference |
| ModuleStatus | `load` | `GET /tesseract/` | See reference |
| RouteIndexGet | `load` | `GET /` | See reference |
| TesseractCube | `load` | `GET /complexity/cubes/{cube_name}` | See reference |
| TesseractCube | `load` | `GET /tesseract/cubes/{cube_name}` | See reference |
| TesseractModule | `create` | `POST /tesseract/multiquery.{extension}` | See reference |
| TesseractModule | `load` | `GET /tesseract/debug/query` | See reference |
| TesseractModule | `load` | `GET /tesseract/data.{extension}` | See reference |
| TesseractModule | `load` | `GET /tesseract/debug/flush` | See reference |
| TesseractModule | `load` | `GET /tesseract/debug/schema` | See reference |
| TesseractModule | `load` | `GET /tesseract/members.{extension}` | See reference |
| TesseractModule | `load` | `GET /tesseract/data` | See reference |
| TesseractSchema | `list` | `GET /complexity/cubes` | See reference |
| TesseractSchema | `list` | `GET /tesseract/cubes` | See reference |

## Connect to the API

- API server: `https://honduras.datausa.io`

Check authentication for the route you plan to call. A route that declares no authentication can be used without credentials; this does not change the requirements of other routes. Keep credentials in environment variables or a configured secret provider, and keep them out of source control and logs.

## Make a first request

1. Choose the API server and an operation that matches your task.
2. Check the operation’s required input and authentication. Use values valid for your account and environment.
3. Send one request and inspect the returned data before adding retries, concurrency, or a larger batch.

For an SDK call, install or build the chosen client, create a client instance with its documented configuration, and call the required entity operation. Language references describe the argument shape, asynchronous behaviour, and returned values.

## Choose an SDK

Choose the language already used by your application or service. The clients represent the same API model, while package setup, naming, and return types follow each language. Check the selected client’s reference and tests before integrating it into an existing application.

| Client | Repository directory | Distribution |
| --- | --- | --- |
| Golang | `go/` | Build from source |
| Lua | `lua/` | Build from source |
| PHP | `php/` | Build from source |
| Python | `py/` | Build from source |
| Ruby | `rb/` | Build from source |
| TypeScript | `ts/` | Build from source |

Build-from-source entries are not marked as published in the project model. Follow the build instructions in that target’s README, then consume the resulting package using your language’s local dependency mechanism. Published entries give the installation command recorded for that client.

## Companion tools

These targets provide another way to use the API. Their available commands or tools can cover a smaller set of operations than the client libraries.

### Go CLI

Use the command-line interface for shell-based tasks and scripts.

Repository directory: `go-cli/`. Not published. Build from the go-cli directory.


### Go MCP server

Use the MCP server to expose supported API operations to an MCP client.

Repository directory: `go-mcp/`. Not published. Build from the go-mcp directory.

- `data-usa_list`: List records for an entity. Supported entities: `member`, `tesseract_schema`.
- `data-usa_load`: Load one record for an entity. Supported entities: `calculations_module`, `economic_complexity_module`, `health`, `module_status`, `route_index_get`, `tesseract_cube`, `tesseract_module`.

## Operational features

Features supply behaviour around API calls, such as request handling, diagnostics, or local testing. Inclusion in this project does not mean a feature is enabled at runtime. Check the selected SDK’s supported features and configuration defaults, then enable the behaviour your application needs.

- `ratelimit`: Client-side rate limiting via a token bucket
- `retry`: Automatic retry of transient failures with exponential backoff
- `test`: In-memory mock transport for testing without a live server
- `timeout`: Per-request timeout with transport abort

Start with the default client configuration. Add request limits and diagnostics as needed, test error paths, and review retry behaviour before using operations that change data. A retry can repeat an operation unless the API provides a suitable guarantee.

## Continue with the documentation

- Follow the first-call guide for the setup sequence.
- Read the authentication guide before using protected routes.
- Use the API reference for request schemas, response formats, and status codes.
- Check the chosen SDK or companion tool reference for its configuration and supported operations.

