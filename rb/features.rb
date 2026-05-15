# DataUsa SDK feature factory

require_relative 'feature/base_feature'
require_relative 'feature/test_feature'


module DataUsaFeatures
  def self.make_feature(name)
    case name
    when "base"
      DataUsaBaseFeature.new
    when "test"
      DataUsaTestFeature.new
    else
      DataUsaBaseFeature.new
    end
  end
end
