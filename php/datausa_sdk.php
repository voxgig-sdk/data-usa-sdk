<?php
declare(strict_types=1);

// DataUsa SDK

require_once __DIR__ . '/utility/struct/Struct.php';
require_once __DIR__ . '/core/UtilityType.php';
require_once __DIR__ . '/core/Spec.php';
require_once __DIR__ . '/core/Helpers.php';

// Load utility registration
require_once __DIR__ . '/utility/Register.php';

// Load config and features
require_once __DIR__ . '/config.php';
require_once __DIR__ . '/feature/BaseFeature.php';
require_once __DIR__ . '/features.php';

use Voxgig\Struct\Struct;

class DataUsaSDK
{
    public string $mode;
    public array $features;
    public ?array $options;

    private $_utility;
    private $_rootctx;

    public function __construct(array $options = [])
    {
        $this->mode = "live";
        $this->features = [];
        $this->options = null;

        $utility = new DataUsaUtility();
        $this->_utility = $utility;

        $config = DataUsaConfig::make_config();

        $this->_rootctx = ($utility->make_context)([
            "client" => $this,
            "utility" => $utility,
            "config" => $config,
            "options" => $options ?? [],
            "shared" => [],
        ], null);

        $this->options = ($utility->make_options)($this->_rootctx);

        if (Struct::getpath($this->options, "feature.test.active") === true) {
            $this->mode = "test";
        }

        $this->_rootctx->options = $this->options;

        // Add features from config.
        $feature_opts = DataUsaHelpers::to_map(Struct::getprop($this->options, "feature"));
        if ($feature_opts) {
            $items = Struct::items($feature_opts);
            if ($items) {
                foreach ($items as $item) {
                    $fname = $item[0];
                    $fopts = DataUsaHelpers::to_map($item[1]);
                    if ($fopts && isset($fopts["active"]) && $fopts["active"] === true) {
                        ($utility->feature_add)($this->_rootctx, DataUsaFeatures::make_feature($fname));
                    }
                }
            }
        }

        // Add extension features.
        $extend_val = Struct::getprop($this->options, "extend");
        if (is_array($extend_val)) {
            foreach ($extend_val as $f) {
                if (is_object($f) && method_exists($f, 'get_name')) {
                    ($utility->feature_add)($this->_rootctx, $f);
                }
            }
        }

        // Initialize features.
        foreach ($this->features as $f) {
            ($utility->feature_init)($this->_rootctx, $f);
        }

        ($utility->feature_hook)($this->_rootctx, "PostConstruct");
    }

    public function options_map(): array
    {
        $out = Struct::clone($this->options);
        return is_array($out) ? $out : [];
    }

    public function get_utility()
    {
        return DataUsaUtility::copy($this->_utility);
    }

    public function get_root_ctx()
    {
        return $this->_rootctx;
    }

    public function prepare(array $fetchargs = []): mixed
    {
        $utility = $this->_utility;
        $fetchargs = $fetchargs ?? [];

        $ctrl = DataUsaHelpers::to_map(Struct::getprop($fetchargs, "ctrl")) ?? [];

        $ctx = ($utility->make_context)([
            "opname" => "prepare",
            "ctrl" => $ctrl,
        ], $this->_rootctx);

        $opts = $this->options;
        $path = Struct::getprop($fetchargs, "path") ?? "";
        $path = is_string($path) ? $path : "";
        $method_val = Struct::getprop($fetchargs, "method") ?? "GET";
        $method_val = is_string($method_val) ? $method_val : "GET";
        $params = DataUsaHelpers::to_map(Struct::getprop($fetchargs, "params")) ?? [];
        $query = DataUsaHelpers::to_map(Struct::getprop($fetchargs, "query")) ?? [];
        $headers = ($utility->prepare_headers)($ctx);

        $base = Struct::getprop($opts, "base") ?? "";
        $base = is_string($base) ? $base : "";
        $prefix = Struct::getprop($opts, "prefix") ?? "";
        $prefix = is_string($prefix) ? $prefix : "";
        $suffix = Struct::getprop($opts, "suffix") ?? "";
        $suffix = is_string($suffix) ? $suffix : "";

        $ctx->spec = new DataUsaSpec([
            "base" => $base, "prefix" => $prefix, "suffix" => $suffix,
            "path" => $path, "method" => $method_val,
            "params" => $params, "query" => $query, "headers" => $headers,
            "body" => Struct::getprop($fetchargs, "body"),
            "step" => "start",
        ]);

        // Merge user-provided headers.
        $uh = Struct::getprop($fetchargs, "headers");
        if (is_array($uh)) {
            foreach ($uh as $k => $v) {
                $ctx->spec->headers[$k] = $v;
            }
        }

        [$_, $err] = ($utility->prepare_auth)($ctx);
        if ($err) {
            return ($utility->make_error)($ctx, $err);
        }

        [$fetchdef, $fd_err] = ($utility->make_fetch_def)($ctx);
        if ($fd_err) {
            return ($utility->make_error)($ctx, $fd_err);
        }
        return $fetchdef;
    }

