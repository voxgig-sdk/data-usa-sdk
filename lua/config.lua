-- DataUsa SDK configuration

-- Build a fresh, fully materialised config table. Every call rebuilds the
-- whole structure, so prefer require("config_shared") unless you need a
-- private copy you intend to mutate.
local function make_config()
  return {
    main = {
      name = "DataUsa",
      slug = "data-usa",
      version = "0.0.1",
      target = "lua",
    },
    feature = {
      ["test"] = {
        ["options"] = {
          ["active"] = false,
        },
        ["transport"] = "base",
      },
    },
    options = {
      base = "https://honduras.datausa.io",
      headers = {
        ["content-type"] = "application/json",
      },
      entity = {
        ["calculations_module"] = {},
        ["economic_complexity_module"] = {},
        ["health"] = {},
        ["member"] = {},
        ["module_status"] = {},
        ["route_index_get"] = {},
        ["tesseract_cube"] = {},
        ["tesseract_module"] = {},
        ["tesseract_schema"] = {},
      },
    },
    entity = {
      ["calculations_module"] = {
        ["fields"] = {},
        ["name"] = "calculations_module",
        ["op"] = {
          ["load"] = {
            ["input"] = "data",
            ["name"] = "load",
            ["points"] = {
              {
                ["args"] = {
                  ["header"] = {
                    {
                      ["kind"] = "header",
                      ["name"] = "authorization",
                      ["orig"] = "authorization",
                      ["type"] = "`$ANY`",
                    },
                    {
                      ["kind"] = "header",
                      ["name"] = "x_tesseract_jwt",
                      ["orig"] = "x_tesseract_jwt",
                      ["type"] = "`$ANY`",
                    },
                  },
                  ["params"] = {
                    {
                      ["kind"] = "param",
                      ["name"] = "extension",
                      ["orig"] = "extension",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                    },
                  },
                  ["query"] = {
                    {
                      ["example"] = "",
                      ["kind"] = "query",
                      ["name"] = "filter",
                      ["orig"] = "filter",
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "param",
                      ["orig"] = "param",
                      ["reqd"] = true,
                      ["type"] = "`$OBJECT`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "token",
                      ["orig"] = "token",
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["example"] = "",
                      ["kind"] = "query",
                      ["name"] = "top",
                      ["orig"] = "top",
                      ["type"] = "`$STRING`",
                    },
                  },
                },
                ["kind"] = "http",
                ["method"] = "GET",
                ["orig"] = "/calcs/merge.{extension}",
                ["segments"] = {
                  {
                    ["lit"] = "calcs",
                  },
                  {
                    ["lit"] = "merge.{extension}",
                  },
                },
                ["select"] = {
                  ["exist"] = {
                    "authorization",
                    "extension",
                    "filter",
                    "param",
                    "token",
                    "top",
                    "x_tesseract_jwt",
                  },
                },
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body`",
                },
                ["parts"] = {
                  "calcs",
                  "merge.{extension}",
                },
              },
              {
                ["args"] = {
                  ["header"] = {
                    {
                      ["kind"] = "header",
                      ["name"] = "authorization",
                      ["orig"] = "authorization",
                      ["type"] = "`$ANY`",
                    },
                    {
                      ["kind"] = "header",
                      ["name"] = "x_tesseract_jwt",
                      ["orig"] = "x_tesseract_jwt",
                      ["type"] = "`$ANY`",
                    },
                  },
                  ["params"] = {
                    {
                      ["kind"] = "param",
                      ["name"] = "extension",
                      ["orig"] = "extension",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                    },
                  },
                  ["query"] = {
                    {
                      ["example"] = "",
                      ["kind"] = "query",
                      ["name"] = "filter",
                      ["orig"] = "filter",
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "param",
                      ["orig"] = "param",
                      ["reqd"] = true,
                      ["type"] = "`$OBJECT`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "token",
                      ["orig"] = "token",
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["example"] = "",
                      ["kind"] = "query",
                      ["name"] = "top",
                      ["orig"] = "top",
                      ["type"] = "`$STRING`",
                    },
                  },
                },
                ["kind"] = "http",
                ["method"] = "GET",
                ["orig"] = "/calcs/pums.{extension}",
                ["segments"] = {
                  {
                    ["lit"] = "calcs",
                  },
                  {
                    ["lit"] = "pums.{extension}",
                  },
                },
                ["select"] = {
                  ["exist"] = {
                    "authorization",
                    "extension",
                    "filter",
                    "param",
                    "token",
                    "top",
                    "x_tesseract_jwt",
                  },
                },
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body`",
                },
                ["parts"] = {
                  "calcs",
                  "pums.{extension}",
                },
              },
              {
                ["args"] = {
                  ["header"] = {
                    {
                      ["kind"] = "header",
                      ["name"] = "authorization",
                      ["orig"] = "authorization",
                      ["type"] = "`$ANY`",
                    },
                    {
                      ["kind"] = "header",
                      ["name"] = "x_tesseract_jwt",
                      ["orig"] = "x_tesseract_jwt",
                      ["type"] = "`$ANY`",
                    },
                  },
                  ["params"] = {
                    {
                      ["kind"] = "param",
                      ["name"] = "extension",
                      ["orig"] = "extension",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                    },
                  },
                  ["query"] = {
                    {
                      ["kind"] = "query",
                      ["name"] = "param",
                      ["orig"] = "param",
                      ["reqd"] = true,
                      ["type"] = "`$OBJECT`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "token",
                      ["orig"] = "token",
                      ["type"] = "`$STRING`",
                    },
                  },
                },
                ["kind"] = "http",
                ["method"] = "GET",
                ["orig"] = "/calcs/acs.{extension}",
                ["segments"] = {
                  {
                    ["lit"] = "calcs",
                  },
                  {
                    ["lit"] = "acs.{extension}",
                  },
                },
                ["select"] = {
                  ["exist"] = {
                    "authorization",
                    "extension",
                    "param",
                    "token",
                    "x_tesseract_jwt",
                  },
                },
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body`",
                },
                ["parts"] = {
                  "calcs",
                  "acs.{extension}",
                },
              },
            },
          },
        },
        ["relations"] = {
          ["ancestors"] = {},
        },
      },
      ["economic_complexity_module"] = {
        ["fields"] = {},
        ["name"] = "economic_complexity_module",
        ["op"] = {
          ["load"] = {
            ["input"] = "data",
            ["name"] = "load",
            ["points"] = {
              {
                ["args"] = {
                  ["header"] = {
                    {
                      ["kind"] = "header",
                      ["name"] = "authorization",
                      ["orig"] = "authorization",
                      ["type"] = "`$ANY`",
                    },
                    {
                      ["kind"] = "header",
                      ["name"] = "x_tesseract_jwt",
                      ["orig"] = "x_tesseract_jwt",
                      ["type"] = "`$ANY`",
                    },
                  },
                  ["params"] = {
                    {
                      ["kind"] = "param",
                      ["name"] = "extension",
                      ["orig"] = "extension",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                    },
                  },
                  ["query"] = {
                    {
                      ["kind"] = "query",
                      ["name"] = "alia",
                      ["orig"] = "alia",
                      ["type"] = "`$ARRAY`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "ascending",
                      ["orig"] = "ascending",
                      ["type"] = "`$ANY`",
                    },
                    {
                      ["example"] = 1,
                      ["kind"] = "query",
                      ["name"] = "cutoff",
                      ["orig"] = "cutoff",
                      ["type"] = "`$NUMBER`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "filter",
                      ["orig"] = "filter",
                      ["type"] = "`$ARRAY`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "global_activity",
                      ["orig"] = "global_activity",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "global_cube",
                      ["orig"] = "global_cube",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "global_cut",
                      ["orig"] = "global_cut",
                      ["type"] = "`$ARRAY`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "global_location",
                      ["orig"] = "global_location",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "global_measure",
                      ["orig"] = "global_measure",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "global_threshold",
                      ["orig"] = "global_threshold",
                      ["type"] = "`$ARRAY`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "locale",
                      ["orig"] = "locale",
                      ["type"] = "`$ANY`",
                    },
                    {
                      ["example"] = false,
                      ["kind"] = "query",
                      ["name"] = "parent",
                      ["orig"] = "parent",
                      ["type"] = "`$BOOLEAN`",
                    },
                    {
                      ["example"] = false,
                      ["kind"] = "query",
                      ["name"] = "rank",
                      ["orig"] = "rank",
                      ["type"] = "`$BOOLEAN`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "subnat_activity",
                      ["orig"] = "subnat_activity",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "subnat_cube",
                      ["orig"] = "subnat_cube",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "subnat_cut",
                      ["orig"] = "subnat_cut",
                      ["type"] = "`$ARRAY`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "subnat_location",
                      ["orig"] = "subnat_location",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "subnat_measure",
                      ["orig"] = "subnat_measure",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "subnat_threshold",
                      ["orig"] = "subnat_threshold",
                      ["type"] = "`$ARRAY`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "threshold_eci",
                      ["orig"] = "threshold_eci",
                      ["type"] = "`$ARRAY`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "token",
                      ["orig"] = "token",
                      ["type"] = "`$STRING`",
                    },
                  },
                },
                ["kind"] = "http",
                ["method"] = "GET",
                ["orig"] = "/complexity/eci_subnational.{extension}",
                ["segments"] = {
                  {
                    ["lit"] = "complexity",
                  },
                  {
                    ["lit"] = "eci_subnational.{extension}",
                  },
                },
                ["select"] = {
                  ["exist"] = {
                    "alia",
                    "ascending",
                    "authorization",
                    "cutoff",
                    "extension",
                    "filter",
                    "global_activity",
                    "global_cube",
                    "global_cut",
                    "global_location",
                    "global_measure",
                    "global_threshold",
                    "locale",
                    "parent",
                    "rank",
                    "subnat_activity",
                    "subnat_cube",
                    "subnat_cut",
                    "subnat_location",
                    "subnat_measure",
                    "subnat_threshold",
                    "threshold_eci",
                    "token",
                    "x_tesseract_jwt",
                  },
                },
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body`",
                },
                ["parts"] = {
                  "complexity",
                  "eci_subnational.{extension}",
                },
              },
              {
                ["args"] = {
                  ["header"] = {
                    {
                      ["kind"] = "header",
                      ["name"] = "authorization",
                      ["orig"] = "authorization",
                      ["type"] = "`$ANY`",
                    },
                    {
                      ["kind"] = "header",
                      ["name"] = "x_tesseract_jwt",
                      ["orig"] = "x_tesseract_jwt",
                      ["type"] = "`$ANY`",
                    },
                  },
                  ["params"] = {
                    {
                      ["kind"] = "param",
                      ["name"] = "extension",
                      ["orig"] = "extension",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                    },
                  },
                  ["query"] = {
                    {
                      ["kind"] = "query",
                      ["name"] = "alia",
                      ["orig"] = "alia",
                      ["type"] = "`$ARRAY`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "ascending",
                      ["orig"] = "ascending",
                      ["type"] = "`$ANY`",
                    },
                    {
                      ["example"] = 1,
                      ["kind"] = "query",
                      ["name"] = "cutoff",
                      ["orig"] = "cutoff",
                      ["type"] = "`$NUMBER`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "filter",
                      ["orig"] = "filter",
                      ["type"] = "`$ARRAY`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "global_activity",
                      ["orig"] = "global_activity",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "global_cube",
                      ["orig"] = "global_cube",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "global_cut",
                      ["orig"] = "global_cut",
                      ["type"] = "`$ARRAY`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "global_location",
                      ["orig"] = "global_location",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "global_measure",
                      ["orig"] = "global_measure",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "global_threshold",
                      ["orig"] = "global_threshold",
                      ["type"] = "`$ARRAY`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "locale",
                      ["orig"] = "locale",
                      ["type"] = "`$ANY`",
                    },
                    {
                      ["example"] = false,
                      ["kind"] = "query",
                      ["name"] = "parent",
                      ["orig"] = "parent",
                      ["type"] = "`$BOOLEAN`",
                    },
                    {
                      ["example"] = false,
                      ["kind"] = "query",
                      ["name"] = "rank",
                      ["orig"] = "rank",
                      ["type"] = "`$BOOLEAN`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "subnat_activity",
                      ["orig"] = "subnat_activity",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "subnat_cube",
                      ["orig"] = "subnat_cube",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "subnat_cut",
                      ["orig"] = "subnat_cut",
                      ["type"] = "`$ARRAY`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "subnat_location",
                      ["orig"] = "subnat_location",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "subnat_measure",
                      ["orig"] = "subnat_measure",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "subnat_threshold",
                      ["orig"] = "subnat_threshold",
                      ["type"] = "`$ARRAY`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "threshold_eci",
                      ["orig"] = "threshold_eci",
                      ["type"] = "`$ARRAY`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "token",
                      ["orig"] = "token",
                      ["type"] = "`$STRING`",
                    },
                  },
                },
                ["kind"] = "http",
                ["method"] = "GET",
                ["orig"] = "/complexity/pci_subnational.{extension}",
                ["segments"] = {
                  {
                    ["lit"] = "complexity",
                  },
                  {
                    ["lit"] = "pci_subnational.{extension}",
                  },
                },
                ["select"] = {
                  ["exist"] = {
                    "alia",
                    "ascending",
                    "authorization",
                    "cutoff",
                    "extension",
                    "filter",
                    "global_activity",
                    "global_cube",
                    "global_cut",
                    "global_location",
                    "global_measure",
                    "global_threshold",
                    "locale",
                    "parent",
                    "rank",
                    "subnat_activity",
                    "subnat_cube",
                    "subnat_cut",
                    "subnat_location",
                    "subnat_measure",
                    "subnat_threshold",
                    "threshold_eci",
                    "token",
                    "x_tesseract_jwt",
                  },
                },
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body`",
                },
                ["parts"] = {
                  "complexity",
                  "pci_subnational.{extension}",
                },
              },
              {
                ["args"] = {
                  ["header"] = {
                    {
                      ["kind"] = "header",
                      ["name"] = "authorization",
                      ["orig"] = "authorization",
                      ["type"] = "`$ANY`",
                    },
                    {
                      ["kind"] = "header",
                      ["name"] = "x_tesseract_jwt",
                      ["orig"] = "x_tesseract_jwt",
                      ["type"] = "`$ANY`",
                    },
                  },
                  ["params"] = {
                    {
                      ["kind"] = "param",
                      ["name"] = "extension",
                      ["orig"] = "extension",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                    },
                  },
                  ["query"] = {
                    {
                      ["kind"] = "query",
                      ["name"] = "alia",
                      ["orig"] = "alia",
                      ["type"] = "`$ARRAY`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "ascending",
                      ["orig"] = "ascending",
                      ["type"] = "`$ANY`",
                    },
                    {
                      ["example"] = 1,
                      ["kind"] = "query",
                      ["name"] = "cutoff",
                      ["orig"] = "cutoff",
                      ["type"] = "`$NUMBER`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "filter",
                      ["orig"] = "filter",
                      ["type"] = "`$ARRAY`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "global_activity",
                      ["orig"] = "global_activity",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "global_cube",
                      ["orig"] = "global_cube",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "global_cut",
                      ["orig"] = "global_cut",
                      ["type"] = "`$ARRAY`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "global_location",
                      ["orig"] = "global_location",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "global_measure",
                      ["orig"] = "global_measure",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "global_threshold",
                      ["orig"] = "global_threshold",
                      ["type"] = "`$ARRAY`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "locale",
                      ["orig"] = "locale",
                      ["type"] = "`$ANY`",
                    },
                    {
                      ["example"] = false,
                      ["kind"] = "query",
                      ["name"] = "parent",
                      ["orig"] = "parent",
                      ["type"] = "`$BOOLEAN`",
                    },
                    {
                      ["example"] = false,
                      ["kind"] = "query",
                      ["name"] = "rank",
                      ["orig"] = "rank",
                      ["type"] = "`$BOOLEAN`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "subnat_activity",
                      ["orig"] = "subnat_activity",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "subnat_cube",
                      ["orig"] = "subnat_cube",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "subnat_cut",
                      ["orig"] = "subnat_cut",
                      ["type"] = "`$ARRAY`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "subnat_location",
                      ["orig"] = "subnat_location",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "subnat_measure",
                      ["orig"] = "subnat_measure",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "subnat_threshold",
                      ["orig"] = "subnat_threshold",
                      ["type"] = "`$ARRAY`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "token",
                      ["orig"] = "token",
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["example"] = "",
                      ["kind"] = "query",
                      ["name"] = "top",
                      ["orig"] = "top",
                      ["type"] = "`$STRING`",
                    },
                  },
                },
                ["kind"] = "http",
                ["method"] = "GET",
                ["orig"] = "/complexity/relatedness_subnational.{extension}",
                ["segments"] = {
                  {
                    ["lit"] = "complexity",
                  },
                  {
                    ["lit"] = "relatedness_subnational.{extension}",
                  },
                },
                ["select"] = {
                  ["exist"] = {
                    "alia",
                    "ascending",
                    "authorization",
                    "cutoff",
                    "extension",
                    "filter",
                    "global_activity",
                    "global_cube",
                    "global_cut",
                    "global_location",
                    "global_measure",
                    "global_threshold",
                    "locale",
                    "parent",
                    "rank",
                    "subnat_activity",
                    "subnat_cube",
                    "subnat_cut",
                    "subnat_location",
                    "subnat_measure",
                    "subnat_threshold",
                    "token",
                    "top",
                    "x_tesseract_jwt",
                  },
                },
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body`",
                },
                ["parts"] = {
                  "complexity",
                  "relatedness_subnational.{extension}",
                },
              },
              {
                ["args"] = {
                  ["header"] = {
                    {
                      ["kind"] = "header",
                      ["name"] = "authorization",
                      ["orig"] = "authorization",
                      ["type"] = "`$ANY`",
                    },
                    {
                      ["kind"] = "header",
                      ["name"] = "x_tesseract_jwt",
                      ["orig"] = "x_tesseract_jwt",
                      ["type"] = "`$ANY`",
                    },
                  },
                  ["params"] = {
                    {
                      ["kind"] = "param",
                      ["name"] = "extension",
                      ["orig"] = "extension",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                    },
                  },
                  ["query"] = {
                    {
                      ["kind"] = "query",
                      ["name"] = "alia",
                      ["orig"] = "alia",
                      ["type"] = "`$ARRAY`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "ascending",
                      ["orig"] = "ascending",
                      ["type"] = "`$ANY`",
                    },
                    {
                      ["example"] = 1,
                      ["kind"] = "query",
                      ["name"] = "cutoff",
                      ["orig"] = "cutoff",
                      ["type"] = "`$NUMBER`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "filter",
                      ["orig"] = "filter",
                      ["type"] = "`$ARRAY`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "global_activity",
                      ["orig"] = "global_activity",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "global_cube",
                      ["orig"] = "global_cube",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "global_cut",
                      ["orig"] = "global_cut",
                      ["type"] = "`$ARRAY`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "global_location",
                      ["orig"] = "global_location",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "global_measure",
                      ["orig"] = "global_measure",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "global_threshold",
                      ["orig"] = "global_threshold",
                      ["type"] = "`$ARRAY`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "locale",
                      ["orig"] = "locale",
                      ["type"] = "`$ANY`",
                    },
                    {
                      ["example"] = false,
                      ["kind"] = "query",
                      ["name"] = "parent",
                      ["orig"] = "parent",
                      ["type"] = "`$BOOLEAN`",
                    },
                    {
                      ["example"] = false,
                      ["kind"] = "query",
                      ["name"] = "rank",
                      ["orig"] = "rank",
                      ["type"] = "`$BOOLEAN`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "subnat_activity",
                      ["orig"] = "subnat_activity",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "subnat_cube",
                      ["orig"] = "subnat_cube",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "subnat_cut",
                      ["orig"] = "subnat_cut",
                      ["type"] = "`$ARRAY`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "subnat_location",
                      ["orig"] = "subnat_location",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "subnat_measure",
                      ["orig"] = "subnat_measure",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "subnat_threshold",
                      ["orig"] = "subnat_threshold",
                      ["type"] = "`$ARRAY`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "token",
                      ["orig"] = "token",
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["example"] = "",
                      ["kind"] = "query",
                      ["name"] = "top",
                      ["orig"] = "top",
                      ["type"] = "`$STRING`",
                    },
                  },
                },
                ["kind"] = "http",
                ["method"] = "GET",
                ["orig"] = "/complexity/relative_relatedness_subnational.{extension}",
                ["segments"] = {
                  {
                    ["lit"] = "complexity",
                  },
                  {
                    ["lit"] = "relative_relatedness_subnational.{extension}",
                  },
                },
                ["select"] = {
                  ["exist"] = {
                    "alia",
                    "ascending",
                    "authorization",
                    "cutoff",
                    "extension",
                    "filter",
                    "global_activity",
                    "global_cube",
                    "global_cut",
                    "global_location",
                    "global_measure",
                    "global_threshold",
                    "locale",
                    "parent",
                    "rank",
                    "subnat_activity",
                    "subnat_cube",
                    "subnat_cut",
                    "subnat_location",
                    "subnat_measure",
                    "subnat_threshold",
                    "token",
                    "top",
                    "x_tesseract_jwt",
                  },
                },
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body`",
                },
                ["parts"] = {
                  "complexity",
                  "relative_relatedness_subnational.{extension}",
                },
              },
              {
                ["args"] = {
                  ["header"] = {
                    {
                      ["kind"] = "header",
                      ["name"] = "authorization",
                      ["orig"] = "authorization",
                      ["type"] = "`$ANY`",
                    },
                    {
                      ["kind"] = "header",
                      ["name"] = "x_tesseract_jwt",
                      ["orig"] = "x_tesseract_jwt",
                      ["type"] = "`$ANY`",
                    },
                  },
                  ["params"] = {
                    {
                      ["kind"] = "param",
                      ["name"] = "extension",
                      ["orig"] = "extension",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                    },
                  },
                  ["query"] = {
                    {
                      ["kind"] = "query",
                      ["name"] = "activity",
                      ["orig"] = "activity",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "alia",
                      ["orig"] = "alia",
                      ["type"] = "`$ARRAY`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "ascending",
                      ["orig"] = "ascending",
                      ["type"] = "`$ANY`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "complementary_drilldown",
                      ["orig"] = "complementary_drilldown",
                      ["type"] = "`$ARRAY`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "complementary_measure",
                      ["orig"] = "complementary_measure",
                      ["type"] = "`$ARRAY`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "cube",
                      ["orig"] = "cube",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "cut",
                      ["orig"] = "cut",
                      ["type"] = "`$ARRAY`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "filter",
                      ["orig"] = "filter",
                      ["type"] = "`$ARRAY`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "having",
                      ["orig"] = "having",
                      ["type"] = "`$ARRAY`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "locale",
                      ["orig"] = "locale",
                      ["type"] = "`$ANY`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "location",
                      ["orig"] = "location",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "measure",
                      ["orig"] = "measure",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["example"] = false,
                      ["kind"] = "query",
                      ["name"] = "parent",
                      ["orig"] = "parent",
                      ["type"] = "`$BOOLEAN`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "property",
                      ["orig"] = "property",
                      ["type"] = "`$ANY`",
                    },
                    {
                      ["example"] = false,
                      ["kind"] = "query",
                      ["name"] = "rank",
                      ["orig"] = "rank",
                      ["type"] = "`$BOOLEAN`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "threshold",
                      ["orig"] = "threshold",
                      ["type"] = "`$ARRAY`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "time",
                      ["orig"] = "time",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "time_filter",
                      ["orig"] = "time_filter",
                      ["type"] = "`$ANY`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "token",
                      ["orig"] = "token",
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["example"] = "",
                      ["kind"] = "query",
                      ["name"] = "top",
                      ["orig"] = "top",
                      ["type"] = "`$STRING`",
                    },
                  },
                },
                ["kind"] = "http",
                ["method"] = "GET",
                ["orig"] = "/complexity/rca_historical.{extension}",
                ["segments"] = {
                  {
                    ["lit"] = "complexity",
                  },
                  {
                    ["lit"] = "rca_historical.{extension}",
                  },
                },
                ["select"] = {
                  ["exist"] = {
                    "activity",
                    "alia",
                    "ascending",
                    "authorization",
                    "complementary_drilldown",
                    "complementary_measure",
                    "cube",
                    "cut",
                    "extension",
                    "filter",
                    "having",
                    "locale",
                    "location",
                    "measure",
                    "parent",
                    "property",
                    "rank",
                    "threshold",
                    "time",
                    "time_filter",
                    "token",
                    "top",
                    "x_tesseract_jwt",
                  },
                },
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body`",
                },
                ["parts"] = {
                  "complexity",
                  "rca_historical.{extension}",
                },
              },
              {
                ["args"] = {
                  ["header"] = {
                    {
                      ["kind"] = "header",
                      ["name"] = "authorization",
                      ["orig"] = "authorization",
                      ["type"] = "`$ANY`",
                    },
                    {
                      ["kind"] = "header",
                      ["name"] = "x_tesseract_jwt",
                      ["orig"] = "x_tesseract_jwt",
                      ["type"] = "`$ANY`",
                    },
                  },
                  ["params"] = {
                    {
                      ["kind"] = "param",
                      ["name"] = "extension",
                      ["orig"] = "extension",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                    },
                  },
                  ["query"] = {
                    {
                      ["kind"] = "query",
                      ["name"] = "alia",
                      ["orig"] = "alia",
                      ["type"] = "`$ARRAY`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "ascending",
                      ["orig"] = "ascending",
                      ["type"] = "`$ANY`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "filter",
                      ["orig"] = "filter",
                      ["type"] = "`$ARRAY`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "global_activity",
                      ["orig"] = "global_activity",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "global_cube",
                      ["orig"] = "global_cube",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "global_cut",
                      ["orig"] = "global_cut",
                      ["type"] = "`$ARRAY`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "global_location",
                      ["orig"] = "global_location",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "global_measure",
                      ["orig"] = "global_measure",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "global_threshold",
                      ["orig"] = "global_threshold",
                      ["type"] = "`$ARRAY`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "locale",
                      ["orig"] = "locale",
                      ["type"] = "`$ANY`",
                    },
                    {
                      ["example"] = false,
                      ["kind"] = "query",
                      ["name"] = "parent",
                      ["orig"] = "parent",
                      ["type"] = "`$BOOLEAN`",
                    },
                    {
                      ["example"] = false,
                      ["kind"] = "query",
                      ["name"] = "rank",
                      ["orig"] = "rank",
                      ["type"] = "`$BOOLEAN`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "subnat_activity",
                      ["orig"] = "subnat_activity",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "subnat_cube",
                      ["orig"] = "subnat_cube",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "subnat_cut",
                      ["orig"] = "subnat_cut",
                      ["type"] = "`$ARRAY`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "subnat_location",
                      ["orig"] = "subnat_location",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "subnat_measure",
                      ["orig"] = "subnat_measure",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "subnat_threshold",
                      ["orig"] = "subnat_threshold",
                      ["type"] = "`$ARRAY`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "token",
                      ["orig"] = "token",
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["example"] = "",
                      ["kind"] = "query",
                      ["name"] = "top",
                      ["orig"] = "top",
                      ["type"] = "`$STRING`",
                    },
                  },
                },
                ["kind"] = "http",
                ["method"] = "GET",
                ["orig"] = "/complexity/rca_subnational.{extension}",
                ["segments"] = {
                  {
                    ["lit"] = "complexity",
                  },
                  {
                    ["lit"] = "rca_subnational.{extension}",
                  },
                },
                ["select"] = {
                  ["exist"] = {
                    "alia",
                    "ascending",
                    "authorization",
                    "extension",
                    "filter",
                    "global_activity",
                    "global_cube",
                    "global_cut",
                    "global_location",
                    "global_measure",
                    "global_threshold",
                    "locale",
                    "parent",
                    "rank",
                    "subnat_activity",
                    "subnat_cube",
                    "subnat_cut",
                    "subnat_location",
                    "subnat_measure",
                    "subnat_threshold",
                    "token",
                    "top",
                    "x_tesseract_jwt",
                  },
                },
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body`",
                },
                ["parts"] = {
                  "complexity",
                  "rca_subnational.{extension}",
                },
              },
              {
                ["args"] = {
                  ["header"] = {
                    {
                      ["kind"] = "header",
                      ["name"] = "authorization",
                      ["orig"] = "authorization",
                      ["type"] = "`$ANY`",
                    },
                    {
                      ["kind"] = "header",
                      ["name"] = "x_tesseract_jwt",
                      ["orig"] = "x_tesseract_jwt",
                      ["type"] = "`$ANY`",
                    },
                  },
                  ["params"] = {
                    {
                      ["kind"] = "param",
                      ["name"] = "extension",
                      ["orig"] = "extension",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                    },
                  },
                  ["query"] = {
                    {
                      ["kind"] = "query",
                      ["name"] = "activity",
                      ["orig"] = "activity",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "alia",
                      ["orig"] = "alia",
                      ["type"] = "`$ARRAY`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "ascending",
                      ["orig"] = "ascending",
                      ["type"] = "`$ANY`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "cube",
                      ["orig"] = "cube",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "cut",
                      ["orig"] = "cut",
                      ["type"] = "`$ARRAY`",
                    },
                    {
                      ["example"] = 1,
                      ["kind"] = "query",
                      ["name"] = "cutoff",
                      ["orig"] = "cutoff",
                      ["type"] = "`$NUMBER`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "emissions_cube",
                      ["orig"] = "emissions_cube",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "emissions_location",
                      ["orig"] = "emissions_location",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "emissions_measure",
                      ["orig"] = "emissions_measure",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "filter",
                      ["orig"] = "filter",
                      ["type"] = "`$ARRAY`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "locale",
                      ["orig"] = "locale",
                      ["type"] = "`$ANY`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "location",
                      ["orig"] = "location",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "measure",
                      ["orig"] = "measure",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["example"] = false,
                      ["kind"] = "query",
                      ["name"] = "parent",
                      ["orig"] = "parent",
                      ["type"] = "`$BOOLEAN`",
                    },
                    {
                      ["example"] = false,
                      ["kind"] = "query",
                      ["name"] = "rank",
                      ["orig"] = "rank",
                      ["type"] = "`$BOOLEAN`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "threshold",
                      ["orig"] = "threshold",
                      ["type"] = "`$ARRAY`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "token",
                      ["orig"] = "token",
                      ["type"] = "`$STRING`",
                    },
                  },
                },
                ["kind"] = "http",
                ["method"] = "GET",
                ["orig"] = "/complexity/peii.{extension}",
                ["segments"] = {
                  {
                    ["lit"] = "complexity",
                  },
                  {
                    ["lit"] = "peii.{extension}",
                  },
                },
                ["select"] = {
                  ["exist"] = {
                    "activity",
                    "alia",
                    "ascending",
                    "authorization",
                    "cube",
                    "cut",
                    "cutoff",
                    "emissions_cube",
                    "emissions_location",
                    "emissions_measure",
                    "extension",
                    "filter",
                    "locale",
                    "location",
                    "measure",
                    "parent",
                    "rank",
                    "threshold",
                    "token",
                    "x_tesseract_jwt",
                  },
                },
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body`",
                },
                ["parts"] = {
                  "complexity",
                  "peii.{extension}",
                },
              },
              {
                ["args"] = {
                  ["header"] = {
                    {
                      ["kind"] = "header",
                      ["name"] = "authorization",
                      ["orig"] = "authorization",
                      ["type"] = "`$ANY`",
                    },
                    {
                      ["kind"] = "header",
                      ["name"] = "x_tesseract_jwt",
                      ["orig"] = "x_tesseract_jwt",
                      ["type"] = "`$ANY`",
                    },
                  },
                  ["params"] = {
                    {
                      ["kind"] = "param",
                      ["name"] = "extension",
                      ["orig"] = "extension",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                    },
                  },
                  ["query"] = {
                    {
                      ["kind"] = "query",
                      ["name"] = "activity",
                      ["orig"] = "activity",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "alia",
                      ["orig"] = "alia",
                      ["type"] = "`$ARRAY`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "ascending",
                      ["orig"] = "ascending",
                      ["type"] = "`$ANY`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "cube",
                      ["orig"] = "cube",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "cut",
                      ["orig"] = "cut",
                      ["type"] = "`$ARRAY`",
                    },
                    {
                      ["example"] = 1,
                      ["kind"] = "query",
                      ["name"] = "cutoff",
                      ["orig"] = "cutoff",
                      ["type"] = "`$NUMBER`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "filter",
                      ["orig"] = "filter",
                      ["type"] = "`$ARRAY`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "gini_cube",
                      ["orig"] = "gini_cube",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "gini_location",
                      ["orig"] = "gini_location",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "gini_measure",
                      ["orig"] = "gini_measure",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "locale",
                      ["orig"] = "locale",
                      ["type"] = "`$ANY`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "location",
                      ["orig"] = "location",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "measure",
                      ["orig"] = "measure",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["example"] = false,
                      ["kind"] = "query",
                      ["name"] = "parent",
                      ["orig"] = "parent",
                      ["type"] = "`$BOOLEAN`",
                    },
                    {
                      ["example"] = false,
                      ["kind"] = "query",
                      ["name"] = "rank",
                      ["orig"] = "rank",
                      ["type"] = "`$BOOLEAN`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "threshold",
                      ["orig"] = "threshold",
                      ["type"] = "`$ARRAY`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "token",
                      ["orig"] = "token",
                      ["type"] = "`$STRING`",
                    },
                  },
                },
                ["kind"] = "http",
                ["method"] = "GET",
                ["orig"] = "/complexity/pgi.{extension}",
                ["segments"] = {
                  {
                    ["lit"] = "complexity",
                  },
                  {
                    ["lit"] = "pgi.{extension}",
                  },
                },
                ["select"] = {
                  ["exist"] = {
                    "activity",
                    "alia",
                    "ascending",
                    "authorization",
                    "cube",
                    "cut",
                    "cutoff",
                    "extension",
                    "filter",
                    "gini_cube",
                    "gini_location",
                    "gini_measure",
                    "locale",
                    "location",
                    "measure",
                    "parent",
                    "rank",
                    "threshold",
                    "token",
                    "x_tesseract_jwt",
                  },
                },
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body`",
                },
                ["parts"] = {
                  "complexity",
                  "pgi.{extension}",
                },
              },
              {
                ["args"] = {
                  ["header"] = {
                    {
                      ["kind"] = "header",
                      ["name"] = "authorization",
                      ["orig"] = "authorization",
                      ["type"] = "`$ANY`",
                    },
                    {
                      ["kind"] = "header",
                      ["name"] = "x_tesseract_jwt",
                      ["orig"] = "x_tesseract_jwt",
                      ["type"] = "`$ANY`",
                    },
                  },
                  ["params"] = {
                    {
                      ["kind"] = "param",
                      ["name"] = "extension",
                      ["orig"] = "extension",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                    },
                  },
                  ["query"] = {
                    {
                      ["kind"] = "query",
                      ["name"] = "activity",
                      ["orig"] = "activity",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "alia",
                      ["orig"] = "alia",
                      ["type"] = "`$ARRAY`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "ascending",
                      ["orig"] = "ascending",
                      ["type"] = "`$ANY`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "cube",
                      ["orig"] = "cube",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "cut",
                      ["orig"] = "cut",
                      ["type"] = "`$ARRAY`",
                    },
                    {
                      ["example"] = 1,
                      ["kind"] = "query",
                      ["name"] = "cutoff",
                      ["orig"] = "cutoff",
                      ["type"] = "`$NUMBER`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "filter",
                      ["orig"] = "filter",
                      ["type"] = "`$ARRAY`",
                    },
                    {
                      ["example"] = 20,
                      ["kind"] = "query",
                      ["name"] = "iteration",
                      ["orig"] = "iteration",
                      ["type"] = "`$INTEGER`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "locale",
                      ["orig"] = "locale",
                      ["type"] = "`$ANY`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "location",
                      ["orig"] = "location",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "measure",
                      ["orig"] = "measure",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["example"] = false,
                      ["kind"] = "query",
                      ["name"] = "parent",
                      ["orig"] = "parent",
                      ["type"] = "`$BOOLEAN`",
                    },
                    {
                      ["example"] = false,
                      ["kind"] = "query",
                      ["name"] = "rank",
                      ["orig"] = "rank",
                      ["type"] = "`$BOOLEAN`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "threshold",
                      ["orig"] = "threshold",
                      ["type"] = "`$ARRAY`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "token",
                      ["orig"] = "token",
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "wdi",
                      ["orig"] = "wdi",
                      ["type"] = "`$ARRAY`",
                    },
                  },
                },
                ["kind"] = "http",
                ["method"] = "GET",
                ["orig"] = "/complexity/eci.{extension}",
                ["segments"] = {
                  {
                    ["lit"] = "complexity",
                  },
                  {
                    ["lit"] = "eci.{extension}",
                  },
                },
                ["select"] = {
                  ["exist"] = {
                    "activity",
                    "alia",
                    "ascending",
                    "authorization",
                    "cube",
                    "cut",
                    "cutoff",
                    "extension",
                    "filter",
                    "iteration",
                    "locale",
                    "location",
                    "measure",
                    "parent",
                    "rank",
                    "threshold",
                    "token",
                    "wdi",
                    "x_tesseract_jwt",
                  },
                },
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body`",
                },
                ["parts"] = {
                  "complexity",
                  "eci.{extension}",
                },
              },
              {
                ["args"] = {
                  ["header"] = {
                    {
                      ["kind"] = "header",
                      ["name"] = "authorization",
                      ["orig"] = "authorization",
                      ["type"] = "`$ANY`",
                    },
                    {
                      ["kind"] = "header",
                      ["name"] = "x_tesseract_jwt",
                      ["orig"] = "x_tesseract_jwt",
                      ["type"] = "`$ANY`",
                    },
                  },
                  ["params"] = {
                    {
                      ["kind"] = "param",
                      ["name"] = "extension",
                      ["orig"] = "extension",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                    },
                  },
                  ["query"] = {
                    {
                      ["kind"] = "query",
                      ["name"] = "activity",
                      ["orig"] = "activity",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "alia",
                      ["orig"] = "alia",
                      ["type"] = "`$ARRAY`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "ascending",
                      ["orig"] = "ascending",
                      ["type"] = "`$ANY`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "cube",
                      ["orig"] = "cube",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "cut",
                      ["orig"] = "cut",
                      ["type"] = "`$ARRAY`",
                    },
                    {
                      ["example"] = 1,
                      ["kind"] = "query",
                      ["name"] = "cutoff",
                      ["orig"] = "cutoff",
                      ["type"] = "`$NUMBER`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "filter",
                      ["orig"] = "filter",
                      ["type"] = "`$ARRAY`",
                    },
                    {
                      ["example"] = 20,
                      ["kind"] = "query",
                      ["name"] = "iteration",
                      ["orig"] = "iteration",
                      ["type"] = "`$INTEGER`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "locale",
                      ["orig"] = "locale",
                      ["type"] = "`$ANY`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "location",
                      ["orig"] = "location",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "measure",
                      ["orig"] = "measure",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["example"] = false,
                      ["kind"] = "query",
                      ["name"] = "parent",
                      ["orig"] = "parent",
                      ["type"] = "`$BOOLEAN`",
                    },
                    {
                      ["example"] = false,
                      ["kind"] = "query",
                      ["name"] = "rank",
                      ["orig"] = "rank",
                      ["type"] = "`$BOOLEAN`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "threshold",
                      ["orig"] = "threshold",
                      ["type"] = "`$ARRAY`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "token",
                      ["orig"] = "token",
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "wdi",
                      ["orig"] = "wdi",
                      ["type"] = "`$ARRAY`",
                    },
                  },
                },
                ["kind"] = "http",
                ["method"] = "GET",
                ["orig"] = "/complexity/pci.{extension}",
                ["segments"] = {
                  {
                    ["lit"] = "complexity",
                  },
                  {
                    ["lit"] = "pci.{extension}",
                  },
                },
                ["select"] = {
                  ["exist"] = {
                    "activity",
                    "alia",
                    "ascending",
                    "authorization",
                    "cube",
                    "cut",
                    "cutoff",
                    "extension",
                    "filter",
                    "iteration",
                    "locale",
                    "location",
                    "measure",
                    "parent",
                    "rank",
                    "threshold",
                    "token",
                    "wdi",
                    "x_tesseract_jwt",
                  },
                },
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body`",
                },
                ["parts"] = {
                  "complexity",
                  "pci.{extension}",
                },
              },
              {
                ["args"] = {
                  ["header"] = {
                    {
                      ["kind"] = "header",
                      ["name"] = "authorization",
                      ["orig"] = "authorization",
                      ["type"] = "`$ANY`",
                    },
                    {
                      ["kind"] = "header",
                      ["name"] = "x_tesseract_jwt",
                      ["orig"] = "x_tesseract_jwt",
                      ["type"] = "`$ANY`",
                    },
                  },
                  ["params"] = {
                    {
                      ["kind"] = "param",
                      ["name"] = "extension",
                      ["orig"] = "extension",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                    },
                  },
                  ["query"] = {
                    {
                      ["kind"] = "query",
                      ["name"] = "activity",
                      ["orig"] = "activity",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "alia",
                      ["orig"] = "alia",
                      ["type"] = "`$ARRAY`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "ascending",
                      ["orig"] = "ascending",
                      ["type"] = "`$ANY`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "cube",
                      ["orig"] = "cube",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "cut",
                      ["orig"] = "cut",
                      ["type"] = "`$ARRAY`",
                    },
                    {
                      ["example"] = 1,
                      ["kind"] = "query",
                      ["name"] = "cutoff",
                      ["orig"] = "cutoff",
                      ["type"] = "`$NUMBER`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "filter",
                      ["orig"] = "filter",
                      ["type"] = "`$ARRAY`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "locale",
                      ["orig"] = "locale",
                      ["type"] = "`$ANY`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "location",
                      ["orig"] = "location",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "measure",
                      ["orig"] = "measure",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["example"] = false,
                      ["kind"] = "query",
                      ["name"] = "parent",
                      ["orig"] = "parent",
                      ["type"] = "`$BOOLEAN`",
                    },
                    {
                      ["example"] = false,
                      ["kind"] = "query",
                      ["name"] = "rank",
                      ["orig"] = "rank",
                      ["type"] = "`$BOOLEAN`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "threshold",
                      ["orig"] = "threshold",
                      ["type"] = "`$ARRAY`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "token",
                      ["orig"] = "token",
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["example"] = "",
                      ["kind"] = "query",
                      ["name"] = "top",
                      ["orig"] = "top",
                      ["type"] = "`$STRING`",
                    },
                  },
                },
                ["kind"] = "http",
                ["method"] = "GET",
                ["orig"] = "/complexity/opportunity_gain.{extension}",
                ["segments"] = {
                  {
                    ["lit"] = "complexity",
                  },
                  {
                    ["lit"] = "opportunity_gain.{extension}",
                  },
                },
                ["select"] = {
                  ["exist"] = {
                    "activity",
                    "alia",
                    "ascending",
                    "authorization",
                    "cube",
                    "cut",
                    "cutoff",
                    "extension",
                    "filter",
                    "locale",
                    "location",
                    "measure",
                    "parent",
                    "rank",
                    "threshold",
                    "token",
                    "top",
                    "x_tesseract_jwt",
                  },
                },
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body`",
                },
                ["parts"] = {
                  "complexity",
                  "opportunity_gain.{extension}",
                },
              },
              {
                ["args"] = {
                  ["header"] = {
                    {
                      ["kind"] = "header",
                      ["name"] = "authorization",
                      ["orig"] = "authorization",
                      ["type"] = "`$ANY`",
                    },
                    {
                      ["kind"] = "header",
                      ["name"] = "x_tesseract_jwt",
                      ["orig"] = "x_tesseract_jwt",
                      ["type"] = "`$ANY`",
                    },
                  },
                  ["params"] = {
                    {
                      ["kind"] = "param",
                      ["name"] = "extension",
                      ["orig"] = "extension",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                    },
                  },
                  ["query"] = {
                    {
                      ["kind"] = "query",
                      ["name"] = "activity",
                      ["orig"] = "activity",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "alia",
                      ["orig"] = "alia",
                      ["type"] = "`$ARRAY`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "ascending",
                      ["orig"] = "ascending",
                      ["type"] = "`$ANY`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "cube",
                      ["orig"] = "cube",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "cut",
                      ["orig"] = "cut",
                      ["type"] = "`$ARRAY`",
                    },
                    {
                      ["example"] = 1,
                      ["kind"] = "query",
                      ["name"] = "cutoff",
                      ["orig"] = "cutoff",
                      ["type"] = "`$NUMBER`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "filter",
                      ["orig"] = "filter",
                      ["type"] = "`$ARRAY`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "locale",
                      ["orig"] = "locale",
                      ["type"] = "`$ANY`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "location",
                      ["orig"] = "location",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "measure",
                      ["orig"] = "measure",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["example"] = false,
                      ["kind"] = "query",
                      ["name"] = "parent",
                      ["orig"] = "parent",
                      ["type"] = "`$BOOLEAN`",
                    },
                    {
                      ["example"] = false,
                      ["kind"] = "query",
                      ["name"] = "rank",
                      ["orig"] = "rank",
                      ["type"] = "`$BOOLEAN`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "threshold",
                      ["orig"] = "threshold",
                      ["type"] = "`$ARRAY`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "token",
                      ["orig"] = "token",
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["example"] = "",
                      ["kind"] = "query",
                      ["name"] = "top",
                      ["orig"] = "top",
                      ["type"] = "`$STRING`",
                    },
                  },
                },
                ["kind"] = "http",
                ["method"] = "GET",
                ["orig"] = "/complexity/relatedness.{extension}",
                ["segments"] = {
                  {
                    ["lit"] = "complexity",
                  },
                  {
                    ["lit"] = "relatedness.{extension}",
                  },
                },
                ["select"] = {
                  ["exist"] = {
                    "activity",
                    "alia",
                    "ascending",
                    "authorization",
                    "cube",
                    "cut",
                    "cutoff",
                    "extension",
                    "filter",
                    "locale",
                    "location",
                    "measure",
                    "parent",
                    "rank",
                    "threshold",
                    "token",
                    "top",
                    "x_tesseract_jwt",
                  },
                },
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body`",
                },
                ["parts"] = {
                  "complexity",
                  "relatedness.{extension}",
                },
              },
              {
                ["args"] = {
                  ["header"] = {
                    {
                      ["kind"] = "header",
                      ["name"] = "authorization",
                      ["orig"] = "authorization",
                      ["type"] = "`$ANY`",
                    },
                    {
                      ["kind"] = "header",
                      ["name"] = "x_tesseract_jwt",
                      ["orig"] = "x_tesseract_jwt",
                      ["type"] = "`$ANY`",
                    },
                  },
                  ["params"] = {
                    {
                      ["kind"] = "param",
                      ["name"] = "extension",
                      ["orig"] = "extension",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                    },
                  },
                  ["query"] = {
                    {
                      ["kind"] = "query",
                      ["name"] = "activity",
                      ["orig"] = "activity",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "alia",
                      ["orig"] = "alia",
                      ["type"] = "`$ARRAY`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "ascending",
                      ["orig"] = "ascending",
                      ["type"] = "`$ANY`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "cube",
                      ["orig"] = "cube",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "cut",
                      ["orig"] = "cut",
                      ["type"] = "`$ARRAY`",
                    },
                    {
                      ["example"] = 1,
                      ["kind"] = "query",
                      ["name"] = "cutoff",
                      ["orig"] = "cutoff",
                      ["type"] = "`$NUMBER`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "filter",
                      ["orig"] = "filter",
                      ["type"] = "`$ARRAY`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "locale",
                      ["orig"] = "locale",
                      ["type"] = "`$ANY`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "location",
                      ["orig"] = "location",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "measure",
                      ["orig"] = "measure",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["example"] = false,
                      ["kind"] = "query",
                      ["name"] = "parent",
                      ["orig"] = "parent",
                      ["type"] = "`$BOOLEAN`",
                    },
                    {
                      ["example"] = false,
                      ["kind"] = "query",
                      ["name"] = "rank",
                      ["orig"] = "rank",
                      ["type"] = "`$BOOLEAN`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "threshold",
                      ["orig"] = "threshold",
                      ["type"] = "`$ARRAY`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "token",
                      ["orig"] = "token",
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["example"] = "",
                      ["kind"] = "query",
                      ["name"] = "top",
                      ["orig"] = "top",
                      ["type"] = "`$STRING`",
                    },
                  },
                },
                ["kind"] = "http",
                ["method"] = "GET",
                ["orig"] = "/complexity/relative_relatedness.{extension}",
                ["segments"] = {
                  {
                    ["lit"] = "complexity",
                  },
                  {
                    ["lit"] = "relative_relatedness.{extension}",
                  },
                },
                ["select"] = {
                  ["exist"] = {
                    "activity",
                    "alia",
                    "ascending",
                    "authorization",
                    "cube",
                    "cut",
                    "cutoff",
                    "extension",
                    "filter",
                    "locale",
                    "location",
                    "measure",
                    "parent",
                    "rank",
                    "threshold",
                    "token",
                    "top",
                    "x_tesseract_jwt",
                  },
                },
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body`",
                },
                ["parts"] = {
                  "complexity",
                  "relative_relatedness.{extension}",
                },
              },
              {
                ["args"] = {
                  ["header"] = {
                    {
                      ["kind"] = "header",
                      ["name"] = "authorization",
                      ["orig"] = "authorization",
                      ["type"] = "`$ANY`",
                    },
                    {
                      ["kind"] = "header",
                      ["name"] = "x_tesseract_jwt",
                      ["orig"] = "x_tesseract_jwt",
                      ["type"] = "`$ANY`",
                    },
                  },
                  ["params"] = {
                    {
                      ["kind"] = "param",
                      ["name"] = "extension",
                      ["orig"] = "extension",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                    },
                  },
                  ["query"] = {
                    {
                      ["kind"] = "query",
                      ["name"] = "activity",
                      ["orig"] = "activity",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "alia",
                      ["orig"] = "alia",
                      ["type"] = "`$ARRAY`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "ascending",
                      ["orig"] = "ascending",
                      ["type"] = "`$ANY`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "cube",
                      ["orig"] = "cube",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "cut",
                      ["orig"] = "cut",
                      ["type"] = "`$ARRAY`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "filter",
                      ["orig"] = "filter",
                      ["type"] = "`$ARRAY`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "locale",
                      ["orig"] = "locale",
                      ["type"] = "`$ANY`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "location",
                      ["orig"] = "location",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "measure",
                      ["orig"] = "measure",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["example"] = false,
                      ["kind"] = "query",
                      ["name"] = "parent",
                      ["orig"] = "parent",
                      ["type"] = "`$BOOLEAN`",
                    },
                    {
                      ["example"] = false,
                      ["kind"] = "query",
                      ["name"] = "rank",
                      ["orig"] = "rank",
                      ["type"] = "`$BOOLEAN`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "threshold",
                      ["orig"] = "threshold",
                      ["type"] = "`$ARRAY`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "token",
                      ["orig"] = "token",
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["example"] = "",
                      ["kind"] = "query",
                      ["name"] = "top",
                      ["orig"] = "top",
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "wdi",
                      ["orig"] = "wdi",
                      ["type"] = "`$ARRAY`",
                    },
                  },
                },
                ["kind"] = "http",
                ["method"] = "GET",
                ["orig"] = "/complexity/rca.{extension}",
                ["segments"] = {
                  {
                    ["lit"] = "complexity",
                  },
                  {
                    ["lit"] = "rca.{extension}",
                  },
                },
                ["select"] = {
                  ["exist"] = {
                    "activity",
                    "alia",
                    "ascending",
                    "authorization",
                    "cube",
                    "cut",
                    "extension",
                    "filter",
                    "locale",
                    "location",
                    "measure",
                    "parent",
                    "rank",
                    "threshold",
                    "token",
                    "top",
                    "wdi",
                    "x_tesseract_jwt",
                  },
                },
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body`",
                },
                ["parts"] = {
                  "complexity",
                  "rca.{extension}",
                },
              },
              {
                ["args"] = {
                  ["header"] = {
                    {
                      ["kind"] = "header",
                      ["name"] = "accept",
                      ["orig"] = "accept",
                      ["type"] = "`$ANY`",
                    },
                  },
                  ["params"] = {
                    {
                      ["kind"] = "param",
                      ["name"] = "endpoint",
                      ["orig"] = "endpoint",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                    },
                  },
                },
                ["kind"] = "http",
                ["method"] = "GET",
                ["orig"] = "/complexity/{endpoint}",
                ["segments"] = {
                  {
                    ["lit"] = "complexity",
                  },
                  {
                    ["var"] = "endpoint",
                  },
                },
                ["select"] = {
                  ["exist"] = {
                    "accept",
                    "endpoint",
                  },
                },
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body`",
                },
                ["parts"] = {
                  "complexity",
                  "{endpoint}",
                },
              },
            },
          },
        },
        ["relations"] = {
          ["ancestors"] = {
            {
              "complexity",
            },
          },
        },
      },
      ["health"] = {
        ["fields"] = {},
        ["name"] = "health",
        ["op"] = {
          ["load"] = {
            ["input"] = "data",
            ["name"] = "load",
            ["points"] = {
              {
                ["args"] = {},
                ["kind"] = "http",
                ["method"] = "GET",
                ["orig"] = "/_health",
                ["segments"] = {
                  {
                    ["lit"] = "_health",
                  },
                },
                ["select"] = {},
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body`",
                },
                ["parts"] = {
                  "_health",
                },
              },
            },
          },
        },
        ["relations"] = {
          ["ancestors"] = {},
        },
      },
      ["member"] = {
        ["fields"] = {
          {
            ["name"] = "annotations",
            ["req"] = true,
            ["type"] = "`$OBJECT`",
          },
          {
            ["name"] = "caption",
            ["req"] = true,
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "name",
            ["req"] = true,
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "type",
            ["req"] = true,
            ["short"] = "Types of the data the user can expect to find in the associated column.",
            ["type"] = "`$STRING`",
          },
        },
        ["name"] = "member",
        ["op"] = {
          ["list"] = {
            ["input"] = "data",
            ["name"] = "list",
            ["points"] = {
              {
                ["args"] = {
                  ["header"] = {
                    {
                      ["kind"] = "header",
                      ["name"] = "authorization",
                      ["orig"] = "authorization",
                      ["type"] = "`$ANY`",
                    },
                    {
                      ["kind"] = "header",
                      ["name"] = "x_tesseract_jwt",
                      ["orig"] = "x_tesseract_jwt",
                      ["type"] = "`$ANY`",
                    },
                  },
                  ["query"] = {
                    {
                      ["kind"] = "query",
                      ["name"] = "cube",
                      ["orig"] = "cube",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "level",
                      ["orig"] = "level",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["example"] = "0",
                      ["kind"] = "query",
                      ["name"] = "limit",
                      ["orig"] = "limit",
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "locale",
                      ["orig"] = "locale",
                      ["type"] = "`$ANY`",
                    },
                    {
                      ["example"] = false,
                      ["kind"] = "query",
                      ["name"] = "parent",
                      ["orig"] = "parent",
                      ["type"] = "`$BOOLEAN`",
                    },
                    {
                      ["example"] = "",
                      ["kind"] = "query",
                      ["name"] = "search",
                      ["orig"] = "search",
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "token",
                      ["orig"] = "token",
                      ["type"] = "`$STRING`",
                    },
                  },
                },
                ["kind"] = "http",
                ["method"] = "GET",
                ["orig"] = "/tesseract/members",
                ["segments"] = {
                  {
                    ["lit"] = "tesseract",
                  },
                  {
                    ["lit"] = "members",
                  },
                },
                ["select"] = {
                  ["exist"] = {
                    "authorization",
                    "cube",
                    "level",
                    "limit",
                    "locale",
                    "parent",
                    "search",
                    "token",
                    "x_tesseract_jwt",
                  },
                },
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body`",
                },
                ["parts"] = {
                  "tesseract",
                  "members",
                },
              },
            },
          },
        },
        ["relations"] = {
          ["ancestors"] = {},
        },
      },
      ["module_status"] = {
        ["fields"] = {},
        ["name"] = "module_status",
        ["op"] = {
          ["load"] = {
            ["input"] = "data",
            ["name"] = "load",
            ["points"] = {
              {
                ["args"] = {},
                ["kind"] = "http",
                ["method"] = "GET",
                ["orig"] = "/calcs/",
                ["segments"] = {
                  {
                    ["lit"] = "calcs",
                  },
                },
                ["select"] = {},
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body.debug`",
                },
                ["parts"] = {
                  "calcs",
                },
              },
              {
                ["args"] = {},
                ["kind"] = "http",
                ["method"] = "GET",
                ["orig"] = "/complexity/",
                ["segments"] = {
                  {
                    ["lit"] = "complexity",
                  },
                },
                ["select"] = {},
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body.debug`",
                },
                ["parts"] = {
                  "complexity",
                },
              },
              {
                ["args"] = {},
                ["kind"] = "http",
                ["method"] = "GET",
                ["orig"] = "/tesseract/",
                ["segments"] = {
                  {
                    ["lit"] = "tesseract",
                  },
                },
                ["select"] = {},
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body.debug`",
                },
                ["parts"] = {
                  "tesseract",
                },
              },
            },
          },
        },
        ["relations"] = {
          ["ancestors"] = {},
        },
      },
      ["route_index_get"] = {
        ["fields"] = {},
        ["name"] = "route_index_get",
        ["op"] = {
          ["load"] = {
            ["input"] = "data",
            ["name"] = "load",
            ["points"] = {
              {
                ["args"] = {},
                ["kind"] = "http",
                ["method"] = "GET",
                ["orig"] = "/",
                ["segments"] = {},
                ["select"] = {},
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body`",
                },
                ["parts"] = {},
              },
            },
          },
        },
        ["relations"] = {
          ["ancestors"] = {},
        },
      },
      ["tesseract_cube"] = {
        ["fields"] = {
          {
            ["name"] = "annotations",
            ["req"] = true,
            ["type"] = "`$OBJECT`",
          },
          {
            ["name"] = "caption",
            ["req"] = true,
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "dimensions",
            ["req"] = true,
            ["type"] = "`$ARRAY`",
          },
          {
            ["name"] = "id",
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "measures",
            ["req"] = true,
            ["type"] = "`$ARRAY`",
          },
          {
            ["name"] = "name",
            ["req"] = true,
            ["type"] = "`$STRING`",
          },
        },
        ["id"] = {
          ["field"] = "id",
          ["name"] = "id",
        },
        ["name"] = "tesseract_cube",
        ["op"] = {
          ["load"] = {
            ["input"] = "data",
            ["name"] = "load",
            ["points"] = {
              {
                ["args"] = {
                  ["header"] = {
                    {
                      ["kind"] = "header",
                      ["name"] = "authorization",
                      ["orig"] = "authorization",
                      ["type"] = "`$ANY`",
                    },
                    {
                      ["kind"] = "header",
                      ["name"] = "x_tesseract_jwt",
                      ["orig"] = "x_tesseract_jwt",
                      ["type"] = "`$ANY`",
                    },
                  },
                  ["params"] = {
                    {
                      ["kind"] = "param",
                      ["name"] = "id",
                      ["orig"] = "cube_name",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                    },
                  },
                  ["query"] = {
                    {
                      ["kind"] = "query",
                      ["name"] = "locale",
                      ["orig"] = "locale",
                      ["type"] = "`$ANY`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "token",
                      ["orig"] = "token",
                      ["type"] = "`$STRING`",
                    },
                  },
                },
                ["kind"] = "http",
                ["method"] = "GET",
                ["orig"] = "/complexity/cubes/{cube_name}",
                ["rename"] = {
                  ["param"] = {
                    ["cube_name"] = "id",
                  },
                },
                ["segments"] = {
                  {
                    ["lit"] = "complexity",
                  },
                  {
                    ["lit"] = "cubes",
                  },
                  {
                    ["var"] = "id",
                  },
                },
                ["select"] = {
                  ["exist"] = {
                    "authorization",
                    "id",
                    "locale",
                    "token",
                    "x_tesseract_jwt",
                  },
                },
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body`",
                },
                ["parts"] = {
                  "complexity",
                  "cubes",
                  "{id}",
                },
              },
              {
                ["args"] = {
                  ["header"] = {
                    {
                      ["kind"] = "header",
                      ["name"] = "authorization",
                      ["orig"] = "authorization",
                      ["type"] = "`$ANY`",
                    },
                    {
                      ["kind"] = "header",
                      ["name"] = "x_tesseract_jwt",
                      ["orig"] = "x_tesseract_jwt",
                      ["type"] = "`$ANY`",
                    },
                  },
                  ["params"] = {
                    {
                      ["kind"] = "param",
                      ["name"] = "id",
                      ["orig"] = "cube_name",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                    },
                  },
                  ["query"] = {
                    {
                      ["kind"] = "query",
                      ["name"] = "locale",
                      ["orig"] = "locale",
                      ["type"] = "`$ANY`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "token",
                      ["orig"] = "token",
                      ["type"] = "`$STRING`",
                    },
                  },
                },
                ["kind"] = "http",
                ["method"] = "GET",
                ["orig"] = "/tesseract/cubes/{cube_name}",
                ["rename"] = {
                  ["param"] = {
                    ["cube_name"] = "id",
                  },
                },
                ["segments"] = {
                  {
                    ["lit"] = "tesseract",
                  },
                  {
                    ["lit"] = "cubes",
                  },
                  {
                    ["var"] = "id",
                  },
                },
                ["select"] = {
                  ["exist"] = {
                    "authorization",
                    "id",
                    "locale",
                    "token",
                    "x_tesseract_jwt",
                  },
                },
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body`",
                },
                ["parts"] = {
                  "tesseract",
                  "cubes",
                  "{id}",
                },
              },
            },
          },
        },
        ["relations"] = {
          ["ancestors"] = {},
        },
      },
      ["tesseract_module"] = {
        ["fields"] = {
          {
            ["name"] = "joins",
            ["type"] = "`$ARRAY`",
            ["union"] = {
              ["branches"] = 3,
              ["count"] = 3,
              ["depth"] = 7,
            },
          },
          {
            ["name"] = "pagination",
            ["short"] = "Pagination instructions.",
            ["type"] = "`$OBJECT`",
          },
          {
            ["name"] = "requests",
            ["req"] = true,
            ["type"] = "`$ARRAY`",
            ["union"] = {
              ["branches"] = 5,
              ["count"] = 17,
              ["depth"] = 15,
            },
          },
        },
        ["name"] = "tesseract_module",
        ["op"] = {
          ["create"] = {
            ["input"] = "data",
            ["name"] = "create",
            ["points"] = {
              {
                ["args"] = {
                  ["header"] = {
                    {
                      ["kind"] = "header",
                      ["name"] = "authorization",
                      ["orig"] = "authorization",
                      ["type"] = "`$ANY`",
                    },
                    {
                      ["kind"] = "header",
                      ["name"] = "x_tesseract_jwt",
                      ["orig"] = "x_tesseract_jwt",
                      ["type"] = "`$ANY`",
                    },
                  },
                  ["params"] = {
                    {
                      ["kind"] = "param",
                      ["name"] = "extension",
                      ["orig"] = "extension",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                    },
                  },
                  ["query"] = {
                    {
                      ["kind"] = "query",
                      ["name"] = "token",
                      ["orig"] = "token",
                      ["type"] = "`$STRING`",
                    },
                  },
                },
                ["kind"] = "http",
                ["method"] = "POST",
                ["orig"] = "/tesseract/multiquery.{extension}",
                ["segments"] = {
                  {
                    ["lit"] = "tesseract",
                  },
                  {
                    ["lit"] = "multiquery.{extension}",
                  },
                },
                ["select"] = {
                  ["exist"] = {
                    "authorization",
                    "extension",
                    "token",
                    "x_tesseract_jwt",
                  },
                },
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body`",
                },
                ["parts"] = {
                  "tesseract",
                  "multiquery.{extension}",
                },
              },
            },
          },
          ["load"] = {
            ["input"] = "data",
            ["name"] = "load",
            ["points"] = {
              {
                ["args"] = {
                  ["header"] = {
                    {
                      ["kind"] = "header",
                      ["name"] = "accept",
                      ["orig"] = "accept",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["kind"] = "header",
                      ["name"] = "authorization",
                      ["orig"] = "authorization",
                      ["type"] = "`$ANY`",
                    },
                    {
                      ["kind"] = "header",
                      ["name"] = "x_tesseract_jwt",
                      ["orig"] = "x_tesseract_jwt",
                      ["type"] = "`$ANY`",
                    },
                  },
                  ["query"] = {
                    {
                      ["kind"] = "query",
                      ["name"] = "alias",
                      ["orig"] = "alias",
                      ["type"] = "`$ANY`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "cube",
                      ["orig"] = "cube",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "drilldown",
                      ["orig"] = "drilldown",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["example"] = "",
                      ["kind"] = "query",
                      ["name"] = "exclude",
                      ["orig"] = "exclude",
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "filter",
                      ["orig"] = "filter",
                      ["type"] = "`$ARRAY`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "growth",
                      ["orig"] = "growth",
                      ["type"] = "`$ANY`",
                    },
                    {
                      ["example"] = "",
                      ["kind"] = "query",
                      ["name"] = "include",
                      ["orig"] = "include",
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["example"] = "0",
                      ["kind"] = "query",
                      ["name"] = "limit",
                      ["orig"] = "limit",
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "locale",
                      ["orig"] = "locale",
                      ["type"] = "`$ANY`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "measure",
                      ["orig"] = "measure",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["example"] = "",
                      ["kind"] = "query",
                      ["name"] = "parent",
                      ["orig"] = "parent",
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "property",
                      ["orig"] = "property",
                      ["type"] = "`$ANY`",
                    },
                    {
                      ["example"] = "",
                      ["kind"] = "query",
                      ["name"] = "ranking",
                      ["orig"] = "ranking",
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["example"] = "",
                      ["kind"] = "query",
                      ["name"] = "sort",
                      ["orig"] = "sort",
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "time",
                      ["orig"] = "time",
                      ["type"] = "`$ANY`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "token",
                      ["orig"] = "token",
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "top",
                      ["orig"] = "top",
                      ["type"] = "`$ANY`",
                    },
                  },
                },
                ["kind"] = "http",
                ["method"] = "GET",
                ["orig"] = "/tesseract/debug/query",
                ["segments"] = {
                  {
                    ["lit"] = "tesseract",
                  },
                  {
                    ["lit"] = "debug",
                  },
                  {
                    ["lit"] = "query",
                  },
                },
                ["select"] = {
                  ["exist"] = {
                    "accept",
                    "alias",
                    "authorization",
                    "cube",
                    "drilldown",
                    "exclude",
                    "filter",
                    "growth",
                    "include",
                    "limit",
                    "locale",
                    "measure",
                    "parent",
                    "property",
                    "ranking",
                    "sort",
                    "time",
                    "token",
                    "top",
                    "x_tesseract_jwt",
                  },
                },
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body`",
                },
                ["parts"] = {
                  "tesseract",
                  "debug",
                  "query",
                },
              },
              {
                ["args"] = {
                  ["header"] = {
                    {
                      ["kind"] = "header",
                      ["name"] = "authorization",
                      ["orig"] = "authorization",
                      ["type"] = "`$ANY`",
                    },
                    {
                      ["kind"] = "header",
                      ["name"] = "x_tesseract_jwt",
                      ["orig"] = "x_tesseract_jwt",
                      ["type"] = "`$ANY`",
                    },
                  },
                  ["params"] = {
                    {
                      ["kind"] = "param",
                      ["name"] = "extension",
                      ["orig"] = "extension",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                    },
                  },
                  ["query"] = {
                    {
                      ["kind"] = "query",
                      ["name"] = "alias",
                      ["orig"] = "alias",
                      ["type"] = "`$ANY`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "cube",
                      ["orig"] = "cube",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "drilldown",
                      ["orig"] = "drilldown",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["example"] = "",
                      ["kind"] = "query",
                      ["name"] = "exclude",
                      ["orig"] = "exclude",
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "filter",
                      ["orig"] = "filter",
                      ["type"] = "`$ARRAY`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "growth",
                      ["orig"] = "growth",
                      ["type"] = "`$ANY`",
                    },
                    {
                      ["example"] = "",
                      ["kind"] = "query",
                      ["name"] = "include",
                      ["orig"] = "include",
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["example"] = "0",
                      ["kind"] = "query",
                      ["name"] = "limit",
                      ["orig"] = "limit",
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "locale",
                      ["orig"] = "locale",
                      ["type"] = "`$ANY`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "measure",
                      ["orig"] = "measure",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["example"] = "",
                      ["kind"] = "query",
                      ["name"] = "parent",
                      ["orig"] = "parent",
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "property",
                      ["orig"] = "property",
                      ["type"] = "`$ANY`",
                    },
                    {
                      ["example"] = "",
                      ["kind"] = "query",
                      ["name"] = "ranking",
                      ["orig"] = "ranking",
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["example"] = "",
                      ["kind"] = "query",
                      ["name"] = "sort",
                      ["orig"] = "sort",
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "time",
                      ["orig"] = "time",
                      ["type"] = "`$ANY`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "token",
                      ["orig"] = "token",
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "top",
                      ["orig"] = "top",
                      ["type"] = "`$ANY`",
                    },
                  },
                },
                ["kind"] = "http",
                ["method"] = "GET",
                ["orig"] = "/tesseract/data.{extension}",
                ["segments"] = {
                  {
                    ["lit"] = "tesseract",
                  },
                  {
                    ["lit"] = "data.{extension}",
                  },
                },
                ["select"] = {
                  ["exist"] = {
                    "alias",
                    "authorization",
                    "cube",
                    "drilldown",
                    "exclude",
                    "extension",
                    "filter",
                    "growth",
                    "include",
                    "limit",
                    "locale",
                    "measure",
                    "parent",
                    "property",
                    "ranking",
                    "sort",
                    "time",
                    "token",
                    "top",
                    "x_tesseract_jwt",
                  },
                },
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body`",
                },
                ["parts"] = {
                  "tesseract",
                  "data.{extension}",
                },
              },
              {
                ["args"] = {
                  ["header"] = {
                    {
                      ["kind"] = "header",
                      ["name"] = "authorization",
                      ["orig"] = "authorization",
                      ["type"] = "`$ANY`",
                    },
                    {
                      ["kind"] = "header",
                      ["name"] = "x_tesseract_jwt",
                      ["orig"] = "x_tesseract_jwt",
                      ["type"] = "`$ANY`",
                    },
                  },
                  ["query"] = {
                    {
                      ["kind"] = "query",
                      ["name"] = "token",
                      ["orig"] = "token",
                      ["type"] = "`$STRING`",
                    },
                  },
                },
                ["kind"] = "http",
                ["method"] = "GET",
                ["orig"] = "/tesseract/debug/flush",
                ["segments"] = {
                  {
                    ["lit"] = "tesseract",
                  },
                  {
                    ["lit"] = "debug",
                  },
                  {
                    ["lit"] = "flush",
                  },
                },
                ["select"] = {
                  ["exist"] = {
                    "authorization",
                    "token",
                    "x_tesseract_jwt",
                  },
                },
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body`",
                },
                ["parts"] = {
                  "tesseract",
                  "debug",
                  "flush",
                },
              },
              {
                ["args"] = {
                  ["header"] = {
                    {
                      ["kind"] = "header",
                      ["name"] = "authorization",
                      ["orig"] = "authorization",
                      ["type"] = "`$ANY`",
                    },
                    {
                      ["kind"] = "header",
                      ["name"] = "x_tesseract_jwt",
                      ["orig"] = "x_tesseract_jwt",
                      ["type"] = "`$ANY`",
                    },
                  },
                  ["query"] = {
                    {
                      ["kind"] = "query",
                      ["name"] = "token",
                      ["orig"] = "token",
                      ["type"] = "`$STRING`",
                    },
                  },
                },
                ["kind"] = "http",
                ["method"] = "GET",
                ["orig"] = "/tesseract/debug/schema",
                ["segments"] = {
                  {
                    ["lit"] = "tesseract",
                  },
                  {
                    ["lit"] = "debug",
                  },
                  {
                    ["lit"] = "schema",
                  },
                },
                ["select"] = {
                  ["exist"] = {
                    "authorization",
                    "token",
                    "x_tesseract_jwt",
                  },
                },
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body`",
                },
                ["parts"] = {
                  "tesseract",
                  "debug",
                  "schema",
                },
              },
              {
                ["args"] = {
                  ["params"] = {
                    {
                      ["kind"] = "param",
                      ["name"] = "extension",
                      ["orig"] = "extension",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                    },
                  },
                },
                ["kind"] = "http",
                ["method"] = "GET",
                ["orig"] = "/tesseract/members.{extension}",
                ["segments"] = {
                  {
                    ["lit"] = "tesseract",
                  },
                  {
                    ["lit"] = "members.{extension}",
                  },
                },
                ["select"] = {
                  ["exist"] = {
                    "extension",
                  },
                },
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body`",
                },
                ["parts"] = {
                  "tesseract",
                  "members.{extension}",
                },
              },
              {
                ["args"] = {},
                ["kind"] = "http",
                ["method"] = "GET",
                ["orig"] = "/tesseract/data",
                ["segments"] = {
                  {
                    ["lit"] = "tesseract",
                  },
                  {
                    ["lit"] = "data",
                  },
                },
                ["select"] = {},
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body`",
                },
                ["parts"] = {
                  "tesseract",
                  "data",
                },
              },
            },
          },
        },
        ["relations"] = {
          ["ancestors"] = {},
        },
      },
      ["tesseract_schema"] = {
        ["fields"] = {
          {
            ["name"] = "annotations",
            ["req"] = true,
            ["type"] = "`$OBJECT`",
          },
          {
            ["name"] = "caption",
            ["req"] = true,
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "dimensions",
            ["req"] = true,
            ["type"] = "`$ARRAY`",
          },
          {
            ["name"] = "measures",
            ["req"] = true,
            ["type"] = "`$ARRAY`",
          },
          {
            ["name"] = "name",
            ["req"] = true,
            ["type"] = "`$STRING`",
          },
        },
        ["name"] = "tesseract_schema",
        ["op"] = {
          ["list"] = {
            ["input"] = "data",
            ["name"] = "list",
            ["points"] = {
              {
                ["args"] = {
                  ["header"] = {
                    {
                      ["kind"] = "header",
                      ["name"] = "authorization",
                      ["orig"] = "authorization",
                      ["type"] = "`$ANY`",
                    },
                    {
                      ["kind"] = "header",
                      ["name"] = "x_tesseract_jwt",
                      ["orig"] = "x_tesseract_jwt",
                      ["type"] = "`$ANY`",
                    },
                  },
                  ["query"] = {
                    {
                      ["kind"] = "query",
                      ["name"] = "locale",
                      ["orig"] = "locale",
                      ["type"] = "`$ANY`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "token",
                      ["orig"] = "token",
                      ["type"] = "`$STRING`",
                    },
                  },
                },
                ["kind"] = "http",
                ["method"] = "GET",
                ["orig"] = "/complexity/cubes",
                ["segments"] = {
                  {
                    ["lit"] = "complexity",
                  },
                  {
                    ["lit"] = "cubes",
                  },
                },
                ["select"] = {
                  ["exist"] = {
                    "authorization",
                    "locale",
                    "token",
                    "x_tesseract_jwt",
                  },
                },
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body`",
                },
                ["parts"] = {
                  "complexity",
                  "cubes",
                },
              },
              {
                ["args"] = {
                  ["header"] = {
                    {
                      ["kind"] = "header",
                      ["name"] = "authorization",
                      ["orig"] = "authorization",
                      ["type"] = "`$ANY`",
                    },
                    {
                      ["kind"] = "header",
                      ["name"] = "x_tesseract_jwt",
                      ["orig"] = "x_tesseract_jwt",
                      ["type"] = "`$ANY`",
                    },
                  },
                  ["query"] = {
                    {
                      ["kind"] = "query",
                      ["name"] = "locale",
                      ["orig"] = "locale",
                      ["type"] = "`$ANY`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "token",
                      ["orig"] = "token",
                      ["type"] = "`$STRING`",
                    },
                  },
                },
                ["kind"] = "http",
                ["method"] = "GET",
                ["orig"] = "/tesseract/cubes",
                ["segments"] = {
                  {
                    ["lit"] = "tesseract",
                  },
                  {
                    ["lit"] = "cubes",
                  },
                },
                ["select"] = {
                  ["exist"] = {
                    "authorization",
                    "locale",
                    "token",
                    "x_tesseract_jwt",
                  },
                },
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body`",
                },
                ["parts"] = {
                  "tesseract",
                  "cubes",
                },
              },
            },
          },
        },
        ["relations"] = {
          ["ancestors"] = {},
        },
      },
    },
  }
end


local function make_feature(name)
  local features = require("features")
  local factory = features[name]
  if factory ~= nil then
    return factory()
  end
  return features.base()
end


-- Attach make_feature to the SDK class
local function setup_sdk(SDK)
  SDK._make_feature = make_feature
end


return make_config
