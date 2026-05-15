<?php
declare(strict_types=1);

// DataUsa SDK utility: result_headers

class DataUsaResultHeaders
{
    public static function call(DataUsaContext $ctx): ?DataUsaResult
    {
        $response = $ctx->response;
        $result = $ctx->result;
        if ($result) {
            if ($response && is_array($response->headers)) {
                $result->headers = $response->headers;
            } else {
                $result->headers = [];
            }
        }
        return $result;
    }
}
