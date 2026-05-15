package sdktest

import (
	"encoding/json"
	"os"
	"path/filepath"
	"runtime"
	"strings"
	"testing"
	"time"

	sdk "github.com/voxgig-sdk/data-usa-sdk"
	"github.com/voxgig-sdk/data-usa-sdk/core"

	vs "github.com/voxgig/struct"
)

func TestTesseractSchemaEntity(t *testing.T) {
	t.Run("instance", func(t *testing.T) {
		testsdk := sdk.TestSDK(nil, nil)
		ent := testsdk.TesseractSchema(nil)
		if ent == nil {
			t.Fatal("expected non-nil TesseractSchemaEntity")
		}
	})

	t.Run("basic", func(t *testing.T) {
		setup := tesseract_schemaBasicSetup(nil)
		// Per-op sdk-test-control.json skip — basic test exercises a flow
		// with multiple ops; skipping any op skips the whole flow.
		_mode := "unit"
		if setup.live {
			_mode = "live"
		}
		for _, _op := range []string{"list"} {
			if _shouldSkip, _reason := isControlSkipped("entityOp", "tesseract_schema." + _op, _mode); _shouldSkip {
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
			t.Skip("live entity test uses synthetic IDs from fixture — set DATAUSA_TEST_TESSERACT_SCHEMA_ENTID JSON to run live")
			return
		}
		client := setup.client

		// Bootstrap entity data from existing test data (no create step in flow).
		tesseractSchemaRef01DataRaw := vs.Items(core.ToMapAny(vs.GetPath("existing.tesseract_schema", setup.data)))
		var tesseractSchemaRef01Data map[string]any
		if len(tesseractSchemaRef01DataRaw) > 0 {
			tesseractSchemaRef01Data = core.ToMapAny(tesseractSchemaRef01DataRaw[0][1])
		}
		// Discard guards against Go's unused-var check when the flow's steps
		// happen not to consume the bootstrap data (e.g. list-only flows).
		_ = tesseractSchemaRef01Data

		// LIST
		tesseractSchemaRef01Ent := client.TesseractSchema(nil)
		tesseractSchemaRef01Match := map[string]any{}

		tesseractSchemaRef01ListResult, err := tesseractSchemaRef01Ent.List(tesseractSchemaRef01Match, nil)
		if err != nil {
			t.Fatalf("list failed: %v", err)
		}
		_, tesseractSchemaRef01ListOk := tesseractSchemaRef01ListResult.([]any)
		if !tesseractSchemaRef01ListOk {
			t.Fatalf("expected list result to be an array, got %T", tesseractSchemaRef01ListResult)
		}

	})
}

func tesseract_schemaBasicSetup(extra map[string]any) *entityTestSetup {
	loadEnvLocal()

	_, filename, _, _ := runtime.Caller(0)
	dir := filepath.Dir(filename)

	entityDataFile := filepath.Join(dir, "..", "..", ".sdk", "test", "entity", "tesseract_schema", "TesseractSchemaTestData.json")

	entityDataSource, err := os.ReadFile(entityDataFile)
	if err != nil {
		panic("failed to read tesseract_schema test data: " + err.Error())
	}

	var entityData map[string]any
	if err := json.Unmarshal(entityDataSource, &entityData); err != nil {
		panic("failed to parse tesseract_schema test data: " + err.Error())
	}

	options := map[string]any{}
	options["entity"] = entityData["existing"]

	client := sdk.TestSDK(options, extra)

	// Generate idmap via transform, matching TS pattern.
	idmap := vs.Transform(
		[]any{"tesseract_schema01", "tesseract_schema02", "tesseract_schema03"},
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
	entidEnvRaw := os.Getenv("DATAUSA_TEST_TESSERACT_SCHEMA_ENTID")
	idmapOverridden := entidEnvRaw != "" && strings.HasPrefix(strings.TrimSpace(entidEnvRaw), "{")

	env := envOverride(map[string]any{
		"DATAUSA_TEST_TESSERACT_SCHEMA_ENTID": idmap,
		"DATAUSA_TEST_LIVE":      "FALSE",
		"DATAUSA_TEST_EXPLAIN":   "FALSE",
		"DATAUSA_APIKEY":         "NONE",
	})

	idmapResolved := core.ToMapAny(env["DATAUSA_TEST_TESSERACT_SCHEMA_ENTID"])
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
