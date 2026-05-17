package voxgigdatausasdk

import (
	"github.com/voxgig-sdk/data-usa-sdk/go/core"
	"github.com/voxgig-sdk/data-usa-sdk/go/entity"
	"github.com/voxgig-sdk/data-usa-sdk/go/feature"
	_ "github.com/voxgig-sdk/data-usa-sdk/go/utility"
)

// Type aliases preserve external API.
type DataUsaSDK = core.DataUsaSDK
type Context = core.Context
type Utility = core.Utility
type Feature = core.Feature
type Entity = core.Entity
type DataUsaEntity = core.DataUsaEntity
type FetcherFunc = core.FetcherFunc
type Spec = core.Spec
type Result = core.Result
type Response = core.Response
type Operation = core.Operation
type Control = core.Control
type DataUsaError = core.DataUsaError

// BaseFeature from feature package.
type BaseFeature = feature.BaseFeature

func init() {
	core.NewBaseFeatureFunc = func() core.Feature {
		return feature.NewBaseFeature()
	}
	core.NewTestFeatureFunc = func() core.Feature {
		return feature.NewTestFeature()
	}
	core.NewCalculationsModuleEntityFunc = func(client *core.DataUsaSDK, entopts map[string]any) core.DataUsaEntity {
		return entity.NewCalculationsModuleEntity(client, entopts)
	}
	core.NewEconomicComplexityModuleEntityFunc = func(client *core.DataUsaSDK, entopts map[string]any) core.DataUsaEntity {
		return entity.NewEconomicComplexityModuleEntity(client, entopts)
	}
	core.NewHealthEntityFunc = func(client *core.DataUsaSDK, entopts map[string]any) core.DataUsaEntity {
		return entity.NewHealthEntity(client, entopts)
	}
	core.NewMemberEntityFunc = func(client *core.DataUsaSDK, entopts map[string]any) core.DataUsaEntity {
		return entity.NewMemberEntity(client, entopts)
	}
	core.NewModuleStatusEntityFunc = func(client *core.DataUsaSDK, entopts map[string]any) core.DataUsaEntity {
		return entity.NewModuleStatusEntity(client, entopts)
	}
	core.NewRouteIndexGetEntityFunc = func(client *core.DataUsaSDK, entopts map[string]any) core.DataUsaEntity {
		return entity.NewRouteIndexGetEntity(client, entopts)
	}
	core.NewTesseractCubeEntityFunc = func(client *core.DataUsaSDK, entopts map[string]any) core.DataUsaEntity {
		return entity.NewTesseractCubeEntity(client, entopts)
	}
	core.NewTesseractModuleEntityFunc = func(client *core.DataUsaSDK, entopts map[string]any) core.DataUsaEntity {
		return entity.NewTesseractModuleEntity(client, entopts)
	}
	core.NewTesseractSchemaEntityFunc = func(client *core.DataUsaSDK, entopts map[string]any) core.DataUsaEntity {
		return entity.NewTesseractSchemaEntity(client, entopts)
	}
}

// Constructor re-exports.
var NewDataUsaSDK = core.NewDataUsaSDK
var TestSDK = core.TestSDK
var NewContext = core.NewContext
var NewSpec = core.NewSpec
var NewResult = core.NewResult
var NewResponse = core.NewResponse
var NewOperation = core.NewOperation
var MakeConfig = core.MakeConfig
var NewBaseFeature = feature.NewBaseFeature
var NewTestFeature = feature.NewTestFeature
