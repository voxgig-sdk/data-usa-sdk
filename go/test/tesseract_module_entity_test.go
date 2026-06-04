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

func TestTesseractModuleEntity(t *testing.T) {
	t.Run("instance", func(t *testing.T) {
		testsdk := sdk.TestSDK(nil, nil)
		ent := testsdk.TesseractModule(nil)
		if ent == nil {
			t.Fatal("expected non-nil TesseractModuleEntity")
		}
	})

	t.Run("basic", func(t *testing.T) {
		setup := tesseract_moduleBasicSetup(nil)
		// Per-op sdk-test-control.json skip — basic test exercises a flow
		// with multiple ops; skipping any op skips the whole flow.
		_mode := "unit"
		if setup.live {
			_mode = "live"
		}
		for _, _op := range []string{"create", "load"} {
			if _shouldSkip, _reason := isControlSkipped("entityOp", "tesseract_module." + _op, _mode); _shouldSkip {
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
			t.Skip("live entity test uses synthetic IDs from fixture — set DATAUSA_TEST_TESSERACT_MODULE_ENTID JSON to run live")
			return
		}
		client := setup.client

		// CREATE
		tesseractModuleRef01Ent := client.TesseractModule(nil)
		tesseractModuleRef01Data := core.ToMapAny(vs.GetProp(
			vs.GetPath([]any{"new", "tesseract_module"}, setup.data), "tesseract_module_ref01"))
		tesseractModuleRef01Data["extension"] = setup.idmap["extension01"]

		tesseractModuleRef01DataResult, err := tesseractModuleRef01Ent.Create(tesseractModuleRef01Data, nil)
		if err != nil {
			t.Fatalf("create failed: %v", err)
		}
		tesseractModuleRef01Data = core.ToMapAny(tesseractModuleRef01DataResult)
		if tesseractModuleRef01Data == nil {
			t.Fatal("expected create result to be a map")
		}

		// LOAD
		tesseractModuleRef01MatchDt0 := map[string]any{}
		tesseractModuleRef01DataDt0Loaded, err := tesseractModuleRef01Ent.Load(tesseractModuleRef01MatchDt0, nil)
		if err != nil {
			t.Fatalf("load failed: %v", err)
		}
		if tesseractModuleRef01DataDt0Loaded == nil {
			t.Fatal("expected load result to be non-nil")
		}

	})
}

func tesseract_moduleBasicSetup(extra map[string]any) *entityTestSetup {
	loadEnvLocal()

	_, filename, _, _ := runtime.Caller(0)
	dir := filepath.Dir(filename)

	entityDataFile := filepath.Join(dir, "..", "..", ".sdk", "test", "entity", "tesseract_module", "TesseractModuleTestData.json")

	entityDataSource, err := os.ReadFile(entityDataFile)
	if err != nil {
		panic("failed to read tesseract_module test data: " + err.Error())
	}

	var entityData map[string]any
	if err := json.Unmarshal(entityDataSource, &entityData); err != nil {
		panic("failed to parse tesseract_module test data: " + err.Error())
	}

	options := map[string]any{}
	options["entity"] = entityData["existing"]

	client := sdk.TestSDK(options, extra)

	// Generate idmap via transform, matching TS pattern.
	idmap := vs.Transform(
		[]any{"tesseract_module01", "tesseract_module02", "tesseract_module03", "extension01"},
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
	entidEnvRaw := os.Getenv("DATAUSA_TEST_TESSERACT_MODULE_ENTID")
	idmapOverridden := entidEnvRaw != "" && strings.HasPrefix(strings.TrimSpace(entidEnvRaw), "{")

	env := envOverride(map[string]any{
		"DATAUSA_TEST_TESSERACT_MODULE_ENTID": idmap,
		"DATAUSA_TEST_LIVE":      "FALSE",
		"DATAUSA_TEST_EXPLAIN":   "FALSE",
	})

	idmapResolved := core.ToMapAny(env["DATAUSA_TEST_TESSERACT_MODULE_ENTID"])
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