    public function direct(array $fetchargs = []): mixed
    {
        $utility = $this->_utility;

        // direct() is the raw-HTTP escape hatch: it never throws, it returns
        // an {ok, err, ...} dict. prepare() now raises on error, so catch it
        // and surface the failure through the dict instead.
        try {
            $fetchdef = $this->prepare($fetchargs);
        } catch (\Throwable $err) {
            return ["ok" => false, "err" => $err];
        }

        $fetchargs = $fetchargs ?? [];
        $ctrl = DataUsaHelpers::to_map(Struct::getprop($fetchargs, "ctrl")) ?? [];

        $ctx = ($utility->make_context)([
            "opname" => "direct",
            "ctrl" => $ctrl,
        ], $this->_rootctx);

        $url = $fetchdef["url"] ?? "";
        [$fetched, $fetch_err] = ($utility->fetcher)($ctx, $url, $fetchdef);

        if ($fetch_err) {
            return ["ok" => false, "err" => $fetch_err];
        }

        if ($fetched === null) {
            return [
                "ok" => false,
                "err" => $ctx->make_error("direct_no_response", "response: undefined"),
            ];
        }

        if (is_array($fetched)) {
            $status = DataUsaHelpers::to_int(Struct::getprop($fetched, "status"));
            $headers = Struct::getprop($fetched, "headers") ?? [];

            // No-body responses (204, 304) and explicit zero content-length
            // must skip JSON parsing — calling json() on an empty body errors.
            $content_length = is_array($headers) ? ($headers["content-length"] ?? null) : null;
            $no_body = $status === 204 || $status === 304 || (string)$content_length === "0";

            $json_data = null;
            if (!$no_body) {
                $jf = Struct::getprop($fetched, "json");
                if (is_callable($jf)) {
                    try {
                        $json_data = $jf();
                    } catch (\Throwable $e) {
                        // Non-JSON body — leave data null but keep status/ok.
                        $json_data = null;
                    }
                }
            }

            return [
                "ok" => $status >= 200 && $status < 300,
                "status" => $status,
                "headers" => Struct::getprop($fetched, "headers"),
                "data" => $json_data,
            ];
        }

        return [
            "ok" => false,
            "err" => $ctx->make_error("direct_invalid", "invalid response type"),
        ];
    }


    private $_calculations_module = null;

    // Canonical facade: $client->CalculationsModule()->list() / ->load(["id" => ...]).
    // PHP method names are case-insensitive, so lowercase $client->calculations_module()
    // resolves here too.
    public function CalculationsModule($data = null)
    {
        require_once __DIR__ . '/entity/calculations_module_entity.php';
        if ($data === null) {
            if ($this->_calculations_module === null) {
                $this->_calculations_module = new CalculationsModuleEntity($this, null);
            }
            return $this->_calculations_module;
        }
        return new CalculationsModuleEntity($this, $data);
    }


    private $_economic_complexity_module = null;

    // Canonical facade: $client->EconomicComplexityModule()->list() / ->load(["id" => ...]).
    // PHP method names are case-insensitive, so lowercase $client->economic_complexity_module()
    // resolves here too.
    public function EconomicComplexityModule($data = null)
    {
        require_once __DIR__ . '/entity/economic_complexity_module_entity.php';
        if ($data === null) {
            if ($this->_economic_complexity_module === null) {
                $this->_economic_complexity_module = new EconomicComplexityModuleEntity($this, null);
            }
            return $this->_economic_complexity_module;
        }
        return new EconomicComplexityModuleEntity($this, $data);
    }


    private $_health = null;

