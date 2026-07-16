<?php
declare(strict_types=1);

// DataUsa SDK base feature

class DataUsaBaseFeature
{
    public string $version;
    public string $name;
    public bool $active;

    // Positions this feature when added via the client `extend` option:
    // "__before__" / "__after__" / "__replace__" name an already-added
    // feature (mirrors the ts feature `_options`). Declared so setting it
    // on an extension instance avoids the dynamic-property deprecation.
    public ?array $_options = null;

    public function __construct()
    {
        $this->version = '0.0.1';
        $this->name = 'base';
        $this->active = true;
    }

    public function get_version(): string { return $this->version; }
    public function get_name(): string { return $this->name; }
    public function get_active(): bool { return $this->active; }

    public function init(DataUsaContext $ctx, array $options): void {}
    public function PostConstruct(DataUsaContext $ctx): void {}
    public function PostConstructEntity(DataUsaContext $ctx): void {}
    public function SetData(DataUsaContext $ctx): void {}
    public function GetData(DataUsaContext $ctx): void {}
    public function GetMatch(DataUsaContext $ctx): void {}
    public function SetMatch(DataUsaContext $ctx): void {}
    public function PrePoint(DataUsaContext $ctx): void {}
    public function PreSpec(DataUsaContext $ctx): void {}
    public function PreRequest(DataUsaContext $ctx): void {}
    public function PreResponse(DataUsaContext $ctx): void {}
    public function PreResult(DataUsaContext $ctx): void {}
    public function PreDone(DataUsaContext $ctx): void {}
    public function PreUnexpected(DataUsaContext $ctx): void {}
}
