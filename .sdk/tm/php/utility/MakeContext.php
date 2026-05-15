<?php
declare(strict_types=1);

// DataUsa SDK utility: make_context

require_once __DIR__ . '/../core/Context.php';

class DataUsaMakeContext
{
    public static function call(array $ctxmap, ?DataUsaContext $basectx): DataUsaContext
    {
        return new DataUsaContext($ctxmap, $basectx);
    }
}
