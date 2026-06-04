# TesseractModule entity test

import json
import os
import time

import pytest

from utility.voxgig_struct import voxgig_struct as vs
from datausa_sdk import DataUsaSDK
from core import helpers

_TEST_DIR = os.path.dirname(os.path.abspath(__file__))
from test import runner


class TestTesseractModuleEntity:

    def test_should_create_instance(self):
        testsdk = DataUsaSDK.test(None, None)
        ent = testsdk.TesseractModule(None)
        assert ent is not None

    def test_should_run_basic_flow(self):
        setup = _tesseract_module_basic_setup(None)
        # Per-op sdk-test-control.json skip — basic test exercises a flow with
        # multiple ops; skipping any one skips the whole flow (steps depend
        # on each other).
        _live = setup.get("live", False)
        for _op in ["create", "load"]:
            _skip, _reason = runner.is_control_skipped("entityOp", "tesseract_module." + _op, "live" if _live else "unit")
            if _skip:
                pytest.skip(_reason or "skipped via sdk-test-control.json")
                return
        # The basic flow consumes synthetic IDs from the fixture. In live mode
        # without an *_ENTID env override, those IDs hit the live API and 4xx.
        if setup.get("synthetic_only"):
            pytest.skip("live entity test uses synthetic IDs from fixture — "
                        "set DATAUSA_TEST_TESSERACT_MODULE_ENTID JSON to run live")
        client = setup["client"]

        # CREATE
        tesseract_module_ref01_ent = client.TesseractModule(None)
        tesseract_module_ref01_data = helpers.to_map(vs.getprop(
            vs.getpath(setup["data"], "new.tesseract_module"), "tesseract_module_ref01"))
        tesseract_module_ref01_data["extension"] = setup["idmap"]["extension01"]

        tesseract_module_ref01_data_result, err = tesseract_module_ref01_ent.create(tesseract_module_ref01_data, None)
        assert err is None
        tesseract_module_ref01_data = helpers.to_map(tesseract_module_ref01_data_result)
        assert tesseract_module_ref01_data is not None

        # LOAD
        tesseract_module_ref01_match_dt0 = {}
        tesseract_module_ref01_data_dt0_loaded, err = tesseract_module_ref01_ent.load(tesseract_module_ref01_match_dt0, None)
        assert err is None
        assert tesseract_module_ref01_data_dt0_loaded is not None



def _tesseract_module_basic_setup(extra):
    runner.load_env_local()

    entity_data_file = os.path.join(_TEST_DIR, "../../.sdk/test/entity/tesseract_module/TesseractModuleTestData.json")
    with open(entity_data_file, "r") as f:
        entity_data_source = f.read()

    entity_data = json.loads(entity_data_source)

    options = {}
    options["entity"] = entity_data.get("existing")

    client = DataUsaSDK.test(options, extra)

    # Generate idmap via transform.
    idmap = vs.transform(
        ["tesseract_module01", "tesseract_module02", "tesseract_module03", "extension01"],
        {
            "`$PACK`": ["", {
                "`$KEY`": "`$COPY`",
                "`$VAL`": ["`$FORMAT`", "upper", "`$COPY`"],
            }],
        }
    )

    # Detect ENTID env override before envOverride consumes it. When live
    # mode is on without a real override, the basic test runs against synthetic
    # IDs from the fixture and 4xx's. We surface this so the test can skip.
    _entid_env_raw = os.environ.get(
        "DATAUSA_TEST_TESSERACT_MODULE_ENTID")
    _idmap_overridden = _entid_env_raw is not None and _entid_env_raw.strip().startswith("{")

    env = runner.env_override({
        "DATAUSA_TEST_TESSERACT_MODULE_ENTID": idmap,
        "DATAUSA_TEST_LIVE": "FALSE",
        "DATAUSA_TEST_EXPLAIN": "FALSE",
    })

    idmap_resolved = helpers.to_map(
        env.get("DATAUSA_TEST_TESSERACT_MODULE_ENTID"))
    if idmap_resolved is None:
        idmap_resolved = helpers.to_map(idmap)

    if env.get("DATAUSA_TEST_LIVE") == "TRUE":
        merged_opts = vs.merge([
            {
            },
            extra or {},
        ])
        client = DataUsaSDK(helpers.to_map(merged_opts))

    _live = env.get("DATAUSA_TEST_LIVE") == "TRUE"
    return {
        "client": client,
        "data": entity_data,
        "idmap": idmap_resolved,
        "env": env,
        "explain": env.get("DATAUSA_TEST_EXPLAIN") == "TRUE",
        "live": _live,
        "synthetic_only": _live and not _idmap_overridden,
        "now": int(time.time() * 1000),
    }
