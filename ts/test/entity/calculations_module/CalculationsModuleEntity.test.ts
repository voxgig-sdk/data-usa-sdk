

import Path from 'node:path'
import * as Fs from 'node:fs'

import { test, describe, afterEach } from 'node:test'
import assert from 'node:assert'
import { createLiveTransport } from '../../live-runner'
import { runLiveEntity } from '../../live-entity'


import { DataUsaSDK, BaseFeature, stdutil } from '../../..'

import {
  envOverride,
  liveClientOptions,
  liveDelay,
  loadEnvLocal,
  makeCtrl,
  makeMatch,
  makeReqdata,
  makeStepData,
  makeValid,
  maybeSkipControl,
} from '../../utility'


// AFTER the imports on purpose: TypeScript hoists `import` above any
// statement in the emitted CommonJS, so a loader placed above them would
// run only after every imported module had already been evaluated - and
// anything reading process.env at module scope would miss these values.
loadEnvLocal(__dirname + '/../../../.env.local')


describe('CalculationsModuleEntity', async () => {

  // Per-test live pacing. Delay is read from sdk-test-control.json's
  // `test.live.delayMs`; only sleeps when DATA_USA_TEST_LIVE=TRUE.
  afterEach(liveDelay('DATA_USA_TEST_LIVE'))

  test('instance', async () => {
    const testsdk = DataUsaSDK.test()
    const ent = testsdk.CalculationsModule()
    assert(null != ent)
  })


  test('basic', async (t) => {

    const live = 'TRUE' === process.env.DATA_USA_TEST_LIVE
    for (const op of ['load']) {
      if (!live && maybeSkipControl(t, 'entityOp', 'calculations_module.' + op, live)) return
    }

    
    const setup = basicSetup()
    if (setup.live) {
      return runLiveEntity(setup, {"active":true,"alias":{"field":{}},"fields":[],"name":"calculations_module","op":{"load":{"input":"data","name":"load","points":[{"active":true,"args":{"header":[{"active":true,"kind":"header","name":"authorization","orig":"authorization","reqd":false,"type":"`$ANY`"},{"active":true,"kind":"header","name":"x_tesseract_jwt","orig":"x_tesseract_jwt","reqd":false,"type":"`$ANY`"}],"params":[{"active":true,"kind":"param","name":"extension","orig":"extension","reqd":true,"type":"`$STRING`","index$":0}],"query":[{"active":true,"example":"","kind":"query","name":"filter","orig":"filter","reqd":false,"type":"`$STRING`","index$":0},{"active":true,"kind":"query","name":"param","orig":"param","reqd":true,"type":"`$OBJECT`","index$":1},{"active":true,"kind":"query","name":"token","orig":"token","reqd":false,"type":"`$STRING`","index$":2},{"active":true,"example":"","kind":"query","name":"top","orig":"top","reqd":false,"type":"`$STRING`","index$":3}]},"contract":{"id":"GET /calcs/merge.{extension}","json":"{\"operationId\":\"route_merge_calcs_merge__extension__get\",\"parameters\":[{\"in\":\"path\",\"name\":\"extension\",\"required\":true,\"schema\":{\"description\":\"Define the extensions available to the user and how to response to them.\",\"enum\":[\"csv\",\"csvbom\",\"xlsx\",\"jsonarrays\",\"jsonrecords\",\"parquet\",\"tsv\",\"tsvbom\"],\"title\":\"ResponseFormat\",\"type\":\"string\"}},{\"in\":\"query\",\"name\":\"params\",\"required\":true,\"schema\":{\"description\":\"Parameters needed to perform a PUMS calculation.\",\"properties\":{\"cube_left\":{\"description\":\"Cube to retrieve part of the data\",\"examples\":[\"ipeds_ic_living_expenses\"],\"title\":\"Cube Left\",\"type\":\"string\"},\"cube_right\":{\"description\":\"The cube to retrieve the main data\",\"examples\":[\"ipeds_tuition\"],\"title\":\"Cube Right\",\"type\":\"string\"},\"drilldowns_left\":{\"description\":\"A list of the level names to slice the bulk of the aggregated data.\",\"examples\":[\"Year,Carnegie\"],\"items\":{\"type\":\"string\"},\"title\":\"Drilldowns Left\",\"type\":\"array\",\"uniqueItems\":true},\"drilldowns_right\":{\"description\":\"Cube to retrieve part of the data\",\"examples\":[\"Year,Carnegie\"],\"items\":{\"type\":\"string\"},\"title\":\"Drilldowns Right\",\"type\":\"array\",\"uniqueItems\":true},\"exclude_left\":{\"additionalProperties\":{\"items\":{\"type\":\"string\"},\"type\":\"array\",\"uniqueItems\":true},\"description\":\"Limits the results returned by the output. Members of the declared Level won't be considered in the data.\",\"examples\":[\"State:04000US11\"],\"title\":\"Members to exclude\",\"type\":\"object\"},\"exclude_right\":{\"additionalProperties\":{\"items\":{\"type\":\"string\"},\"type\":\"array\",\"uniqueItems\":true},\"description\":\"Limits the results returned by the output. Members of the declared Level won't be considered in the data.\",\"examples\":[\"State:04000US11\"],\"title\":\"Members to exclude\",\"type\":\"object\"},\"include_left\":{\"additionalProperties\":{\"items\":{\"type\":\"string\"},\"type\":\"array\",\"uniqueItems\":true},\"description\":\"Limits the results returned by the output. Only members of the declared Level will be considered in the data.\",\"examples\":[\"Year:2020,2021\"],\"title\":\"Members to include\",\"type\":\"object\"},\"include_right\":{\"additionalProperties\":{\"items\":{\"type\":\"string\"},\"type\":\"array\",\"uniqueItems\":true},\"description\":\"Limits the results returned by the output. Only members of the declared Level will be considered in the data.\",\"examples\":[\"Year:2020,2021\"],\"title\":\"Members to include\",\"type\":\"object\"},\"locale\":{\"anyOf\":[{\"type\":\"string\"},{\"type\":\"null\"}],\"description\":\"Defines the locale variation for the labels in the data\",\"examples\":[\"en\",\"es\"],\"title\":\"Locale code\"},\"measures_left\":{\"description\":\"Quantitative variable\",\"examples\":[\"Median Room And Board,Median Other Student Expenses\"],\"items\":{\"type\":\"string\"},\"title\":\"Measures Left\",\"type\":\"array\",\"uniqueItems\":true},\"measures_right\":{\"description\":\"Quantitative variable\",\"examples\":[\"Out Of State Tuition\"],\"items\":{\"type\":\"string\"},\"title\":\"Measures Right\",\"type\":\"array\",\"uniqueItems\":true},\"time\":{\"anyOf\":[{\"type\":\"string\"},{\"type\":\"null\"}],\"description\":\"Specifies the time period to filter the data by\",\"title\":\"Filter by time\"}},\"required\":[\"cube_left\",\"drilldowns_left\",\"measures_left\",\"cube_right\",\"drilldowns_right\",\"measures_right\"],\"title\":\"MergeParameters\",\"type\":\"object\"}},{\"in\":\"query\",\"name\":\"token\",\"required\":false,\"schema\":{\"anyOf\":[{\"type\":\"string\"},{\"type\":\"null\"}],\"title\":\"Token\"}},{\"in\":\"query\",\"name\":\"filters\",\"required\":false,\"schema\":{\"default\":\"\",\"description\":\"\",\"title\":\"Filters\",\"type\":\"string\"}},{\"in\":\"query\",\"name\":\"top\",\"required\":false,\"schema\":{\"default\":\"\",\"description\":\"\",\"title\":\"Top\",\"type\":\"string\"}},{\"in\":\"header\",\"name\":\"authorization\",\"required\":false,\"schema\":{\"anyOf\":[{\"type\":\"string\"},{\"type\":\"null\"}],\"title\":\"Authorization\"}},{\"in\":\"header\",\"name\":\"x-tesseract-jwt\",\"required\":false,\"schema\":{\"anyOf\":[{\"type\":\"string\"},{\"type\":\"null\"}],\"title\":\"X-Tesseract-Jwt\"}}],\"protocol\":\"http\",\"responses\":{\"200\":{\"content\":{\"application/json\":{\"schema\":{}}},\"description\":\"Successful Response\"},\"422\":{\"content\":{\"application/json\":{\"schema\":{\"properties\":{\"detail\":{\"items\":{\"properties\":{\"loc\":{\"items\":{\"anyOf\":[{\"type\":\"string\"},{\"type\":\"integer\"}]},\"title\":\"Location\",\"type\":\"array\"},\"msg\":{\"title\":\"Message\",\"type\":\"string\"},\"type\":{\"title\":\"Error Type\",\"type\":\"string\"}},\"required\":[\"loc\",\"msg\",\"type\"],\"title\":\"ValidationError\",\"type\":\"object\"},\"title\":\"Detail\",\"type\":\"array\"}},\"title\":\"HTTPValidationError\",\"type\":\"object\"}}},\"description\":\"Validation Error\"}},\"securitySource\":\"unspecified\"}","source":"openapi3","version":1},"kind":"http","method":"GET","orig":"/calcs/merge.{extension}","segments":[{"lit":"calcs"},{"lit":"merge.{extension}"}],"select":{"exist":["authorization","extension","filter","param","token","top","x_tesseract_jwt"]},"transform":{"req":"`reqdata`","res":"`body`"},"index$":0},{"active":true,"args":{"header":[{"active":true,"kind":"header","name":"authorization","orig":"authorization","reqd":false,"type":"`$ANY`"},{"active":true,"kind":"header","name":"x_tesseract_jwt","orig":"x_tesseract_jwt","reqd":false,"type":"`$ANY`"}],"params":[{"active":true,"kind":"param","name":"extension","orig":"extension","reqd":true,"type":"`$STRING`","index$":0}],"query":[{"active":true,"example":"","kind":"query","name":"filter","orig":"filter","reqd":false,"type":"`$STRING`","index$":0},{"active":true,"kind":"query","name":"param","orig":"param","reqd":true,"type":"`$OBJECT`","index$":1},{"active":true,"kind":"query","name":"token","orig":"token","reqd":false,"type":"`$STRING`","index$":2},{"active":true,"example":"","kind":"query","name":"top","orig":"top","reqd":false,"type":"`$STRING`","index$":3}]},"contract":{"id":"GET /calcs/pums.{extension}","json":"{\"operationId\":\"route_pums_calcs_pums__extension__get\",\"parameters\":[{\"in\":\"path\",\"name\":\"extension\",\"required\":true,\"schema\":{\"description\":\"Define the extensions available to the user and how to response to them.\",\"enum\":[\"csv\",\"csvbom\",\"xlsx\",\"jsonarrays\",\"jsonrecords\",\"parquet\",\"tsv\",\"tsvbom\"],\"title\":\"ResponseFormat\",\"type\":\"string\"}},{\"in\":\"query\",\"name\":\"params\",\"required\":true,\"schema\":{\"description\":\"Parameters needed to perform a PUMS calculation.\",\"properties\":{\"cube\":{\"description\":\"The cube to retrieve the main data\",\"examples\":[\"pums_1\"],\"title\":\"Cube\",\"type\":\"string\"},\"drilldowns\":{\"description\":\"A list of the level names to slice the bulk of the aggregated data.\",\"examples\":[\"Year,State\"],\"items\":{\"type\":\"string\"},\"title\":\"Drilldowns\",\"type\":\"array\",\"uniqueItems\":true},\"exclude\":{\"additionalProperties\":{\"items\":{\"type\":\"string\"},\"type\":\"array\",\"uniqueItems\":true},\"description\":\"Limits the results returned by the output. Members of the declared Level won't be considered in the data.\",\"examples\":[\"State:04000US11\"],\"title\":\"Members to exclude\",\"type\":\"object\"},\"include\":{\"additionalProperties\":{\"items\":{\"type\":\"string\"},\"type\":\"array\",\"uniqueItems\":true},\"description\":\"Limits the results returned by the output. Only members of the declared Level will be considered in the data.\",\"examples\":[\"Year:2020,2021\"],\"title\":\"Members to include\",\"type\":\"object\"},\"locale\":{\"anyOf\":[{\"type\":\"string\"},{\"type\":\"null\"}],\"description\":\"Defines the locale variation for the labels in the data\",\"examples\":[\"en\",\"es\"],\"title\":\"Locale code\"},\"measures\":{\"description\":\"Quantitative variable\",\"examples\":[\"Trade Value\"],\"items\":{\"type\":\"string\"},\"title\":\"Measures\",\"type\":\"array\",\"uniqueItems\":true},\"parents\":{\"default\":false,\"description\":\"Specifies if the response items should include the parent levels for activity and location.\",\"title\":\"Include parent levels\",\"type\":\"boolean\"}},\"required\":[\"cube\",\"drilldowns\",\"measures\"],\"title\":\"PumsParameters\",\"type\":\"object\"}},{\"in\":\"query\",\"name\":\"token\",\"required\":false,\"schema\":{\"anyOf\":[{\"type\":\"string\"},{\"type\":\"null\"}],\"title\":\"Token\"}},{\"in\":\"query\",\"name\":\"filters\",\"required\":false,\"schema\":{\"default\":\"\",\"description\":\"\",\"title\":\"Filters\",\"type\":\"string\"}},{\"in\":\"query\",\"name\":\"top\",\"required\":false,\"schema\":{\"default\":\"\",\"description\":\"\",\"title\":\"Top\",\"type\":\"string\"}},{\"in\":\"header\",\"name\":\"authorization\",\"required\":false,\"schema\":{\"anyOf\":[{\"type\":\"string\"},{\"type\":\"null\"}],\"title\":\"Authorization\"}},{\"in\":\"header\",\"name\":\"x-tesseract-jwt\",\"required\":false,\"schema\":{\"anyOf\":[{\"type\":\"string\"},{\"type\":\"null\"}],\"title\":\"X-Tesseract-Jwt\"}}],\"protocol\":\"http\",\"responses\":{\"200\":{\"content\":{\"application/json\":{\"schema\":{}}},\"description\":\"Successful Response\"},\"422\":{\"content\":{\"application/json\":{\"schema\":{\"properties\":{\"detail\":{\"items\":{\"properties\":{\"loc\":{\"items\":{\"anyOf\":[{\"type\":\"string\"},{\"type\":\"integer\"}]},\"title\":\"Location\",\"type\":\"array\"},\"msg\":{\"title\":\"Message\",\"type\":\"string\"},\"type\":{\"title\":\"Error Type\",\"type\":\"string\"}},\"required\":[\"loc\",\"msg\",\"type\"],\"title\":\"ValidationError\",\"type\":\"object\"},\"title\":\"Detail\",\"type\":\"array\"}},\"title\":\"HTTPValidationError\",\"type\":\"object\"}}},\"description\":\"Validation Error\"}},\"securitySource\":\"unspecified\"}","source":"openapi3","version":1},"kind":"http","method":"GET","orig":"/calcs/pums.{extension}","segments":[{"lit":"calcs"},{"lit":"pums.{extension}"}],"select":{"exist":["authorization","extension","filter","param","token","top","x_tesseract_jwt"]},"transform":{"req":"`reqdata`","res":"`body`"},"index$":1},{"active":true,"args":{"header":[{"active":true,"kind":"header","name":"authorization","orig":"authorization","reqd":false,"type":"`$ANY`"},{"active":true,"kind":"header","name":"x_tesseract_jwt","orig":"x_tesseract_jwt","reqd":false,"type":"`$ANY`"}],"params":[{"active":true,"kind":"param","name":"extension","orig":"extension","reqd":true,"type":"`$STRING`","index$":0}],"query":[{"active":true,"kind":"query","name":"param","orig":"param","reqd":true,"type":"`$OBJECT`","index$":0},{"active":true,"kind":"query","name":"token","orig":"token","reqd":false,"type":"`$STRING`","index$":1}]},"contract":{"id":"GET /calcs/acs.{extension}","json":"{\"operationId\":\"route_acs_calcs_acs__extension__get\",\"parameters\":[{\"in\":\"path\",\"name\":\"extension\",\"required\":true,\"schema\":{\"description\":\"Define the extensions available to the user and how to response to them.\",\"enum\":[\"csv\",\"csvbom\",\"xlsx\",\"jsonarrays\",\"jsonrecords\",\"parquet\",\"tsv\",\"tsvbom\"],\"title\":\"ResponseFormat\",\"type\":\"string\"}},{\"in\":\"query\",\"name\":\"params\",\"required\":true,\"schema\":{\"description\":\"Parameters needed to perform a PUMS calculation.\",\"properties\":{\"cube\":{\"description\":\"The cube to retrieve the main data\",\"examples\":[\"acs_ygo_occupation_for_median_earnings_1\"],\"title\":\"Cube\",\"type\":\"string\"},\"drilldowns\":{\"description\":\"A list of the level names to slice the bulk of the aggregated data.\",\"examples\":[\"Year,Occupation Group\"],\"items\":{\"type\":\"string\"},\"title\":\"Drilldowns\",\"type\":\"array\",\"uniqueItems\":true},\"exclude\":{\"additionalProperties\":{\"items\":{\"type\":\"string\"},\"type\":\"array\",\"uniqueItems\":true},\"description\":\"Limits the results returned by the output. Members of the declared Level won't be considered in the data.\",\"examples\":[\"State:04000US11\"],\"title\":\"Members to exclude\",\"type\":\"object\"},\"include\":{\"additionalProperties\":{\"items\":{\"type\":\"string\"},\"type\":\"array\",\"uniqueItems\":true},\"description\":\"Limits the results returned by the output. Only members of the declared Level will be considered in the data.\",\"examples\":[\"Year:2020,2021\"],\"title\":\"Members to include\",\"type\":\"object\"},\"locale\":{\"anyOf\":[{\"type\":\"string\"},{\"type\":\"null\"}],\"description\":\"Defines the locale variation for the labels in the data\",\"examples\":[\"en\",\"es\"],\"title\":\"Locale code\"},\"measures\":{\"description\":\"Quantitative variable\",\"examples\":[\"Median Earings by Occupation\"],\"items\":{\"type\":\"string\"},\"title\":\"Measures\",\"type\":\"array\",\"uniqueItems\":true},\"parents\":{\"default\":false,\"description\":\"Specifies if the response items should include the parent levels for activity and location.\",\"title\":\"Include parent levels\",\"type\":\"boolean\"},\"time\":{\"anyOf\":[{\"type\":\"string\"},{\"type\":\"null\"}],\"description\":\"Specifies the time period to filter the data by\",\"title\":\"Filter by time\"}},\"required\":[\"cube\",\"drilldowns\",\"measures\"],\"title\":\"ACSParameters\",\"type\":\"object\"}},{\"in\":\"query\",\"name\":\"token\",\"required\":false,\"schema\":{\"anyOf\":[{\"type\":\"string\"},{\"type\":\"null\"}],\"title\":\"Token\"}},{\"in\":\"header\",\"name\":\"authorization\",\"required\":false,\"schema\":{\"anyOf\":[{\"type\":\"string\"},{\"type\":\"null\"}],\"title\":\"Authorization\"}},{\"in\":\"header\",\"name\":\"x-tesseract-jwt\",\"required\":false,\"schema\":{\"anyOf\":[{\"type\":\"string\"},{\"type\":\"null\"}],\"title\":\"X-Tesseract-Jwt\"}}],\"protocol\":\"http\",\"responses\":{\"200\":{\"content\":{\"application/json\":{\"schema\":{}}},\"description\":\"Successful Response\"},\"422\":{\"content\":{\"application/json\":{\"schema\":{\"properties\":{\"detail\":{\"items\":{\"properties\":{\"loc\":{\"items\":{\"anyOf\":[{\"type\":\"string\"},{\"type\":\"integer\"}]},\"title\":\"Location\",\"type\":\"array\"},\"msg\":{\"title\":\"Message\",\"type\":\"string\"},\"type\":{\"title\":\"Error Type\",\"type\":\"string\"}},\"required\":[\"loc\",\"msg\",\"type\"],\"title\":\"ValidationError\",\"type\":\"object\"},\"title\":\"Detail\",\"type\":\"array\"}},\"title\":\"HTTPValidationError\",\"type\":\"object\"}}},\"description\":\"Validation Error\"}},\"securitySource\":\"unspecified\"}","source":"openapi3","version":1},"kind":"http","method":"GET","orig":"/calcs/acs.{extension}","segments":[{"lit":"calcs"},{"lit":"acs.{extension}"}],"select":{"exist":["authorization","extension","param","token","x_tesseract_jwt"]},"transform":{"req":"`reqdata`","res":"`body`"},"index$":2}],"key$":"load"}},"relations":{"ancestors":[]},"key$":"calculations_module","name__orig":"calculations_module","Name":"CalculationsModule","name_":"calculations_module","name-":"calculations-module","NAME":"CALCULATIONS_MODULE","index$":0}, {"active":true,"entity":"calculations_module","key$":"BasicCalculationsModuleFlow","kind":"basic","name":"BasicCalculationsModuleFlow","param":{},"step":[{"active":true,"data":{},"input":{"ref":"calculations_module_ref01","srcdatavar":"calculations_module_ref01_data","suffix":"_dt0"},"match":{"extension":"extension01"},"op":"load","spec":[],"valid":[{"apply":"TextFieldMark","def":{"mark":"Mark01-calculations_module_ref01"}}],"index$":0}]}, 'CalculationsModule')
    }
    const client = setup.client
    const struct = setup.struct

    const isempty = struct.isempty
    const select = struct.select

    let calculations_module_ref01_data = Object.values(setup.data.existing.calculations_module)[0] as any

    // LOAD: skipped — no entity id field and load requires path params.
    // Entity-var is declared here so later flow steps still compile.
    const calculations_module_ref01_ent = client.CalculationsModule()


  })
})



