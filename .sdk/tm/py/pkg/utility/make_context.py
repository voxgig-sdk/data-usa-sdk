# DataUsa SDK utility: make_context

from projectname_sdk.core.context import DataUsaContext


def make_context_util(ctxmap, basectx):
    return DataUsaContext(ctxmap, basectx)
