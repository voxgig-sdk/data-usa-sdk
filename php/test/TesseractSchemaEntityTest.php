<?php
declare(strict_types=1);

// TesseractSchema entity test

require_once __DIR__ . '/../datausa_sdk.php';
require_once __DIR__ . '/Runner.php';

use PHPUnit\Framework\TestCase;
use Voxgig\Struct\Struct as Vs;

class TesseractSchemaEntityTest extends TestCase
{
    public function test_create_instance(): void
    {
        $testsdk = DataUsaSDK::test(null, null);
        $ent = $testsdk->TesseractSchema(null);
        $this->assertNotNull($ent);
    }

    public function test_basic_flow(): void
    {
        $setup = tesseract_schema_basic_setup(null);
        // Per-op sdk-test-control.json skip.
        $_live = !empty($setup["live"]);
        foreach (["list"] as $_op) {
            [$_shouldSkip, $_reason] = Runner::is_control_skipped("entityOp", "tesseract_schema." . $_op, $_live ? "live" : "unit");
            if ($_shouldSkip) {
                $this->markTestSkipped($_reason ?? "skipped via sdk-test-control.json");
                return;
            }
        }
        // The basic flow consumes synthetic IDs from the fixture. In live mode
        // without an *_ENTID env override, those IDs hit the live API and 4xx.
        if (!empty($setup["synthetic_only"])) {
            $this->markTestSkipped("live entity test uses synthetic IDs from fixture — set DATAUSA_TEST_TESSERACT_SCHEMA_ENTID JSON to run live");
            return;
        }
        $client = $setup["client"];

        // Bootstrap entity data from existing test data.
        $tesseract_schema_ref01_data_raw = Vs::items(Helpers::to_map(
            Vs::getpath($setup["data"], "existing.tesseract_schema")));
        $tesseract_schema_ref01_data = null;
        if (count($tesseract_schema_ref01_data_raw) > 0) {
            $tesseract_schema_ref01_data = Helpers::to_map($tesseract_schema_ref01_data_raw[0][1]);
        }

        // LIST
        $tesseract_schema_ref01_ent = $client->TesseractSchema(null);
        $tesseract_schema_ref01_match = [];

        $tesseract_schema_ref01_list_result = $tesseract_schema_ref01_ent->list($tesseract_schema_ref01_match, null);
        $this->assertIsArray($tesseract_schema_ref01_list_result);

    }
}

function tesseract_schema_basic_setup($extra)
{
    Runner::load_env_local();

    $entity_data_file = __DIR__ . '/../../.sdk/test/entity/tesseract_schema/TesseractSchemaTestData.json';
    $entity_data_source = file_get_contents($entity_data_file);
    $entity_data = json_decode($entity_data_source, true);

    $options = [];
    $options["entity"] = $entity_data["existing"];

    $client = DataUsaSDK::test($options, $extra);

    // Generate idmap.
    $idmap = [];
    foreach (["tesseract_schema01", "tesseract_schema02", "tesseract_schema03"] as $k) {
        $idmap[$k] = strtoupper($k);
    }

    // Detect ENTID env override before envOverride consumes it. When live
    // mode is on without a real override, the basic test runs against synthetic
    // IDs from the fixture and 4xx's. Surface this so the test can skip.
    $entid_env_raw = getenv("DATAUSA_TEST_TESSERACT_SCHEMA_ENTID");
    $idmap_overridden = $entid_env_raw !== false && str_starts_with(trim($entid_env_raw), "{");

    $env = Runner::env_override([
        "DATAUSA_TEST_TESSERACT_SCHEMA_ENTID" => $idmap,
        "DATAUSA_TEST_LIVE" => "FALSE",
        "DATAUSA_TEST_EXPLAIN" => "FALSE",
    ]);

    $idmap_resolved = Helpers::to_map(
        $env["DATAUSA_TEST_TESSERACT_SCHEMA_ENTID"]);
    if ($idmap_resolved === null) {
        $idmap_resolved = Helpers::to_map($idmap);
    }

    if ($env["DATAUSA_TEST_LIVE"] === "TRUE") {
        $merged_opts = Vs::merge([
            [
            ],
            $extra ?? [],
        ]);
        $client = new DataUsaSDK(Helpers::to_map($merged_opts));
    }

    $live = $env["DATAUSA_TEST_LIVE"] === "TRUE";
    return [
        "client" => $client,
        "data" => $entity_data,
        "idmap" => $idmap_resolved,
        "env" => $env,
        "explain" => $env["DATAUSA_TEST_EXPLAIN"] === "TRUE",
        "live" => $live,
        "synthetic_only" => $live && !$idmap_overridden,
        "now" => (int)(microtime(true) * 1000),
    ];
}
