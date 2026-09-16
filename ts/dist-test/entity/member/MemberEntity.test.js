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
(0, node_test_1.describe)('MemberEntity', async () => {
    // Per-test live pacing. Delay is read from sdk-test-control.json's
    // `test.live.delayMs`; only sleeps when DATA_USA_TEST_LIVE=TRUE.
    (0, node_test_1.afterEach)((0, utility_1.liveDelay)('DATA_USA_TEST_LIVE'));
    (0, node_test_1.test)('instance', async () => {
        const testsdk = __1.DataUsaSDK.test();
        const ent = testsdk.Member();
        (0, node_assert_1.default)(null != ent);
    });
    (0, node_test_1.test)('basic', async (t) => {
        const live = 'TRUE' === process.env.DATA_USA_TEST_LIVE;
        for (const op of ['list']) {
            if (!live && (0, utility_1.maybeSkipControl)(t, 'entityOp', 'member.' + op, live))
                return;
        }
        const setup = basicSetup();
        if (setup.live) {
            return (0, live_entity_1.runLiveEntity)(setup, { "active": true, "alias": { "field": {} }, "fields": [{ "active": true, "name": "annotations", "req": true, "type": "`$OBJECT`", "index$": 0 }, { "active": true, "name": "caption", "req": true, "type": "`$STRING`", "index$": 1 }, { "active": true, "name": "name", "req": true, "type": "`$STRING`", "index$": 2 }, { "active": true, "name": "type", "req": true, "short": "Types of the data the user can expect to find in the associated column.", "type": "`$STRING`", "index$": 3 }], "name": "member", "op": { "list": { "input": "data", "name": "list", "points": [{ "active": true, "args": { "header": [{ "active": true, "kind": "header", "name": "authorization", "orig": "authorization", "reqd": false, "type": "`$ANY`" }, { "active": true, "kind": "header", "name": "x_tesseract_jwt", "orig": "x_tesseract_jwt", "reqd": false, "type": "`$ANY`" }], "query": [{ "active": true, "kind": "query", "name": "cube", "orig": "cube", "reqd": true, "type": "`$STRING`", "index$": 0 }, { "active": true, "kind": "query", "name": "level", "orig": "level", "reqd": true, "type": "`$STRING`", "index$": 1 }, { "active": true, "example": "0", "kind": "query", "name": "limit", "orig": "limit", "reqd": false, "type": "`$STRING`", "index$": 2 }, { "active": true, "kind": "query", "name": "locale", "orig": "locale", "reqd": false, "type": "`$ANY`", "index$": 3 }, { "active": true, "example": false, "kind": "query", "name": "parent", "orig": "parent", "reqd": false, "type": "`$BOOLEAN`", "index$": 4 }, { "active": true, "example": "", "kind": "query", "name": "search", "orig": "search", "reqd": false, "type": "`$STRING`", "index$": 5 }, { "active": true, "kind": "query", "name": "token", "orig": "token", "reqd": false, "type": "`$STRING`", "index$": 6 }] }, "contract": { "id": "GET /tesseract/members", "json": "{\"operationId\":\"get_members_tesseract_members_get\",\"parameters\":[{\"description\":\"The name of the cube to work with.\",\"in\":\"query\",\"name\":\"cube\",\"required\":true,\"schema\":{\"description\":\"The name of the cube to work with.\",\"title\":\"Cube\",\"type\":\"string\"}},{\"in\":\"query\",\"name\":\"level\",\"required\":true,\"schema\":{\"title\":\"Level\",\"type\":\"string\"}},{\"in\":\"query\",\"name\":\"locale\",\"required\":false,\"schema\":{\"anyOf\":[{\"type\":\"string\"},{\"type\":\"null\"}],\"title\":\"Locale\"}},{\"description\":\"Specifies pagination on the results, so the query can be separated in multiple requests.\\n\\nThe shape of the parameter is composed by one integer, or two integers separated by a comma:\\n    `{value}` := `{limit}` | `{limit},{offset}`\\nWhere:\\n    `{limit}` : `int`, defines the max amount of items in the response data\\n    `{offset}` : `int`, defines the index of the first item in the full list where the list in the response data will start.\\n\",\"in\":\"query\",\"name\":\"limit\",\"required\":false,\"schema\":{\"default\":\"0\",\"description\":\"Specifies pagination on the results, so the query can be separated in multiple requests.\\n\\nThe shape of the parameter is composed by one integer, or two integers separated by a comma:\\n    `{value}` := `{limit}` | `{limit},{offset}`\\nWhere:\\n    `{limit}` : `int`, defines the max amount of items in the response data\\n    `{offset}` : `int`, defines the index of the first item in the full list where the list in the response data will start.\\n\",\"title\":\"Limit\",\"type\":\"string\"}},{\"in\":\"query\",\"name\":\"parents\",\"required\":false,\"schema\":{\"default\":false,\"title\":\"Parents\",\"type\":\"boolean\"}},{\"in\":\"query\",\"name\":\"search\",\"required\":false,\"schema\":{\"default\":\"\",\"title\":\"Search\",\"type\":\"string\"}},{\"in\":\"query\",\"name\":\"token\",\"required\":false,\"schema\":{\"anyOf\":[{\"type\":\"string\"},{\"type\":\"null\"}],\"title\":\"Token\"}},{\"in\":\"header\",\"name\":\"authorization\",\"required\":false,\"schema\":{\"anyOf\":[{\"type\":\"string\"},{\"type\":\"null\"}],\"title\":\"Authorization\"}},{\"in\":\"header\",\"name\":\"x-tesseract-jwt\",\"required\":false,\"schema\":{\"anyOf\":[{\"type\":\"string\"},{\"type\":\"null\"}],\"title\":\"X-Tesseract-Jwt\"}}],\"protocol\":\"http\",\"responses\":{\"200\":{\"content\":{\"application/json\":{\"schema\":{\"properties\":{\"annotations\":{\"additionalProperties\":{\"anyOf\":[{\"type\":\"string\"},{\"type\":\"null\"}]},\"title\":\"Annotations\",\"type\":\"object\"},\"caption\":{\"title\":\"Caption\",\"type\":\"string\"},\"depth\":{\"title\":\"Depth\",\"type\":\"integer\"},\"dtypes\":{\"additionalProperties\":{\"description\":\"Types of the data the user can expect to find in the associated column.\",\"enum\":[\"bool\",\"date\",\"time\",\"dttm\",\"stmp\",\"f32\",\"f64\",\"i8\",\"i16\",\"i32\",\"i64\",\"i128\",\"u8\",\"u16\",\"u32\",\"u64\",\"u128\",\"str\"],\"title\":\"DataType\",\"type\":\"string\"},\"title\":\"Dtypes\",\"type\":\"object\"},\"members\":{\"items\":{\"additionalProperties\":true,\"type\":\"object\"},\"title\":\"Members\",\"type\":\"array\"},\"name\":{\"title\":\"Name\",\"type\":\"string\"},\"properties\":{\"items\":{\"properties\":{\"annotations\":{\"additionalProperties\":{\"anyOf\":[{\"type\":\"string\"},{\"type\":\"null\"}]},\"title\":\"Annotations\",\"type\":\"object\"},\"caption\":{\"title\":\"Caption\",\"type\":\"string\"},\"name\":{\"title\":\"Name\",\"type\":\"string\"},\"type\":{\"description\":\"Types of the data the user can expect to find in the associated column.\",\"enum\":[\"bool\",\"date\",\"time\",\"dttm\",\"stmp\",\"f32\",\"f64\",\"i8\",\"i16\",\"i32\",\"i64\",\"i128\",\"u8\",\"u16\",\"u32\",\"u64\",\"u128\",\"str\"],\"title\":\"DataType\",\"type\":\"string\"}},\"required\":[\"name\",\"caption\",\"type\",\"annotations\"],\"title\":\"TesseractProperty\",\"type\":\"object\"},\"title\":\"Properties\",\"type\":\"array\"}},\"required\":[\"name\",\"caption\",\"depth\",\"annotations\",\"properties\",\"dtypes\",\"members\"],\"title\":\"MembersResModel\",\"type\":\"object\"}}},\"description\":\"Successful Response\"},\"422\":{\"content\":{\"application/json\":{\"schema\":{\"properties\":{\"detail\":{\"items\":{\"properties\":{\"loc\":{\"items\":{\"anyOf\":[{\"type\":\"string\"},{\"type\":\"integer\"}]},\"title\":\"Location\",\"type\":\"array\"},\"msg\":{\"title\":\"Message\",\"type\":\"string\"},\"type\":{\"title\":\"Error Type\",\"type\":\"string\"}},\"required\":[\"loc\",\"msg\",\"type\"],\"title\":\"ValidationError\",\"type\":\"object\"},\"title\":\"Detail\",\"type\":\"array\"}},\"title\":\"HTTPValidationError\",\"type\":\"object\"}}},\"description\":\"Validation Error\"}},\"securitySource\":\"unspecified\"}", "source": "openapi3", "version": 1 }, "kind": "http", "method": "GET", "orig": "/tesseract/members", "segments": [{ "lit": "tesseract" }, { "lit": "members" }], "select": { "exist": ["authorization", "cube", "level", "limit", "locale", "parent", "search", "token", "x_tesseract_jwt"] }, "transform": { "req": "`reqdata`", "res": "`body`" }, "index$": 0 }], "key$": "list" } }, "relations": { "ancestors": [] }, "key$": "member", "name__orig": "member", "Name": "Member", "name_": "member", "name-": "member", "NAME": "MEMBER", "index$": 3 }, { "active": true, "entity": "member", "key$": "BasicMemberFlow", "kind": "basic", "name": "BasicMemberFlow", "param": {}, "step": [{ "active": true, "data": {}, "input": {}, "match": {}, "op": "list", "spec": [], "valid": [{ "apply": "ItemExists", "def": { "ref": "member_ref01" } }], "index$": 0 }] }, 'Member');
        }
        const client = setup.client;
        const struct = setup.struct;
        const isempty = struct.isempty;
        const select = struct.select;
        let member_ref01_data = Object.values(setup.data.existing.member)[0];
        // LIST
        const member_ref01_ent = client.Member();
        const member_ref01_match = {};
        const member_ref01_list = (await member_ref01_ent.list(member_ref01_match)).map((e) => e.data());
    });
});
function basicSetup(extra) {
    // TODO: fix test def options
    const options = {}; // null
    // TODO: needs test utility to resolve path
    const entityDataFile = node_path_1.default.resolve(__dirname, '../../../../.sdk/test/entity/member/MemberTestData.json');
    // TODO: file ready util needed?
    const entityDataSource = Fs.readFileSync(entityDataFile).toString('utf8');
    // TODO: need a xlang JSON parse utility in voxgig/struct with better error msgs
    const entityData = JSON.parse(entityDataSource);
    options.entity = entityData.existing;
    let client = __1.DataUsaSDK.test(options, extra);
    const struct = client.utility().struct;
    const merge = struct.merge;
    const transform = struct.transform;
    let idmap = transform(['member01', 'member02', 'member03'], {
        '`$PACK`': ['', {
                '`$KEY`': '`$COPY`',
                '`$VAL`': ['`$FORMAT`', 'upper', '`$COPY`']
            }]
    });
    const env = (0, utility_1.envOverride)({
        'DATA_USA_TEST_MEMBER_ENTID': idmap,
        'DATA_USA_TEST_LIVE': 'FALSE',
        'DATA_USA_TEST_EXPLAIN': 'FALSE',
    });
    idmap = env['DATA_USA_TEST_MEMBER_ENTID'];
    const live = 'TRUE' === env.DATA_USA_TEST_LIVE;
    const transport = (0, live_runner_1.createLiveTransport)();
    if (live) {
        const rawIds = process.env['DATA_USA_TEST_MEMBER_ENTID'];
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
//# sourceMappingURL=MemberEntity.test.js.map