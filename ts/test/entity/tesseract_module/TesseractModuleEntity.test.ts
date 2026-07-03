
const envlocal = __dirname + '/../../../.env.local'
require('dotenv').config({ quiet: true, path: [envlocal] })

import Path from 'node:path'
import * as Fs from 'node:fs'

import { test, describe, afterEach } from 'node:test'
import assert from 'node:assert'


import { DataUsaSDK, BaseFeature, stdutil } from '../../..'

import {
  envOverride,
  liveDelay,
  makeCtrl,
  makeMatch,
  makeReqdata,
  makeStepData,
  makeValid,
  maybeSkipControl,
} from '../../utility'


describe('TesseractModuleEntity', async () => {

  // Per-test live pacing. Delay is read from sdk-test-control.json's
  // `test.live.delayMs`; only sleeps when DATAUSA_TEST_LIVE=TRUE.
  afterEach(liveDelay('DATAUSA_TEST_LIVE'))

  test('instance', async () => {
    const testsdk = DataUsaSDK.test()
    const ent = testsdk.TesseractModule()
    assert(null != ent)
  })


  test('basic', async (t) => {

    const live = 'TRUE' === process.env.DATA_USA_TEST_LIVE
    for (const op of ['create', 'load']) {
      if (maybeSkipControl(t, 'entityOp', 'tesseract_module.' + op, live)) return
    }

    const setup = basicSetup()
    // The basic flow consumes synthetic IDs and field values from the
    // fixture (entity TestData.json). Those don't exist on the live API.
    // Skip live runs unless the user provided a real ENTID env override.
    if (setup.syntheticOnly) {
      t.skip('live entity test uses synthetic IDs from fixture — set DATA_USA_TEST_TESSERACT_MODULE_ENTID JSON to run live')
      return
    }
    const client = setup.client
    const struct = setup.struct

    const isempty = struct.isempty
    const select = struct.select


    // CREATE
    const tesseract_module_ref01_ent = client.TesseractModule()
    let tesseract_module_ref01_data = setup.data.new.tesseract_module['tesseract_module_ref01']
    tesseract_module_ref01_data['extension'] = setup.idmap['extension01']

    tesseract_module_ref01_data = await tesseract_module_ref01_ent.create(tesseract_module_ref01_data)
    assert(null != tesseract_module_ref01_data)


    // LOAD
    const tesseract_module_ref01_match_dt0: any = {}
    const tesseract_module_ref01_data_dt0 = await tesseract_module_ref01_ent.load(tesseract_module_ref01_match_dt0)
    assert(null != tesseract_module_ref01_data_dt0)


  })
})



function basicSetup(extra?: any) {
  // TODO: fix test def options
  const options: any = {} // null

  // TODO: needs test utility to resolve path
  const entityDataFile =
    Path.resolve(__dirname, 
      '../../../../.sdk/test/entity/tesseract_module/TesseractModuleTestData.json')

  // TODO: file ready util needed?
  const entityDataSource = Fs.readFileSync(entityDataFile).toString('utf8')

  // TODO: need a xlang JSON parse utility in voxgig/struct with better error msgs
  const entityData = JSON.parse(entityDataSource)

  options.entity = entityData.existing

  let client = DataUsaSDK.test(options, extra)
  const struct = client.utility().struct
  const merge = struct.merge
  const transform = struct.transform

  let idmap = transform(
    ['tesseract_module01','tesseract_module02','tesseract_module03'],
    {
      '`$PACK`': ['', {
        '`$KEY`': '`$COPY`',
        '`$VAL`': ['`$FORMAT`', 'upper', '`$COPY`']
      }]
    })

  // Detect whether the user provided a real ENTID JSON via env var. The
  // basic flow consumes synthetic IDs from the fixture file; without an
  // override those synthetic IDs reach the live API and 4xx. Surface this
  // to the test so it can skip rather than fail.
  const idmapEnvVal = process.env['DATA_USA_TEST_TESSERACT_MODULE_ENTID']
  const idmapOverridden = null != idmapEnvVal && idmapEnvVal.trim().startsWith('{')

  const env = envOverride({
    'DATA_USA_TEST_TESSERACT_MODULE_ENTID': idmap,
    'DATA_USA_TEST_LIVE': 'FALSE',
    'DATA_USA_TEST_EXPLAIN': 'FALSE',
    'DATA_USA_APIKEY': 'NONE',
  })

  idmap = env['DATA_USA_TEST_TESSERACT_MODULE_ENTID']

  const live = 'TRUE' === env.DATA_USA_TEST_LIVE

  if (live) {
    client = new DataUsaSDK(merge([
      {
        apikey: env.DATA_USA_APIKEY,
      },
      extra
    ]))
  }

  const setup = {
    idmap,
    env,
    options,
    client,
    struct,
    data: entityData,
    explain: 'TRUE' === env.DATA_USA_TEST_EXPLAIN,
    live,
    syntheticOnly: live && !idmapOverridden,
    now: Date.now(),
  }

  return setup
}
  
