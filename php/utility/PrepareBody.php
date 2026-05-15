<?php
declare(strict_types=1);

// DataUsa SDK utility: prepare_body

class DataUsaPrepareBody
{
    public static function call(DataUsaContext $ctx): mixed
    {
        if ($ctx->op->input === 'data') {
            return ($ctx->utility->transform_request)($ctx);
        }
        return null;
    }
}