function basicSetup(extra?: any) {
  // TODO: fix test def options
  const options: any = {} // null

  // TODO: needs test utility to resolve path
  const entityDataFile =
    Path.resolve(__dirname, 
      '../../../../.sdk/test/entity/calculations_module/CalculationsModuleTestData.json')

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
    ['calculations_module01','calculations_module02','calculations_module03'],
    {
      '`$PACK`': ['', {
        '`$KEY`': '`$COPY`',
        '`$VAL`': ['`$FORMAT`', 'upper', '`$COPY`']
      }]
    })

  const env = envOverride({
    'DATA_USA_TEST_CALCULATIONS_MODULE_ENTID': idmap,
    'DATA_USA_TEST_LIVE': 'FALSE',
    'DATA_USA_TEST_EXPLAIN': 'FALSE',
  })

  idmap = env['DATA_USA_TEST_CALCULATIONS_MODULE_ENTID']

  const live = 'TRUE' === env.DATA_USA_TEST_LIVE

  const transport = createLiveTransport()
  if (live) {
    const rawIds = process.env['DATA_USA_TEST_CALCULATIONS_MODULE_ENTID']
    idmap = rawIds && rawIds.trim() ? JSON.parse(rawIds) : {}
    if (!idmap || Array.isArray(idmap) || typeof idmap !== 'object') {
      throw new Error('Live ENTID must be a JSON object')
    }
    client = new DataUsaSDK(merge([
      // FIRST, so the generated fields below win: sdk-test-control.json's
      // test.client.options adds to the live client, it does not redirect it.
      liveClientOptions(),
      {
      },
      // 'extra || {}', not a bare 'extra': struct.merge returns UNDEFINED when the
      // last entry is undefined, and basicSetup is normally called with no
      // argument at all - so a bare 'extra' silently discarded the apikey
      // and server values above and handed the SDK undefined. Harmless
      // while there was nothing in that object; not harmless now.
      extra || {},
      { system: { fetch: transport.fetch } }
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
    transport,
    now: Date.now(),
  }

  return setup
}
  