    // Canonical facade: $client->Health()->list() / ->load(["id" => ...]).
    // PHP method names are case-insensitive, so lowercase $client->health()
    // resolves here too.
    public function Health($data = null)
    {
        require_once __DIR__ . '/entity/health_entity.php';
        if ($data === null) {
            if ($this->_health === null) {
                $this->_health = new HealthEntity($this, null);
            }
            return $this->_health;
        }
        return new HealthEntity($this, $data);
    }


    private $_member = null;

    // Canonical facade: $client->Member()->list() / ->load(["id" => ...]).
    // PHP method names are case-insensitive, so lowercase $client->member()
    // resolves here too.
    public function Member($data = null)
    {
        require_once __DIR__ . '/entity/member_entity.php';
        if ($data === null) {
            if ($this->_member === null) {
                $this->_member = new MemberEntity($this, null);
            }
            return $this->_member;
        }
        return new MemberEntity($this, $data);
    }


    private $_module_status = null;

    // Canonical facade: $client->ModuleStatus()->list() / ->load(["id" => ...]).
    // PHP method names are case-insensitive, so lowercase $client->module_status()
    // resolves here too.
    public function ModuleStatus($data = null)
    {
        require_once __DIR__ . '/entity/module_status_entity.php';
        if ($data === null) {
            if ($this->_module_status === null) {
                $this->_module_status = new ModuleStatusEntity($this, null);
            }
            return $this->_module_status;
        }
        return new ModuleStatusEntity($this, $data);
    }


    private $_route_index_get = null;

    // Canonical facade: $client->RouteIndexGet()->list() / ->load(["id" => ...]).
    // PHP method names are case-insensitive, so lowercase $client->route_index_get()
    // resolves here too.
    public function RouteIndexGet($data = null)
    {
        require_once __DIR__ . '/entity/route_index_get_entity.php';
        if ($data === null) {
            if ($this->_route_index_get === null) {
                $this->_route_index_get = new RouteIndexGetEntity($this, null);
            }
            return $this->_route_index_get;
        }
        return new RouteIndexGetEntity($this, $data);
    }


    private $_tesseract_cube = null;

    // Canonical facade: $client->TesseractCube()->list() / ->load(["id" => ...]).
    // PHP method names are case-insensitive, so lowercase $client->tesseract_cube()
    // resolves here too.
    public function TesseractCube($data = null)
    {
        require_once __DIR__ . '/entity/tesseract_cube_entity.php';
        if ($data === null) {
            if ($this->_tesseract_cube === null) {
                $this->_tesseract_cube = new TesseractCubeEntity($this, null);
            }
            return $this->_tesseract_cube;
        }
        return new TesseractCubeEntity($this, $data);
    }


    private $_tesseract_module = null;

    // Canonical facade: $client->TesseractModule()->list() / ->load(["id" => ...]).
    // PHP method names are case-insensitive, so lowercase $client->tesseract_module()
    // resolves here too.
    public function TesseractModule($data = null)
    {
        require_once __DIR__ . '/entity/tesseract_module_entity.php';
        if ($data === null) {
            if ($this->_tesseract_module === null) {
                $this->_tesseract_module = new TesseractModuleEntity($this, null);
            }
            return $this->_tesseract_module;
        }
        return new TesseractModuleEntity($this, $data);
    }


    private $_tesseract_schema = null;

    // Canonical facade: $client->TesseractSchema()->list() / ->load(["id" => ...]).
    // PHP method names are case-insensitive, so lowercase $client->tesseract_schema()
    // resolves here too.
    public function TesseractSchema($data = null)
    {
        require_once __DIR__ . '/entity/tesseract_schema_entity.php';
        if ($data === null) {
            if ($this->_tesseract_schema === null) {
                $this->_tesseract_schema = new TesseractSchemaEntity($this, null);
            }
            return $this->_tesseract_schema;
        }
        return new TesseractSchemaEntity($this, $data);
    }



    public static function test(?array $testopts = null, ?array $sdkopts = null): self
    {
        $sdkopts = $sdkopts ?? [];
        $sdkopts = Struct::clone($sdkopts);
        $sdkopts = is_array($sdkopts) ? $sdkopts : [];

        $testopts = $testopts ?? [];
        $testopts = Struct::clone($testopts);
        $testopts = is_array($testopts) ? $testopts : [];
        $testopts["active"] = true;

        if (!isset($sdkopts["feature"])) {
            $sdkopts["feature"] = [];
        }
        $sdkopts["feature"]["test"] = $testopts;

        $sdk = new DataUsaSDK($sdkopts);
        $sdk->mode = "test";
        return $sdk;
    }
}
