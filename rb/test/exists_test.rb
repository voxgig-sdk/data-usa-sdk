# DataUsa SDK exists test

require "minitest/autorun"
require_relative "../DataUsa_sdk"

class ExistsTest < Minitest::Test
  def test_create_test_sdk
    testsdk = DataUsaSDK.test(nil, nil)
    assert !testsdk.nil?
  end
end
