

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


describe('TesseractSchemaEntity', async () => {

  // Per-test live pacing. Delay is read from sdk-test-control.json's
  // `test.live.delayMs`; only sleeps when DATA_USA_TEST_LIVE=TRUE.
  afterEach(liveDelay('DATA_USA_TEST_LIVE'))

  test('instance', async () => {
    const testsdk = DataUsaSDK.test()
    const ent = testsdk.TesseractSchema()
    assert(null != ent)
  })


  test('basic', async (t) => {

    const live = 'TRUE' === process.env.DATA_USA_TEST_LIVE
    for (const op of ['list']) {
      if (!live && maybeSkipControl(t, 'entityOp', 'tesseract_schema.' + op, live)) return
    }

    
    const setup = basicSetup()
    if (setup.live) {
      return runLiveEntity(setup, {"active":true,"alias":{"field":{}},"fields":[{"active":true,"name":"annotations","req":true,"type":"`$OBJECT`","index$":0},{"active":true,"name":"caption","req":true,"type":"`$STRING`","index$":1},{"active":true,"name":"dimensions","req":true,"type":"`$ARRAY`","index$":2},{"active":true,"name":"measures","req":true,"type":"`$ARRAY`","index$":3},{"active":true,"name":"name","req":true,"type":"`$STRING`","index$":4}],"name":"tesseract_schema","op":{"list":{"input":"data","name":"list","points":[{"active":true,"args":{"header":[{"active":true,"kind":"header","name":"authorization","orig":"authorization","reqd":false,"type":"`$ANY`"},{"active":true,"kind":"header","name":"x_tesseract_jwt","orig":"x_tesseract_jwt","reqd":false,"type":"`$ANY`"}],"query":[{"active":true,"kind":"query","name":"locale","orig":"locale","reqd":false,"type":"`$ANY`","index$":0},{"active":true,"kind":"query","name":"token","orig":"token","reqd":false,"type":"`$STRING`","index$":1}]},"contract":{"id":"GET /complexity/cubes","json":"{\"operationId\":\"route_schema_complexity_cubes_get\",\"parameters\":[{\"in\":\"query\",\"name\":\"locale\",\"required\":false,\"schema\":{\"anyOf\":[{\"type\":\"string\"},{\"type\":\"null\"}],\"title\":\"Locale\"}},{\"in\":\"query\",\"name\":\"token\",\"required\":false,\"schema\":{\"anyOf\":[{\"type\":\"string\"},{\"type\":\"null\"}],\"title\":\"Token\"}},{\"in\":\"header\",\"name\":\"authorization\",\"required\":false,\"schema\":{\"anyOf\":[{\"type\":\"string\"},{\"type\":\"null\"}],\"title\":\"Authorization\"}},{\"in\":\"header\",\"name\":\"x-tesseract-jwt\",\"required\":false,\"schema\":{\"anyOf\":[{\"type\":\"string\"},{\"type\":\"null\"}],\"title\":\"X-Tesseract-Jwt\"}}],\"protocol\":\"http\",\"responses\":{\"200\":{\"content\":{\"application/json\":{\"schema\":{\"properties\":{\"annotations\":{\"additionalProperties\":{\"anyOf\":[{\"type\":\"string\"},{\"type\":\"null\"}]},\"title\":\"Annotations\",\"type\":\"object\"},\"cubes\":{\"items\":{\"properties\":{\"annotations\":{\"additionalProperties\":{\"anyOf\":[{\"type\":\"string\"},{\"type\":\"null\"}]},\"title\":\"Annotations\",\"type\":\"object\"},\"caption\":{\"title\":\"Caption\",\"type\":\"string\"},\"dimensions\":{\"items\":{\"properties\":{\"annotations\":{\"additionalProperties\":{\"anyOf\":[{\"type\":\"string\"},{\"type\":\"null\"}]},\"title\":\"Annotations\",\"type\":\"object\"},\"caption\":{\"title\":\"Caption\",\"type\":\"string\"},\"default_hierarchy\":{\"title\":\"Default Hierarchy\",\"type\":\"string\"},\"hierarchies\":{\"items\":{\"properties\":{\"annotations\":{\"additionalProperties\":{\"anyOf\":[{\"type\":\"string\"},{\"type\":\"null\"}]},\"title\":\"Annotations\",\"type\":\"object\"},\"caption\":{\"title\":\"Caption\",\"type\":\"string\"},\"levels\":{\"items\":{\"properties\":{\"annotations\":{\"additionalProperties\":{\"anyOf\":[{\"type\":\"string\"},{\"type\":\"null\"}]},\"title\":\"Annotations\",\"type\":\"object\"},\"caption\":{\"title\":\"Caption\",\"type\":\"string\"},\"count\":{\"title\":\"Count\",\"type\":\"integer\"},\"depth\":{\"title\":\"Depth\",\"type\":\"integer\"},\"name\":{\"title\":\"Name\",\"type\":\"string\"},\"properties\":{\"items\":{\"properties\":{\"annotations\":{\"additionalProperties\":{\"anyOf\":[{\"type\":\"string\"},{\"type\":\"null\"}]},\"title\":\"Annotations\",\"type\":\"object\"},\"caption\":{\"title\":\"Caption\",\"type\":\"string\"},\"name\":{\"title\":\"Name\",\"type\":\"string\"},\"type\":{\"description\":\"Types of the data the user can expect to find in the associated column.\",\"enum\":[\"bool\",\"date\",\"time\",\"dttm\",\"stmp\",\"f32\",\"f64\",\"i8\",\"i16\",\"i32\",\"i64\",\"i128\",\"u8\",\"u16\",\"u32\",\"u64\",\"u128\",\"str\"],\"title\":\"DataType\",\"type\":\"string\"}},\"required\":[\"name\",\"caption\",\"type\",\"annotations\"],\"title\":\"TesseractProperty\",\"type\":\"object\"},\"title\":\"Properties\",\"type\":\"array\"}},\"required\":[\"name\",\"caption\",\"depth\",\"count\",\"annotations\",\"properties\"],\"title\":\"TesseractLevel\",\"type\":\"object\"},\"title\":\"Levels\",\"type\":\"array\"},\"name\":{\"title\":\"Name\",\"type\":\"string\"}},\"required\":[\"name\",\"caption\",\"annotations\",\"levels\"],\"title\":\"TesseractHierarchy\",\"type\":\"object\"},\"title\":\"Hierarchies\",\"type\":\"array\"},\"name\":{\"title\":\"Name\",\"type\":\"string\"},\"type\":{\"description\":\"Kind of data a dimension is storing.\",\"enum\":[\"standard\",\"time\",\"geo\"],\"title\":\"DimensionType\",\"type\":\"string\"}},\"required\":[\"name\",\"caption\",\"type\",\"annotations\",\"hierarchies\",\"default_hierarchy\"],\"title\":\"TesseractDimension\",\"type\":\"object\"},\"title\":\"Dimensions\",\"type\":\"array\"},\"measures\":{\"items\":{\"properties\":{\"aggregator\":{\"title\":\"Aggregator\",\"type\":\"string\"},\"annotations\":{\"additionalProperties\":{\"anyOf\":[{\"type\":\"string\"},{\"type\":\"null\"}]},\"title\":\"Annotations\",\"type\":\"object\"},\"attached\":{\"items\":{\"properties\":\"[Circular *paths./tesseract/cubes.get.responses.200.content.application/json.schema.properties.cubes.items.properties.measures.items.properties]\",\"required\":[\"name\",\"caption\",\"aggregator\",\"annotations\",\"attached\"],\"title\":\"TesseractMeasure\",\"type\":\"object\"},\"title\":\"Attached\",\"type\":\"array\"},\"caption\":{\"title\":\"Caption\",\"type\":\"string\"},\"name\":{\"title\":\"Name\",\"type\":\"string\"}},\"required\":[\"name\",\"caption\",\"aggregator\",\"annotations\",\"attached\"],\"title\":\"TesseractMeasure\",\"type\":\"object\"},\"title\":\"Measures\",\"type\":\"array\"},\"name\":{\"title\":\"Name\",\"type\":\"string\"}},\"required\":[\"name\",\"caption\",\"annotations\",\"dimensions\",\"measures\"],\"title\":\"TesseractCube\",\"type\":\"object\"},\"title\":\"Cubes\",\"type\":\"array\"},\"default_locale\":{\"title\":\"Default Locale\",\"type\":\"string\"},\"locales\":{\"items\":{\"type\":\"string\"},\"title\":\"Locales\",\"type\":\"array\"},\"name\":{\"title\":\"Name\",\"type\":\"string\"}},\"required\":[\"name\",\"locales\",\"default_locale\",\"annotations\",\"cubes\"],\"title\":\"TesseractSchema\",\"type\":\"object\"}}},\"description\":\"Successful Response\"},\"422\":{\"content\":{\"application/json\":{\"schema\":{\"properties\":{\"detail\":{\"items\":{\"properties\":{\"loc\":{\"items\":{\"anyOf\":[{\"type\":\"string\"},{\"type\":\"integer\"}]},\"title\":\"Location\",\"type\":\"array\"},\"msg\":{\"title\":\"Message\",\"type\":\"string\"},\"type\":{\"title\":\"Error Type\",\"type\":\"string\"}},\"required\":[\"loc\",\"msg\",\"type\"],\"title\":\"ValidationError\",\"type\":\"object\"},\"title\":\"Detail\",\"type\":\"array\"}},\"title\":\"HTTPValidationError\",\"type\":\"object\"}}},\"description\":\"Validation Error\"}},\"securitySource\":\"unspecified\"}","source":"openapi3","version":1},"kind":"http","method":"GET","orig":"/complexity/cubes","segments":[{"lit":"complexity"},{"lit":"cubes"}],"select":{"exist":["authorization","locale","token","x_tesseract_jwt"]},"transform":{"req":"`reqdata`","res":"`body`"},"index$":0},{"active":true,"args":{"header":[{"active":true,"kind":"header","name":"authorization","orig":"authorization","reqd":false,"type":"`$ANY`"},{"active":true,"kind":"header","name":"x_tesseract_jwt","orig":"x_tesseract_jwt","reqd":false,"type":"`$ANY`"}],"query":[{"active":true,"kind":"query","name":"locale","orig":"locale","reqd":false,"type":"`$ANY`","index$":0},{"active":true,"kind":"query","name":"token","orig":"token","reqd":false,"type":"`$STRING`","index$":1}]},"contract":{"id":"GET /tesseract/cubes","json":"{\"operationId\":\"get_schema_tesseract_cubes_get\",\"parameters\":[{\"in\":\"query\",\"name\":\"locale\",\"required\":false,\"schema\":{\"anyOf\":[{\"type\":\"string\"},{\"type\":\"null\"}],\"title\":\"Locale\"}},{\"in\":\"query\",\"name\":\"token\",\"required\":false,\"schema\":{\"anyOf\":[{\"type\":\"string\"},{\"type\":\"null\"}],\"title\":\"Token\"}},{\"in\":\"header\",\"name\":\"authorization\",\"required\":false,\"schema\":{\"anyOf\":[{\"type\":\"string\"},{\"type\":\"null\"}],\"title\":\"Authorization\"}},{\"in\":\"header\",\"name\":\"x-tesseract-jwt\",\"required\":false,\"schema\":{\"anyOf\":[{\"type\":\"string\"},{\"type\":\"null\"}],\"title\":\"X-Tesseract-Jwt\"}}],\"protocol\":\"http\",\"responses\":{\"200\":{\"content\":{\"application/json\":{\"schema\":{\"properties\":{\"annotations\":{\"additionalProperties\":{\"anyOf\":[{\"type\":\"string\"},{\"type\":\"null\"}]},\"title\":\"Annotations\",\"type\":\"object\"},\"cubes\":{\"items\":{\"properties\":{\"annotations\":{\"additionalProperties\":{\"anyOf\":[{\"type\":\"string\"},{\"type\":\"null\"}]},\"title\":\"Annotations\",\"type\":\"object\"},\"caption\":{\"title\":\"Caption\",\"type\":\"string\"},\"dimensions\":{\"items\":{\"properties\":{\"annotations\":{\"additionalProperties\":{\"anyOf\":[{\"type\":\"string\"},{\"type\":\"null\"}]},\"title\":\"Annotations\",\"type\":\"object\"},\"caption\":{\"title\":\"Caption\",\"type\":\"string\"},\"default_hierarchy\":{\"title\":\"Default Hierarchy\",\"type\":\"string\"},\"hierarchies\":{\"items\":{\"properties\":{\"annotations\":{\"additionalProperties\":{\"anyOf\":[{\"type\":\"string\"},{\"type\":\"null\"}]},\"title\":\"Annotations\",\"type\":\"object\"},\"caption\":{\"title\":\"Caption\",\"type\":\"string\"},\"levels\":{\"items\":{\"properties\":{\"annotations\":{\"additionalProperties\":{\"anyOf\":[{\"type\":\"string\"},{\"type\":\"null\"}]},\"title\":\"Annotations\",\"type\":\"object\"},\"caption\":{\"title\":\"Caption\",\"type\":\"string\"},\"count\":{\"title\":\"Count\",\"type\":\"integer\"},\"depth\":{\"title\":\"Depth\",\"type\":\"integer\"},\"name\":{\"title\":\"Name\",\"type\":\"string\"},\"properties\":{\"items\":{\"properties\":{\"annotations\":{\"additionalProperties\":{\"anyOf\":[{\"type\":\"string\"},{\"type\":\"null\"}]},\"title\":\"Annotations\",\"type\":\"object\"},\"caption\":{\"title\":\"Caption\",\"type\":\"string\"},\"name\":{\"title\":\"Name\",\"type\":\"string\"},\"type\":{\"description\":\"Types of the data the user can expect to find in the associated column.\",\"enum\":[\"bool\",\"date\",\"time\",\"dttm\",\"stmp\",\"f32\",\"f64\",\"i8\",\"i16\",\"i32\",\"i64\",\"i128\",\"u8\",\"u16\",\"u32\",\"u64\",\"u128\",\"str\"],\"title\":\"DataType\",\"type\":\"string\"}},\"required\":[\"name\",\"caption\",\"type\",\"annotations\"],\"title\":\"TesseractProperty\",\"type\":\"object\"},\"title\":\"Properties\",\"type\":\"array\"}},\"required\":[\"name\",\"caption\",\"depth\",\"count\",\"annotations\",\"properties\"],\"title\":\"TesseractLevel\",\"type\":\"object\"},\"title\":\"Levels\",\"type\":\"array\"},\"name\":{\"title\":\"Name\",\"type\":\"string\"}},\"required\":[\"name\",\"caption\",\"annotations\",\"levels\"],\"title\":\"TesseractHierarchy\",\"type\":\"object\"},\"title\":\"Hierarchies\",\"type\":\"array\"},\"name\":{\"title\":\"Name\",\"type\":\"string\"},\"type\":{\"description\":\"Kind of data a dimension is storing.\",\"enum\":[\"standard\",\"time\",\"geo\"],\"title\":\"DimensionType\",\"type\":\"string\"}},\"required\":[\"name\",\"caption\",\"type\",\"annotations\",\"hierarchies\",\"default_hierarchy\"],\"title\":\"TesseractDimension\",\"type\":\"object\"},\"title\":\"Dimensions\",\"type\":\"array\"},\"measures\":{\"items\":{\"properties\":{\"aggregator\":{\"title\":\"Aggregator\",\"type\":\"string\"},\"annotations\":{\"additionalProperties\":{\"anyOf\":[{\"type\":\"string\"},{\"type\":\"null\"}]},\"title\":\"Annotations\",\"type\":\"object\"},\"attached\":{\"items\":{\"properties\":\"[Circular *paths./tesseract/cubes.get.responses.200.content.application/json.schema.properties.cubes.items.properties.measures.items.properties]\",\"required\":[\"name\",\"caption\",\"aggregator\",\"annotations\",\"attached\"],\"title\":\"TesseractMeasure\",\"type\":\"object\"},\"title\":\"Attached\",\"type\":\"array\"},\"caption\":{\"title\":\"Caption\",\"type\":\"string\"},\"name\":{\"title\":\"Name\",\"type\":\"string\"}},\"required\":[\"name\",\"caption\",\"aggregator\",\"annotations\",\"attached\"],\"title\":\"TesseractMeasure\",\"type\":\"object\"},\"title\":\"Measures\",\"type\":\"array\"},\"name\":{\"title\":\"Name\",\"type\":\"string\"}},\"required\":[\"name\",\"caption\",\"annotations\",\"dimensions\",\"measures\"],\"title\":\"TesseractCube\",\"type\":\"object\"},\"title\":\"Cubes\",\"type\":\"array\"},\"default_locale\":{\"title\":\"Default Locale\",\"type\":\"string\"},\"locales\":{\"items\":{\"type\":\"string\"},\"title\":\"Locales\",\"type\":\"array\"},\"name\":{\"title\":\"Name\",\"type\":\"string\"}},\"required\":[\"name\",\"locales\",\"default_locale\",\"annotations\",\"cubes\"],\"title\":\"TesseractSchema\",\"type\":\"object\"}}},\"description\":\"Successful Response\"},\"422\":{\"content\":{\"application/json\":{\"schema\":{\"properties\":{\"detail\":{\"items\":{\"properties\":{\"loc\":{\"items\":{\"anyOf\":[{\"type\":\"string\"},{\"type\":\"integer\"}]},\"title\":\"Location\",\"type\":\"array\"},\"msg\":{\"title\":\"Message\",\"type\":\"string\"},\"type\":{\"title\":\"Error Type\",\"type\":\"string\"}},\"required\":[\"loc\",\"msg\",\"type\"],\"title\":\"ValidationError\",\"type\":\"object\"},\"title\":\"Detail\",\"type\":\"array\"}},\"title\":\"HTTPValidationError\",\"type\":\"object\"}}},\"description\":\"Validation Error\"}},\"securitySource\":\"unspecified\"}","source":"openapi3","version":1},"kind":"http","method":"GET","orig":"/tesseract/cubes","segments":[{"lit":"tesseract"},{"lit":"cubes"}],"select":{"exist":["authorization","locale","token","x_tesseract_jwt"]},"transform":{"req":"`reqdata`","res":"`body`"},"index$":1}],"key$":"list"}},"relations":{"ancestors":[]},"key$":"tesseract_schema","name__orig":"tesseract_schema","Name":"TesseractSchema","name_":"tesseract_schema","name-":"tesseract-schema","NAME":"TESSERACT_SCHEMA","index$":8}, {"active":true,"entity":"tesseract_schema","key$":"BasicTesseractSchemaFlow","kind":"basic","name":"BasicTesseractSchemaFlow","param":{},"step":[{"active":true,"data":{},"input":{},"match":{},"op":"list","spec":[],"valid":[{"apply":"ItemExists","def":{"ref":"tesseract_schema_ref01"}}],"index$":0}]}, 'TesseractSchema')
    }
    const client = setup.client
    const struct = setup.struct

    const isempty = struct.isempty
    const select = struct.select

    let tesseract_schema_ref01_data = Object.values(setup.data.existing.tesseract_schema)[0] as any

    // LIST
    const tesseract_schema_ref01_ent = client.TesseractSchema()
    const tesseract_schema_ref01_match: any = {}

    const tesseract_schema_ref01_list = (await tesseract_schema_ref01_ent.list(tesseract_schema_ref01_match)).map((e: any) => e.data())


  })
})



function basicSetup(extra?: any) {
  // TODO: fix test def options
  const options: any = {} // null

  // TODO: needs test utility to resolve path
  const entityDataFile =
    Path.resolve(__dirname, 
      '../../../../.sdk/test/entity/tesseract_schema/TesseractSchemaTestData.json')

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
    ['tesseract_schema01','tesseract_schema02','tesseract_schema03'],
    {
      '`$PACK`': ['', {
        '`$KEY`': '`$COPY`',
        '`$VAL`': ['`$FORMAT`', 'upper', '`$COPY`']
      }]
    })

  const env = envOverride({
    'DATA_USA_TEST_TESSERACT_SCHEMA_ENTID': idmap,
    'DATA_USA_TEST_LIVE': 'FALSE',
    'DATA_USA_TEST_EXPLAIN': 'FALSE',
  })

  idmap = env['DATA_USA_TEST_TESSERACT_SCHEMA_ENTID']

  const live = 'TRUE' === env.DATA_USA_TEST_LIVE

  const transport = createLiveTransport()
  if (live) {
    const rawIds = process.env['DATA_USA_TEST_TESSERACT_SCHEMA_ENTID']
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
  
