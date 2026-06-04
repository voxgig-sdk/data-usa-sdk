# TesseractCube entity test

require "minitest/autorun"
require "json"
require_relative "../DataUsa_sdk"
require_relative "runner"

class TesseractCubeEntityTest < Minitest::Test
  def test_create_instance
    testsdk = DataUsaSDK.test(nil, nil)
    ent = testsdk.TesseractCube(nil)
    assert !ent.nil?
  end

  def test_basic_flow
    setup = tesseract_cube_basic_setup(nil)
    # Per-op sdk-test-control.json skip.
    _live = setup[:live] || false
    ["load"].each do |_op|
      _should_skip, _reason = Runner.is_control_skipped("entityOp", "tesseract_cube." + _op, _live ? "live" : "unit")
      if _should_skip
        skip(_reason || "skipped via sdk-test-control.json")
        return
      end
    end
    # The basic flow consumes synthetic IDs from the fixture. In live mode
    # without an *_ENTID env override, those IDs hit the live API and 4xx.
    if setup[:synthetic_only]
      skip "live entity test uses synthetic IDs from fixture — set DATAUSA_TEST_TESSERACT_CUBE_ENTID JSON to run live"
      return
    end
    client = setup[:client]

    # Bootstrap entity data from existing test data.
    tesseract_cube_ref01_data_raw = Vs.items(Helpers.to_map(
      Vs.getpath(setup[:data], "existing.tesseract_cube")))
    tesseract_cube_ref01_data = nil
    if tesseract_cube_ref01_data_raw.length > 0
      tesseract_cube_ref01_data = Helpers.to_map(tesseract_cube_ref01_data_raw[0][1])
    end

    # LOAD
    tesseract_cube_ref01_ent = client.TesseractCube(nil)
    tesseract_cube_ref01_match_dt0 = {}
    tesseract_cube_ref01_data_dt0_loaded, err = tesseract_cube_ref01_ent.load(tesseract_cube_ref01_match_dt0, nil)
    assert_nil err
    assert !tesseract_cube_ref01_data_dt0_loaded.nil?

  end
end

def tesseract_cube_basic_setup(extra)
  Runner.load_env_local

  entity_data_file = File.join(__dir__, "..", "..", ".sdk", "test", "entity", "tesseract_cube", "TesseractCubeTestData.json")
  entity_data_source = File.read(entity_data_file)
  entity_data = JSON.parse(entity_data_source)

  options = {}
  options["entity"] = entity_data["existing"]

  client = DataUsaSDK.test(options, extra)

  # Generate idmap via transform.
  idmap = Vs.transform(
    ["tesseract_cube01", "tesseract_cube02", "tesseract_cube03"],
    {
      "`$PACK`" => ["", {
        "`$KEY`" => "`$COPY`",
        "`$VAL`" => ["`$FORMAT`", "upper", "`$COPY`"],
      }],
    }
  )

  # Detect ENTID env override before envOverride consumes it. When live
  # mode is on without a real override, the basic test runs against synthetic
  # IDs from the fixture and 4xx's. Surface this so the test can skip.
  entid_env_raw = ENV["DATAUSA_TEST_TESSERACT_CUBE_ENTID"]
  idmap_overridden = !entid_env_raw.nil? && entid_env_raw.strip.start_with?("{")

  env = Runner.env_override({
    "DATAUSA_TEST_TESSERACT_CUBE_ENTID" => idmap,
    "DATAUSA_TEST_LIVE" => "FALSE",
    "DATAUSA_TEST_EXPLAIN" => "FALSE",
  })

  idmap_resolved = Helpers.to_map(
    env["DATAUSA_TEST_TESSERACT_CUBE_ENTID"])
  if idmap_resolved.nil?
    idmap_resolved = Helpers.to_map(idmap)
  end

  if env["DATAUSA_TEST_LIVE"] == "TRUE"
    merged_opts = Vs.merge([
      {
      },
      extra || {},
    ])
    client = DataUsaSDK.new(Helpers.to_map(merged_opts))
  end

  live = env["DATAUSA_TEST_LIVE"] == "TRUE"
  {
    client: client,
    data: entity_data,
    idmap: idmap_resolved,
    env: env,
    explain: env["DATAUSA_TEST_EXPLAIN"] == "TRUE",
    live: live,
    synthetic_only: live && !idmap_overridden,
    now: (Time.now.to_f * 1000).to_i,
  }
end
