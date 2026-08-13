# DataUsa SDK feature factory

from datausa_sdk.feature.base_feature import DataUsaBaseFeature
from datausa_sdk.feature.test_feature import DataUsaTestFeature


def _make_feature(name):
    features = {
        "base": lambda: DataUsaBaseFeature(),
        "test": lambda: DataUsaTestFeature(),
    }
    factory = features.get(name)
    if factory is not None:
        return factory()
    return features["base"]()
