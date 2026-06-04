<?php
declare(strict_types=1);

// ModuleStatus entity test

require_once __DIR__ . '/../datausa_sdk.php';
require_once __DIR__ . '/Runner.php';

use PHPUnit\Framework\TestCase;
use Voxgig\Struct\Struct as Vs;

class ModuleStatusEntityTest extends TestCase
{
    public function test_create_instance(): void
    {
        $testsdk = DataUsaSDK::test(null, null);
        $ent = $testsdk->ModuleStatus(null);
        $this->assertNotNull($ent);
    }

    public function test_basic_flow(): void
    {
        $setup = module_status_basic_setup(null);
        // Per-op sdk-test-control.json skip.
        $_live = !empty($setup["live"]);
        foreach (["load"] as $_op) {
            [$_shouldSkip, $_reason] = Runner::is_control_skipped("entityOp", "module_status." . $_op, $_live ? "live" : "unit");
            if ($_shouldSkip) {
                $this->markTestSkipped($_reason ?? "skipped via sdk-test-control.json");
                return;
            }
        }
        // The basic flow consumes synthetic IDs from the fixture. In live mode
        // without an *_ENTID env override, those IDs hit the live API and 4xx.
        if (!empty($setup["synthetic_only"])) {
            $this->markTestSkipped("live entity test uses synthetic IDs from fixture — set DATAUSA_TEST_MODULE_STATUS_ENTID JSON to run live");
            return;
        }
        $client = $setup["client"];

        // Bootstrap entity data from existing test data.
        $module_status_ref01_data_raw = Vs::items(Helpers::to_map(
            Vs::getpath($setup["data"], "existing.module_status")));
        $module_status_ref01_data = null;
        if (count($module_status_ref01_data_raw) > 0) {
            $module_status_ref01_data = Helpers::to_map($module_status_ref01_data_raw[0][1]);
        }

        // LOAD
        $module_status_ref01_ent = $client->ModuleStatus(null);
        $module_status_ref01_match_dt0 = [];
        [$module_status_ref01_data_dt0_loaded, $err] = $module_status_ref01_ent->load($module_status_ref01_match_dt0, null);
        $this->assertNull($err);
        $this->assertNotNull($module_status_ref01_data_dt0_loaded);

    }
}

function module_status_basic_setup($extra)
{
    Runner::load_env_local();

    $entity_data_file = __DIR__ . '/../../.sdk/test/entity/module_status/ModuleStatusTestData.json';
    $entity_data_source = file_get_contents($entity_data_file);
    $entity_data = json_decode($entity_data_source, true);

    $options = [];
    $options["entity"] = $entity_data["existing"];

    $client = DataUsaSDK::test($options, $extra);

    // Generate idmap.
    $idmap = [];
    foreach (["module_status01", "module_status02", "module_status03"] as $k) {
        $idmap[$k] = strtoupper($k);
    }

    // Detect ENTID env override before envOverride consumes it. When live
    // mode is on without a real override, the basic test runs against synthetic
    // IDs from the fixture and 4xx's. Surface this so the test can skip.
    $entid_env_raw = getenv("DATAUSA_TEST_MODULE_STATUS_ENTID");
    $idmap_overridden = $entid_env_raw !== false && str_starts_with(trim($entid_env_raw), "{");

    $env = Runner::env_override([
        "DATAUSA_TEST_MODULE_STATUS_ENTID" => $idmap,
        "DATAUSA_TEST_LIVE" => "FALSE",
        "DATAUSA_TEST_EXPLAIN" => "FALSE",
    ]);

    $idmap_resolved = Helpers::to_map(
        $env["DATAUSA_TEST_MODULE_STATUS_ENTID"]);
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
