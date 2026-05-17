package sdktest

import (
	"encoding/json"
	"os"
	"path/filepath"
	"runtime"
	"strings"
	"testing"
	"time"

	sdk "github.com/voxgig-sdk/data-usa-sdk/go"
	"github.com/voxgig-sdk/data-usa-sdk/go/core"

	vs "github.com/voxgig-sdk/data-usa-sdk/go/utility/struct"
)

func TestRouteIndexGetEntity(t *testing.T) {
	t.Run("instance", func(t *testing.T) {
		testsdk := sdk.TestSDK(nil, nil)
		ent := testsdk.RouteIndexGet(nil)
		if ent == nil {
			t.Fatal("expected non-nil RouteIndexGetEntity")
		}
	})

	t.Run("basic", func(t *testing.T) {
		setup := route_index_getBasicSetup(nil)
		// Per-op sdk-test-control.json skip — basic test exercises a flow
		// with multiple ops; skipping any op skips the whole flow.
		_mode := "unit"
		if setup.live {
			_mode = "live"
		}
		for _, _op := range []string{"load"} {
			if _shouldSkip, _reason := isControlSkipped("entityOp", "route_index_get." + _op, _mode); _shouldSkip {
				if _reason == "" {
					_reason = "skipped via sdk-test-control.json"
				}
				t.Skip(_reason)
				return
			}
		}
		// The basic flow consumes synthetic IDs from the fixture. In live mode
		// without an *_ENTID env override, those IDs hit the live API and 4xx.
		if setup.syntheticOnly {
			t.Skip("live entity test uses synthetic IDs from fixture — set DATAUSA_TEST_ROUTE_INDEX_GET_ENTID JSON to run live")
			return
		}
		client := setup.client

		// Bootstrap entity data from existing test data (no create step in flow).
		routeIndexGetRef01DataRaw := vs.Items(core.ToMapAny(vs.GetPath("existing.route_index_get", setup.data)))
		var routeIndexGetRef01Data map[string]any
		if len(routeIndexGetRef01DataRaw) > 0 {
			routeIndexGetRef01Data = core.ToMapAny(routeIndexGetRef01DataRaw[0][1])
		}
		// Discard guards against Go's unused-var check when the flow's steps
		// happen not to consume the bootstrap data (e.g. list-only flows).
		_ = routeIndexGetRef01Data

		// LOAD
		routeIndexGetRef01Ent := client.RouteIndexGet(nil)
		routeIndexGetRef01MatchDt0 := map[string]any{}
		routeIndexGetRef01DataDt0Loaded, err := routeIndexGetRef01Ent.Load(routeIndexGetRef01MatchDt0, nil)
		if err != nil {
			t.Fatalf("load failed: %v", err)
		}
		if routeIndexGetRef01DataDt0Loaded == nil {
			t.Fatal("expected load result to be non-nil")
		}

	})
}

func route_index_getBasicSetup(extra map[string]any) *entityTestSetup {
	loadEnvLocal()

	_, filename, _, _ := runtime.Caller(0)
	dir := filepath.Dir(filename)

	entityDataFile := filepath.Join(dir, "..", "..", ".sdk", "test", "entity", "route_index_get", "RouteIndexGetTestData.json")

	entityDataSource, err := os.ReadFile(entityDataFile)
	if err != nil {
		panic("failed to read route_index_get test data: " + err.Error())
	}

	var entityData map[string]any
	if err := json.Unmarshal(entityDataSource, &entityData); err != nil {
		panic("failed to parse route_index_get test data: " + err.Error())
	}

	options := map[string]any{}
	options["entity"] = entityData["existing"]

	client := sdk.TestSDK(options, extra)

	// Generate idmap via transform, matching TS pattern.
	idmap := vs.Transform(
		[]any{"route_index_get01", "route_index_get02", "route_index_get03"},
		map[string]any{
			"`$PACK`": []any{"", map[string]any{
				"`$KEY`": "`$COPY`",
				"`$VAL`": []any{"`$FORMAT`", "upper", "`$COPY`"},
			}},
		},
	)

	// Detect ENTID env override before envOverride consumes it. When live
	// mode is on without a real override, the basic test runs against synthetic
	// IDs from the fixture and 4xx's. Surface this so the test can skip.
	entidEnvRaw := os.Getenv("DATAUSA_TEST_ROUTE_INDEX_GET_ENTID")
	idmapOverridden := entidEnvRaw != "" && strings.HasPrefix(strings.TrimSpace(entidEnvRaw), "{")

	env := envOverride(map[string]any{
		"DATAUSA_TEST_ROUTE_INDEX_GET_ENTID": idmap,
		"DATAUSA_TEST_LIVE":      "FALSE",
		"DATAUSA_TEST_EXPLAIN":   "FALSE",
		"DATAUSA_APIKEY":         "NONE",
	})

	idmapResolved := core.ToMapAny(env["DATAUSA_TEST_ROUTE_INDEX_GET_ENTID"])
	if idmapResolved == nil {
		idmapResolved = core.ToMapAny(idmap)
	}

	if env["DATAUSA_TEST_LIVE"] == "TRUE" {
		mergedOpts := vs.Merge([]any{
			map[string]any{
				"apikey": env["DATAUSA_APIKEY"],
			},
			extra,
		})
		client = sdk.NewDataUsaSDK(core.ToMapAny(mergedOpts))
	}

	live := env["DATAUSA_TEST_LIVE"] == "TRUE"
	return &entityTestSetup{
		client:        client,
		data:          entityData,
		idmap:         idmapResolved,
		env:           env,
		explain:       env["DATAUSA_TEST_EXPLAIN"] == "TRUE",
		live:          live,
		syntheticOnly: live && !idmapOverridden,
		now:           time.Now().UnixMilli(),
	}
}
