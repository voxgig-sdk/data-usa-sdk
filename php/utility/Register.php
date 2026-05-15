<?php
declare(strict_types=1);

// DataUsa SDK utility registration

require_once __DIR__ . '/../core/UtilityType.php';
require_once __DIR__ . '/Clean.php';
require_once __DIR__ . '/Done.php';
require_once __DIR__ . '/MakeError.php';
require_once __DIR__ . '/FeatureAdd.php';
require_once __DIR__ . '/FeatureHook.php';
require_once __DIR__ . '/FeatureInit.php';
require_once __DIR__ . '/Fetcher.php';
require_once __DIR__ . '/MakeFetchDef.php';
require_once __DIR__ . '/MakeContext.php';
require_once __DIR__ . '/MakeOptions.php';
require_once __DIR__ . '/MakeRequest.php';
require_once __DIR__ . '/MakeResponse.php';
require_once __DIR__ . '/MakeResult.php';
require_once __DIR__ . '/MakePoint.php';
require_once __DIR__ . '/MakeSpec.php';
require_once __DIR__ . '/MakeUrl.php';
require_once __DIR__ . '/Param.php';
require_once __DIR__ . '/PrepareAuth.php';
require_once __DIR__ . '/PrepareBody.php';
require_once __DIR__ . '/PrepareHeaders.php';
require_once __DIR__ . '/PrepareMethod.php';
require_once __DIR__ . '/PrepareParams.php';
require_once __DIR__ . '/PreparePath.php';
require_once __DIR__ . '/PrepareQuery.php';
require_once __DIR__ . '/ResultBasic.php';
require_once __DIR__ . '/ResultBody.php';
require_once __DIR__ . '/ResultHeaders.php';
require_once __DIR__ . '/TransformRequest.php';
require_once __DIR__ . '/TransformResponse.php';

DataUsaUtility::setRegistrar(function (DataUsaUtility $u): void {
    $u->clean = [DataUsaClean::class, 'call'];
    $u->done = [DataUsaDone::class, 'call'];
    $u->make_error = [DataUsaMakeError::class, 'call'];
    $u->feature_add = [DataUsaFeatureAdd::class, 'call'];
    $u->feature_hook = [DataUsaFeatureHook::class, 'call'];
    $u->feature_init = [DataUsaFeatureInit::class, 'call'];
    $u->fetcher = [DataUsaFetcher::class, 'call'];
    $u->make_fetch_def = [DataUsaMakeFetchDef::class, 'call'];
    $u->make_context = [DataUsaMakeContext::class, 'call'];
    $u->make_options = [DataUsaMakeOptions::class, 'call'];
    $u->make_request = [DataUsaMakeRequest::class, 'call'];
    $u->make_response = [DataUsaMakeResponse::class, 'call'];
    $u->make_result = [DataUsaMakeResult::class, 'call'];
    $u->make_point = [DataUsaMakePoint::class, 'call'];
    $u->make_spec = [DataUsaMakeSpec::class, 'call'];
    $u->make_url = [DataUsaMakeUrl::class, 'call'];
    $u->param = [DataUsaParam::class, 'call'];
    $u->prepare_auth = [DataUsaPrepareAuth::class, 'call'];
    $u->prepare_body = [DataUsaPrepareBody::class, 'call'];
    $u->prepare_headers = [DataUsaPrepareHeaders::class, 'call'];
    $u->prepare_method = [DataUsaPrepareMethod::class, 'call'];
    $u->prepare_params = [DataUsaPrepareParams::class, 'call'];
    $u->prepare_path = [DataUsaPreparePath::class, 'call'];
    $u->prepare_query = [DataUsaPrepareQuery::class, 'call'];
    $u->result_basic = [DataUsaResultBasic::class, 'call'];
    $u->result_body = [DataUsaResultBody::class, 'call'];
    $u->result_headers = [DataUsaResultHeaders::class, 'call'];
    $u->transform_request = [DataUsaTransformRequest::class, 'call'];
    $u->transform_response = [DataUsaTransformResponse::class, 'call'];
});
