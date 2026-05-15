<?php
declare(strict_types=1);

// DataUsa SDK exists test

require_once __DIR__ . '/../datausa_sdk.php';

use PHPUnit\Framework\TestCase;

class ExistsTest extends TestCase
{
    public function test_create_test_sdk(): void
    {
        $testsdk = DataUsaSDK::test(null, null);
        $this->assertNotNull($testsdk);
    }
}
