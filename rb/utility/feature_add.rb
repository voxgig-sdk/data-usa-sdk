# DataUsa SDK utility: feature_add
module DataUsaUtilities
  FeatureAdd = ->(ctx, f) {
    ctx.client.features << f
  }
end
