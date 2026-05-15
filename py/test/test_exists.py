# ProjectName SDK exists test

import pytest
from datausa_sdk import DataUsaSDK


class TestExists:

    def test_should_create_test_sdk(self):
        testsdk = DataUsaSDK.test(None, None)
        assert testsdk is not None
