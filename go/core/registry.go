package core

var UtilityRegistrar func(u *Utility)

var NewBaseFeatureFunc func() Feature

var NewTestFeatureFunc func() Feature

var NewCalculationsModuleEntityFunc func(client *DataUsaSDK, entopts map[string]any) DataUsaEntity

var NewEconomicComplexityModuleEntityFunc func(client *DataUsaSDK, entopts map[string]any) DataUsaEntity

var NewHealthEntityFunc func(client *DataUsaSDK, entopts map[string]any) DataUsaEntity

var NewMemberEntityFunc func(client *DataUsaSDK, entopts map[string]any) DataUsaEntity

var NewModuleStatusEntityFunc func(client *DataUsaSDK, entopts map[string]any) DataUsaEntity

var NewRouteIndexGetEntityFunc func(client *DataUsaSDK, entopts map[string]any) DataUsaEntity

var NewTesseractCubeEntityFunc func(client *DataUsaSDK, entopts map[string]any) DataUsaEntity

var NewTesseractModuleEntityFunc func(client *DataUsaSDK, entopts map[string]any) DataUsaEntity

var NewTesseractSchemaEntityFunc func(client *DataUsaSDK, entopts map[string]any) DataUsaEntity

