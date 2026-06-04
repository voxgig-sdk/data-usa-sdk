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

func TestEconomicComplexityModuleEntity(t *testing.T) {
	t.Run("instance", func(t *testing.T) {
		testsdk := sdk.TestSDK(nil, nil)
		ent := testsdk.EconomicComplexityModule(nil)
		if ent == nil {
			t.Fatal("expected non-nil EconomicComplexityModuleEntity")
		}
	})

	t.Run("basic", func(t *testing.T) {
		setup := economic_complexity_moduleBasicSetup(nil)
		// Per-op sdk-test-control.json skip — basic test exercises a flow
		// with multiple ops; skipping any op skips the whole flow.
		_mode := "unit"
		if setup.live {
			_mode = "live"
		}
		for _, _op := range []string{"load"} {
			if _shouldSkip, _reason := isControlSkipped("entityOp", "economic_complexity_module." + _op, _mode); _shouldSkip {
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
			t.Skip("live entity test uses synthetic IDs from fixture — set DATAUSA_TEST_ECONOMIC_COMPLEXITY_MODULE_ENTID JSON to run live")
			return
		}
		client := setup.client

		// Bootstrap entity data from existing test data (no create step in flow).
		economicComplexityModuleRef01DataRaw := vs.Items(core.ToMapAny(vs.GetPath("existing.economic_complexity_module", setup.data)))
		var economicComplexityModuleRef01Data map[string]any
		if len(economicComplexityModuleRef01DataRaw) > 0 {
			economicComplexityModuleRef01Data = core.ToMapAny(economicComplexityModuleRef01DataRaw[0][1])
		}
		// Discard guards against Go's unused-var check when the flow's steps
		// happen not to consume the bootstrap data (e.g. list-only flows).
		_ = economicComplexityModuleRef01Data

		// LOAD
		economicComplexityModuleRef01Ent := client.EconomicComplexityModule(nil)
		economicComplexityModuleRef01MatchDt0 := map[string]any{}
		economicComplexityModuleRef01DataDt0Loaded, err := economicComplexityModuleRef01Ent.Load(economicComplexityModuleRef01MatchDt0, nil)
		if err != nil {
			t.Fatalf("load failed: %v", err)
		}
		if economicComplexityModuleRef01DataDt0Loaded == nil {
			t.Fatal("expected load result to be non-nil")
		}

	})
}

func economic_complexity_moduleBasicSetup(extra map[string]any) *entityTestSetup {
	loadEnvLocal()

	_, filename, _, _ := runtime.Caller(0)
	dir := filepath.Dir(filename)

	entityDataFile := filepath.Join(dir, "..", "..", ".sdk", "test", "entity", "economic_complexity_module", "EconomicComplexityModuleTestData.json")

	entityDataSource, err := os.ReadFile(entityDataFile)
	if err != nil {
		panic("failed to read economic_complexity_module test data: " + err.Error())
	}

	var entityData map[string]any
	if err := json.Unmarshal(entityDataSource, &entityData); err != nil {
		panic("failed to parse economic_complexity_module test data: " + err.Error())
	}

	options := map[string]any{}
	options["entity"] = entityData["existing"]

	client := sdk.TestSDK(options, extra)

	// Generate idmap via transform, matching TS pattern.
	idmap := vs.Transform(
		[]any{"economic_complexity_module01", "economic_complexity_module02", "economic_complexity_module03", "complexity01", "complexity02", "complexity03"},
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
	entidEnvRaw := os.Getenv("DATAUSA_TEST_ECONOMIC_COMPLEXITY_MODULE_ENTID")
	idmapOverridden := entidEnvRaw != "" && strings.HasPrefix(strings.TrimSpace(entidEnvRaw), "{")

	env := envOverride(map[string]any{
		"DATAUSA_TEST_ECONOMIC_COMPLEXITY_MODULE_ENTID": idmap,
		"DATAUSA_TEST_LIVE":      "FALSE",
		"DATAUSA_TEST_EXPLAIN":   "FALSE",
	})

	idmapResolved := core.ToMapAny(env["DATAUSA_TEST_ECONOMIC_COMPLEXITY_MODULE_ENTID"])
	if idmapResolved == nil {
		idmapResolved = core.ToMapAny(idmap)
	}

	if env["DATAUSA_TEST_LIVE"] == "TRUE" {
		mergedOpts := vs.Merge([]any{
			map[string]any{
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
