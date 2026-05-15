# DataUsa SDK utility: make_context
require_relative '../core/context'
module DataUsaUtilities
  MakeContext = ->(ctxmap, basectx) {
    DataUsaContext.new(ctxmap, basectx)
  }
end
