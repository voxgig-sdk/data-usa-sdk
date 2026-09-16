# DataUsa SDK feature factory

from datausa_sdk.feature.base_feature import DataUsaBaseFeature
from datausa_sdk.feature.ratelimit_feature import DataUsaRatelimitFeature
from datausa_sdk.feature.retry_feature import DataUsaRetryFeature
from datausa_sdk.feature.test_feature import DataUsaTestFeature
from datausa_sdk.feature.timeout_feature import DataUsaTimeoutFeature


_FEATURES = {
    "base": lambda: DataUsaBaseFeature(),
    "ratelimit": lambda: DataUsaRatelimitFeature(),
    "retry": lambda: DataUsaRetryFeature(),
    "test": lambda: DataUsaTestFeature(),
    "timeout": lambda: DataUsaTimeoutFeature(),
}


def _make_feature(name):
    factory = _FEATURES.get(name)
    if factory is not None:
        return factory()
    return _FEATURES["base"]()


# True when this SDK was generated with the named feature class - the
# constructor's tolerance for extend-carried features reads this (an
# active name with no generated class must not become a BaseFeature
# stray when an extend instance carries it).
def _has_feature(name):
    return name in _FEATURES
