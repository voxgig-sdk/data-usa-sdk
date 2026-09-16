# DataUsa SDK feature factory

require_relative 'feature/base_feature'
require_relative 'feature/ratelimit_feature'
require_relative 'feature/retry_feature'
require_relative 'feature/test_feature'
require_relative 'feature/timeout_feature'


module DataUsaFeatures
  def self.make_feature(name)
    case name
    when "base"
      DataUsaBaseFeature.new
    when "ratelimit"
      DataUsaRatelimitFeature.new
    when "retry"
      DataUsaRetryFeature.new
    when "test"
      DataUsaTestFeature.new
    when "timeout"
      DataUsaTimeoutFeature.new
    else
      DataUsaBaseFeature.new
    end
  end
end
