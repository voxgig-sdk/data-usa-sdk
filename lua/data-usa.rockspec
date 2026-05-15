package = "voxgig-sdk-data-usa"
version = "0.0-1"
source = {
  url = "git://github.com/voxgig-sdk/data-usa-sdk.git"
}
description = {
  summary = "DataUsa SDK for Lua",
  license = "MIT"
}
dependencies = {
  "lua >= 5.3",
  "dkjson >= 2.5",
  "dkjson >= 2.5",
}
build = {
  type = "builtin",
  modules = {
    ["data-usa_sdk"] = "data-usa_sdk.lua",
    ["config"] = "config.lua",
    ["features"] = "features.lua",
  }
}
