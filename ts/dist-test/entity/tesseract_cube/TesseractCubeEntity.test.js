"use strict";
var __createBinding = (this && this.__createBinding) || (Object.create ? (function(o, m, k, k2) {
    if (k2 === undefined) k2 = k;
    var desc = Object.getOwnPropertyDescriptor(m, k);
    if (!desc || ("get" in desc ? !m.__esModule : desc.writable || desc.configurable)) {
      desc = { enumerable: true, get: function() { return m[k]; } };
    }
    Object.defineProperty(o, k2, desc);
}) : (function(o, m, k, k2) {
    if (k2 === undefined) k2 = k;
    o[k2] = m[k];
}));
var __setModuleDefault = (this && this.__setModuleDefault) || (Object.create ? (function(o, v) {
    Object.defineProperty(o, "default", { enumerable: true, value: v });
}) : function(o, v) {
    o["default"] = v;
});
var __importStar = (this && this.__importStar) || (function () {
    var ownKeys = function(o) {
        ownKeys = Object.getOwnPropertyNames || function (o) {
            var ar = [];
            for (var k in o) if (Object.prototype.hasOwnProperty.call(o, k)) ar[ar.length] = k;
            return ar;
        };
        return ownKeys(o);
    };
    return function (mod) {
        if (mod && mod.__esModule) return mod;
        var result = {};
        if (mod != null) for (var k = ownKeys(mod), i = 0; i < k.length; i++) if (k[i] !== "default") __createBinding(result, mod, k[i]);
        __setModuleDefault(result, mod);
        return result;
    };
})();
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const node_path_1 = __importDefault(require("node:path"));
const Fs = __importStar(require("node:fs"));
const node_test_1 = require("node:test");
const node_assert_1 = __importDefault(require("node:assert"));
const live_runner_1 = require("../../live-runner");
const live_entity_1 = require("../../live-entity");
const __1 = require("../../..");
const utility_1 = require("../../utility");
// AFTER the imports on purpose: TypeScript hoists `import` above any
// statement in the emitted CommonJS, so a loader placed above them would
// run only after every imported module had already been evaluated - and
// anything reading process.env at module scope would miss these values.
(0, utility_1.loadEnvLocal)(__dirname + '/../../../.env.local');
(0, node_test_1.describe)('TesseractCubeEntity', async () => {
    // Per-test live pacing. Delay is read from sdk-test-control.json's
    // `test.live.delayMs`; only sleeps when DATA_USA_TEST_LIVE=TRUE.
    (0, node_test_1.afterEach)((0, utility_1.liveDelay)('DATA_USA_TEST_LIVE'));
    (0, node_test_1.test)('instance', async () => {
        const testsdk = __1.DataUsaSDK.test();
        const ent = testsdk.TesseractCube();
        (0, node_assert_1.default)(null != ent);
    });
    (0, node_test_1.test)('basic', async (t) => {
        const live = 'TRUE' === process.env.DATA_USA_TEST_LIVE;
        for (const op of ['load']) {
            if (!live && (0, utility_1.maybeSkipControl)(t, 'entityOp', 'tesseract_cube.' + op, live))
                return;
        }
        const setup = basicSetup();
        if (setup.live) {
            return (0, live_entity_1.runLiveEntity)(setup, { "active": true, "alias": { "field": {} }, "fields": [{ "active": true, "name": "annotations", "req": true, "type": "`$OBJECT`", "index$": 0 }, { "active": true, "name": "caption", "req": true, "type": "`$STRING`", "index$": 1 }, { "active": true, "name": "dimensions", "req": true, "type": "`$ARRAY`", "index$": 2 }, { "active": true, "name": "id", "req": false, "type": "`$STRING`", "index$": 3 }, { "active": true, "name": "measures", "req": true, "type": "`$ARRAY`", "index$": 4 }, { "active": true, "name": "name", "req": true, "type": "`$STRING`", "index$": 5 }], "id": { "field": "id", "name": "id" }, "name": "tesseract_cube", "op": { "load": { "input": "data", "name": "load", "points": [{ "active": true, "args": { "header": [{ "active": true, "kind": "header", "name": "authorization", "orig": "authorization", "reqd": false, "type": "`$ANY`" }, { "active": true, "kind": "header", "name": "x_tesseract_jwt", "orig": "x_tesseract_jwt", "reqd": false, "type": "`$ANY`" }], "params": [{ "active": true, "kind": "param", "name": "id", "orig": "cube_name", "reqd": true, "type": "`$STRING`", "index$": 0 }], "query": [{ "active": true, "kind": "query", "name": "locale", "orig": "locale", "reqd": false, "type": "`$ANY`", "index$": 0 }, { "active": true, "kind": "query", "name": "token", "orig": "token", "reqd": false, "type": "`$STRING`", "index$": 1 }] }, "contract": { "id": "GET /complexity/cubes/{cube_name}", "json": "{\"operationId\":\"route_schema_cube_complexity_cubes__cube_name__get\",\"parameters\":[{\"in\":\"path\",\"name\":\"cube_name\",\"required\":true,\"schema\":{\"title\":\"Cube Name\",\"type\":\"string\"}},{\"in\":\"query\",\"name\":\"locale\",\"required\":false,\"schema\":{\"anyOf\":[{\"type\":\"string\"},{\"type\":\"null\"}],\"title\":\"Locale\"}},{\"in\":\"query\",\"name\":\"token\",\"required\":false,\"schema\":{\"anyOf\":[{\"type\":\"string\"},{\"type\":\"null\"}],\"title\":\"Token\"}},{\"in\":\"header\",\"name\":\"authorization\",\"required\":false,\"schema\":{\"anyOf\":[{\"type\":\"string\"},{\"type\":\"null\"}],\"title\":\"Authorization\"}},{\"in\":\"header\",\"name\":\"x-tesseract-jwt\",\"required\":false,\"schema\":{\"anyOf\":[{\"type\":\"string\"},{\"type\":\"null\"}],\"title\":\"X-Tesseract-Jwt\"}}],\"protocol\":\"http\",\"responses\":{\"200\":{\"content\":{\"application/json\":{\"schema\":{\"properties\":{\"annotations\":{\"additionalProperties\":{\"anyOf\":[{\"type\":\"string\"},{\"type\":\"null\"}]},\"title\":\"Annotations\",\"type\":\"object\"},\"caption\":{\"title\":\"Caption\",\"type\":\"string\"},\"dimensions\":{\"items\":{\"properties\":{\"annotations\":{\"additionalProperties\":{\"anyOf\":[{\"type\":\"string\"},{\"type\":\"null\"}]},\"title\":\"Annotations\",\"type\":\"object\"},\"caption\":{\"title\":\"Caption\",\"type\":\"string\"},\"default_hierarchy\":{\"title\":\"Default Hierarchy\",\"type\":\"string\"},\"hierarchies\":{\"items\":{\"properties\":{\"annotations\":{\"additionalProperties\":{\"anyOf\":[{\"type\":\"string\"},{\"type\":\"null\"}]},\"title\":\"Annotations\",\"type\":\"object\"},\"caption\":{\"title\":\"Caption\",\"type\":\"string\"},\"levels\":{\"items\":{\"properties\":{\"annotations\":{\"additionalProperties\":{\"anyOf\":[{\"type\":\"string\"},{\"type\":\"null\"}]},\"title\":\"Annotations\",\"type\":\"object\"},\"caption\":{\"title\":\"Caption\",\"type\":\"string\"},\"count\":{\"title\":\"Count\",\"type\":\"integer\"},\"depth\":{\"title\":\"Depth\",\"type\":\"integer\"},\"name\":{\"title\":\"Name\",\"type\":\"string\"},\"properties\":{\"items\":{\"properties\":{\"annotations\":{\"additionalProperties\":{\"anyOf\":[{\"type\":\"string\"},{\"type\":\"null\"}]},\"title\":\"Annotations\",\"type\":\"object\"},\"caption\":{\"title\":\"Caption\",\"type\":\"string\"},\"name\":{\"title\":\"Name\",\"type\":\"string\"},\"type\":{\"description\":\"Types of the data the user can expect to find in the associated column.\",\"enum\":[\"bool\",\"date\",\"time\",\"dttm\",\"stmp\",\"f32\",\"f64\",\"i8\",\"i16\",\"i32\",\"i64\",\"i128\",\"u8\",\"u16\",\"u32\",\"u64\",\"u128\",\"str\"],\"title\":\"DataType\",\"type\":\"string\"}},\"required\":[\"name\",\"caption\",\"type\",\"annotations\"],\"title\":\"TesseractProperty\",\"type\":\"object\"},\"title\":\"Properties\",\"type\":\"array\"}},\"required\":[\"name\",\"caption\",\"depth\",\"count\",\"annotations\",\"properties\"],\"title\":\"TesseractLevel\",\"type\":\"object\"},\"title\":\"Levels\",\"type\":\"array\"},\"name\":{\"title\":\"Name\",\"type\":\"string\"}},\"required\":[\"name\",\"caption\",\"annotations\",\"levels\"],\"title\":\"TesseractHierarchy\",\"type\":\"object\"},\"title\":\"Hierarchies\",\"type\":\"array\"},\"name\":{\"title\":\"Name\",\"type\":\"string\"},\"type\":{\"description\":\"Kind of data a dimension is storing.\",\"enum\":[\"standard\",\"time\",\"geo\"],\"title\":\"DimensionType\",\"type\":\"string\"}},\"required\":[\"name\",\"caption\",\"type\",\"annotations\",\"hierarchies\",\"default_hierarchy\"],\"title\":\"TesseractDimension\",\"type\":\"object\"},\"title\":\"Dimensions\",\"type\":\"array\"},\"measures\":{\"items\":{\"properties\":{\"aggregator\":{\"title\":\"Aggregator\",\"type\":\"string\"},\"annotations\":{\"additionalProperties\":{\"anyOf\":[{\"type\":\"string\"},{\"type\":\"null\"}]},\"title\":\"Annotations\",\"type\":\"object\"},\"attached\":{\"items\":{\"properties\":\"[Circular *paths./tesseract/cubes.get.responses.200.content.application/json.schema.properties.cubes.items.properties.measures.items.properties]\",\"required\":[\"name\",\"caption\",\"aggregator\",\"annotations\",\"attached\"],\"title\":\"TesseractMeasure\",\"type\":\"object\"},\"title\":\"Attached\",\"type\":\"array\"},\"caption\":{\"title\":\"Caption\",\"type\":\"string\"},\"name\":{\"title\":\"Name\",\"type\":\"string\"}},\"required\":[\"name\",\"caption\",\"aggregator\",\"annotations\",\"attached\"],\"title\":\"TesseractMeasure\",\"type\":\"object\"},\"title\":\"Measures\",\"type\":\"array\"},\"name\":{\"title\":\"Name\",\"type\":\"string\"}},\"required\":[\"name\",\"caption\",\"annotations\",\"dimensions\",\"measures\"],\"title\":\"TesseractCube\",\"type\":\"object\"}}},\"description\":\"Successful Response\"},\"422\":{\"content\":{\"application/json\":{\"schema\":{\"properties\":{\"detail\":{\"items\":{\"properties\":{\"loc\":{\"items\":{\"anyOf\":[{\"type\":\"string\"},{\"type\":\"integer\"}]},\"title\":\"Location\",\"type\":\"array\"},\"msg\":{\"title\":\"Message\",\"type\":\"string\"},\"type\":{\"title\":\"Error Type\",\"type\":\"string\"}},\"required\":[\"loc\",\"msg\",\"type\"],\"title\":\"ValidationError\",\"type\":\"object\"},\"title\":\"Detail\",\"type\":\"array\"}},\"title\":\"HTTPValidationError\",\"type\":\"object\"}}},\"description\":\"Validation Error\"}},\"securitySource\":\"unspecified\"}", "source": "openapi3", "version": 1 }, "kind": "http", "method": "GET", "orig": "/complexity/cubes/{cube_name}", "rename": { "param": { "cube_name": "id" } }, "segments": [{ "lit": "complexity" }, { "lit": "cubes" }, { "var": "id" }], "select": { "exist": ["authorization", "id", "locale", "token", "x_tesseract_jwt"] }, "transform": { "req": "`reqdata`", "res": "`body`" }, "index$": 0 }, { "active": true, "args": { "header": [{ "active": true, "kind": "header", "name": "authorization", "orig": "authorization", "reqd": false, "type": "`$ANY`" }, { "active": true, "kind": "header", "name": "x_tesseract_jwt", "orig": "x_tesseract_jwt", "reqd": false, "type": "`$ANY`" }], "params": [{ "active": true, "kind": "param", "name": "id", "orig": "cube_name", "reqd": true, "type": "`$STRING`", "index$": 0 }], "query": [{ "active": true, "kind": "query", "name": "locale", "orig": "locale", "reqd": false, "type": "`$ANY`", "index$": 0 }, { "active": true, "kind": "query", "name": "token", "orig": "token", "reqd": false, "type": "`$STRING`", "index$": 1 }] }, "contract": { "id": "GET /tesseract/cubes/{cube_name}", "json": "{\"operationId\":\"get_cube_tesseract_cubes__cube_name__get\",\"parameters\":[{\"in\":\"path\",\"name\":\"cube_name\",\"required\":true,\"schema\":{\"title\":\"Cube Name\",\"type\":\"string\"}},{\"in\":\"query\",\"name\":\"locale\",\"required\":false,\"schema\":{\"anyOf\":[{\"type\":\"string\"},{\"type\":\"null\"}],\"title\":\"Locale\"}},{\"in\":\"query\",\"name\":\"token\",\"required\":false,\"schema\":{\"anyOf\":[{\"type\":\"string\"},{\"type\":\"null\"}],\"title\":\"Token\"}},{\"in\":\"header\",\"name\":\"authorization\",\"required\":false,\"schema\":{\"anyOf\":[{\"type\":\"string\"},{\"type\":\"null\"}],\"title\":\"Authorization\"}},{\"in\":\"header\",\"name\":\"x-tesseract-jwt\",\"required\":false,\"schema\":{\"anyOf\":[{\"type\":\"string\"},{\"type\":\"null\"}],\"title\":\"X-Tesseract-Jwt\"}}],\"protocol\":\"http\",\"responses\":{\"200\":{\"content\":{\"application/json\":{\"schema\":{\"properties\":{\"annotations\":{\"additionalProperties\":{\"anyOf\":[{\"type\":\"string\"},{\"type\":\"null\"}]},\"title\":\"Annotations\",\"type\":\"object\"},\"caption\":{\"title\":\"Caption\",\"type\":\"string\"},\"dimensions\":{\"items\":{\"properties\":{\"annotations\":{\"additionalProperties\":{\"anyOf\":[{\"type\":\"string\"},{\"type\":\"null\"}]},\"title\":\"Annotations\",\"type\":\"object\"},\"caption\":{\"title\":\"Caption\",\"type\":\"string\"},\"default_hierarchy\":{\"title\":\"Default Hierarchy\",\"type\":\"string\"},\"hierarchies\":{\"items\":{\"properties\":{\"annotations\":{\"additionalProperties\":{\"anyOf\":[{\"type\":\"string\"},{\"type\":\"null\"}]},\"title\":\"Annotations\",\"type\":\"object\"},\"caption\":{\"title\":\"Caption\",\"type\":\"string\"},\"levels\":{\"items\":{\"properties\":{\"annotations\":{\"additionalProperties\":{\"anyOf\":[{\"type\":\"string\"},{\"type\":\"null\"}]},\"title\":\"Annotations\",\"type\":\"object\"},\"caption\":{\"title\":\"Caption\",\"type\":\"string\"},\"count\":{\"title\":\"Count\",\"type\":\"integer\"},\"depth\":{\"title\":\"Depth\",\"type\":\"integer\"},\"name\":{\"title\":\"Name\",\"type\":\"string\"},\"properties\":{\"items\":{\"properties\":{\"annotations\":{\"additionalProperties\":{\"anyOf\":[{\"type\":\"string\"},{\"type\":\"null\"}]},\"title\":\"Annotations\",\"type\":\"object\"},\"caption\":{\"title\":\"Caption\",\"type\":\"string\"},\"name\":{\"title\":\"Name\",\"type\":\"string\"},\"type\":{\"description\":\"Types of the data the user can expect to find in the associated column.\",\"enum\":[\"bool\",\"date\",\"time\",\"dttm\",\"stmp\",\"f32\",\"f64\",\"i8\",\"i16\",\"i32\",\"i64\",\"i128\",\"u8\",\"u16\",\"u32\",\"u64\",\"u128\",\"str\"],\"title\":\"DataType\",\"type\":\"string\"}},\"required\":[\"name\",\"caption\",\"type\",\"annotations\"],\"title\":\"TesseractProperty\",\"type\":\"object\"},\"title\":\"Properties\",\"type\":\"array\"}},\"required\":[\"name\",\"caption\",\"depth\",\"count\",\"annotations\",\"properties\"],\"title\":\"TesseractLevel\",\"type\":\"object\"},\"title\":\"Levels\",\"type\":\"array\"},\"name\":{\"title\":\"Name\",\"type\":\"string\"}},\"required\":[\"name\",\"caption\",\"annotations\",\"levels\"],\"title\":\"TesseractHierarchy\",\"type\":\"object\"},\"title\":\"Hierarchies\",\"type\":\"array\"},\"name\":{\"title\":\"Name\",\"type\":\"string\"},\"type\":{\"description\":\"Kind of data a dimension is storing.\",\"enum\":[\"standard\",\"time\",\"geo\"],\"title\":\"DimensionType\",\"type\":\"string\"}},\"required\":[\"name\",\"caption\",\"type\",\"annotations\",\"hierarchies\",\"default_hierarchy\"],\"title\":\"TesseractDimension\",\"type\":\"object\"},\"title\":\"Dimensions\",\"type\":\"array\"},\"measures\":{\"items\":{\"properties\":{\"aggregator\":{\"title\":\"Aggregator\",\"type\":\"string\"},\"annotations\":{\"additionalProperties\":{\"anyOf\":[{\"type\":\"string\"},{\"type\":\"null\"}]},\"title\":\"Annotations\",\"type\":\"object\"},\"attached\":{\"items\":{\"properties\":\"[Circular *paths./tesseract/cubes.get.responses.200.content.application/json.schema.properties.cubes.items.properties.measures.items.properties]\",\"required\":[\"name\",\"caption\",\"aggregator\",\"annotations\",\"attached\"],\"title\":\"TesseractMeasure\",\"type\":\"object\"},\"title\":\"Attached\",\"type\":\"array\"},\"caption\":{\"title\":\"Caption\",\"type\":\"string\"},\"name\":{\"title\":\"Name\",\"type\":\"string\"}},\"required\":[\"name\",\"caption\",\"aggregator\",\"annotations\",\"attached\"],\"title\":\"TesseractMeasure\",\"type\":\"object\"},\"title\":\"Measures\",\"type\":\"array\"},\"name\":{\"title\":\"Name\",\"type\":\"string\"}},\"required\":[\"name\",\"caption\",\"annotations\",\"dimensions\",\"measures\"],\"title\":\"TesseractCube\",\"type\":\"object\"}}},\"description\":\"Successful Response\"},\"422\":{\"content\":{\"application/json\":{\"schema\":{\"properties\":{\"detail\":{\"items\":{\"properties\":{\"loc\":{\"items\":{\"anyOf\":[{\"type\":\"string\"},{\"type\":\"integer\"}]},\"title\":\"Location\",\"type\":\"array\"},\"msg\":{\"title\":\"Message\",\"type\":\"string\"},\"type\":{\"title\":\"Error Type\",\"type\":\"string\"}},\"required\":[\"loc\",\"msg\",\"type\"],\"title\":\"ValidationError\",\"type\":\"object\"},\"title\":\"Detail\",\"type\":\"array\"}},\"title\":\"HTTPValidationError\",\"type\":\"object\"}}},\"description\":\"Validation Error\"}},\"securitySource\":\"unspecified\"}", "source": "openapi3", "version": 1 }, "kind": "http", "method": "GET", "orig": "/tesseract/cubes/{cube_name}", "rename": { "param": { "cube_name": "id" } }, "segments": [{ "lit": "tesseract" }, { "lit": "cubes" }, { "var": "id" }], "select": { "exist": ["authorization", "id", "locale", "token", "x_tesseract_jwt"] }, "transform": { "req": "`reqdata`", "res": "`body`" }, "index$": 1 }], "key$": "load" } }, "relations": { "ancestors": [] }, "key$": "tesseract_cube", "name__orig": "tesseract_cube", "Name": "TesseractCube", "name_": "tesseract_cube", "name-": "tesseract-cube", "NAME": "TESSERACT_CUBE", "index$": 6 }, { "active": true, "entity": "tesseract_cube", "key$": "BasicTesseractCubeFlow", "kind": "basic", "name": "BasicTesseractCubeFlow", "param": {}, "step": [{ "active": true, "data": {}, "input": { "ref": "tesseract_cube_ref01", "srcdatavar": "tesseract_cube_ref01_data", "suffix": "_dt0" }, "match": { "id": "tesseract_cube01" }, "op": "load", "spec": [], "valid": [{ "apply": "TextFieldMark", "def": { "mark": "Mark01-tesseract_cube_ref01" } }], "index$": 0 }] }, 'TesseractCube');
        }
        const client = setup.client;
        const struct = setup.struct;
        const isempty = struct.isempty;
        const select = struct.select;
        let tesseract_cube_ref01_data = Object.values(setup.data.existing.tesseract_cube)[0];
        // LOAD
        const tesseract_cube_ref01_ent = client.TesseractCube();
        const tesseract_cube_ref01_match_dt0 = {};
        tesseract_cube_ref01_match_dt0.id = tesseract_cube_ref01_data.id;
        const tesseract_cube_ref01_data_dt0 = (await tesseract_cube_ref01_ent.load(tesseract_cube_ref01_match_dt0)).data();
        (0, node_assert_1.default)(tesseract_cube_ref01_data_dt0.id === tesseract_cube_ref01_data.id);
    });
});
function basicSetup(extra) {
    // TODO: fix test def options
    const options = {}; // null
    // TODO: needs test utility to resolve path
    const entityDataFile = node_path_1.default.resolve(__dirname, '../../../../.sdk/test/entity/tesseract_cube/TesseractCubeTestData.json');
    // TODO: file ready util needed?
    const entityDataSource = Fs.readFileSync(entityDataFile).toString('utf8');
    // TODO: need a xlang JSON parse utility in voxgig/struct with better error msgs
    const entityData = JSON.parse(entityDataSource);
    options.entity = entityData.existing;
    let client = __1.DataUsaSDK.test(options, extra);
    const struct = client.utility().struct;
    const merge = struct.merge;
    const transform = struct.transform;
    let idmap = transform(['tesseract_cube01', 'tesseract_cube02', 'tesseract_cube03'], {
        '`$PACK`': ['', {
                '`$KEY`': '`$COPY`',
                '`$VAL`': ['`$FORMAT`', 'upper', '`$COPY`']
            }]
    });
    const env = (0, utility_1.envOverride)({
        'DATA_USA_TEST_TESSERACT_CUBE_ENTID': idmap,
        'DATA_USA_TEST_LIVE': 'FALSE',
        'DATA_USA_TEST_EXPLAIN': 'FALSE',
    });
    idmap = env['DATA_USA_TEST_TESSERACT_CUBE_ENTID'];
    const live = 'TRUE' === env.DATA_USA_TEST_LIVE;
    const transport = (0, live_runner_1.createLiveTransport)();
    if (live) {
        const rawIds = process.env['DATA_USA_TEST_TESSERACT_CUBE_ENTID'];
        idmap = rawIds && rawIds.trim() ? JSON.parse(rawIds) : {};
        if (!idmap || Array.isArray(idmap) || typeof idmap !== 'object') {
            throw new Error('Live ENTID must be a JSON object');
        }
        client = new __1.DataUsaSDK(merge([
            // FIRST, so the generated fields below win: sdk-test-control.json's
            // test.client.options adds to the live client, it does not redirect it.
            (0, utility_1.liveClientOptions)(),
            {},
            // 'extra || {}', not a bare 'extra': struct.merge returns UNDEFINED when the
            // last entry is undefined, and basicSetup is normally called with no
            // argument at all - so a bare 'extra' silently discarded the apikey
            // and server values above and handed the SDK undefined. Harmless
            // while there was nothing in that object; not harmless now.
            extra || {},
            { system: { fetch: transport.fetch } }
        ]));
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
    };
    return setup;
}
//# sourceMappingURL=TesseractCubeEntity.test.js.map