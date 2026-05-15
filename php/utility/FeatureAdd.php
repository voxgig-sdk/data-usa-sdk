<?php
declare(strict_types=1);

// DataUsa SDK utility: feature_add

class DataUsaFeatureAdd
{
    public static function call(DataUsaContext $ctx, mixed $f): void
    {
        $ctx->client->features[] = $f;
    }
}
