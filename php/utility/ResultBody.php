<?php
declare(strict_types=1);

// DataUsa SDK utility: result_body

class DataUsaResultBody
{
    public static function call(DataUsaContext $ctx): ?DataUsaResult
    {
        $response = $ctx->response;
        $result = $ctx->result;
        if ($result && $response && $response->json_func && $response->body) {
            $result->body = ($response->json_func)();
        }
        return $result;
    }
}
