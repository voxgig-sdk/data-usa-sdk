<?php
declare(strict_types=1);

// DataUsa SDK feature factory

require_once __DIR__ . '/feature/BaseFeature.php';
require_once __DIR__ . '/feature/TestFeature.php';


class DataUsaFeatures
{
    public static function make_feature(string $name)
    {
        switch ($name) {
            case "base":
                return new DataUsaBaseFeature();
            case "test":
                return new DataUsaTestFeature();
            default:
                return new DataUsaBaseFeature();
        }
    }
}
