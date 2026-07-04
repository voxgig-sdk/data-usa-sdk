// DataUsa Ts SDK

import { CalculationsModuleEntity } from './entity/CalculationsModuleEntity'
import { EconomicComplexityModuleEntity } from './entity/EconomicComplexityModuleEntity'
import { HealthEntity } from './entity/HealthEntity'
import { MemberEntity } from './entity/MemberEntity'
import { ModuleStatusEntity } from './entity/ModuleStatusEntity'
import { RouteIndexGetEntity } from './entity/RouteIndexGetEntity'
import { TesseractCubeEntity } from './entity/TesseractCubeEntity'
import { TesseractModuleEntity } from './entity/TesseractModuleEntity'
import { TesseractSchemaEntity } from './entity/TesseractSchemaEntity'

export type * from './DataUsaTypes'


import { inspect } from 'node:util'

import type { Context, Feature } from './types'

import { config } from './Config'
import { DataUsaEntityBase } from './DataUsaEntityBase'
import { Utility } from './utility/Utility'


import { BaseFeature } from './feature/base/BaseFeature'


const stdutil = new Utility()


class DataUsaSDK {
  _mode: string = 'live'
  _options: any
  _utility = new Utility()
  _features: Feature[]
  _rootctx: Context

  constructor(options?: any) {

    this._rootctx = this._utility.makeContext({
      client: this,
      utility: this._utility,
      config,
      options,
      shared: new WeakMap()
    })

    this._options = this._utility.makeOptions(this._rootctx)

    const struct = this._utility.struct
    const getpath = struct.getpath
    const items = struct.items

    if (true === getpath(this._options.feature, 'test.active')) {
      this._mode = 'test'
    }

    this._rootctx.options = this._options

    this._features = []

    const featureAdd = this._utility.featureAdd
    const featureInit = this._utility.featureInit

    items(this._options.feature, (fitem: [string, any]) => {
      const fname = fitem[0]
      const fopts = fitem[1]
      if (fopts.active) {
        featureAdd(this._rootctx, this._rootctx.config.makeFeature(fname))
      }
    })

    if (null != this._options.extend) {
      for (let f of this._options.extend) {
        featureAdd(this._rootctx, f)
      }
    }

    for (let f of this._features) {
      featureInit(this._rootctx, f)
    }

    const featureHook = this._utility.featureHook
    featureHook(this._rootctx, 'PostConstruct')
  }


  options() {
    return this._utility.struct.clone(this._options)
  }


  utility() {
    return this._utility.struct.clone(this._utility)
  }


  async prepare(fetchargs?: any) {
    const utility = this._utility
    const struct = utility.struct
    const clone = struct.clone

    const {
      makeContext,
      makeFetchDef,
      prepareHeaders,
      prepareAuth,
    } = utility

    fetchargs = fetchargs || {}

    let ctx: Context = makeContext({
      opname: 'prepare',
      ctrl: fetchargs.ctrl || {},
    }, this._rootctx)

    const options = this._options

    // Build spec directly from SDK options + user-provided fetch args.
    const spec: any = {
      base: options.base,
      prefix: options.prefix,
      suffix: options.suffix,
      path: fetchargs.path || '',
      method: fetchargs.method || 'GET',
      params: fetchargs.params || {},
      query: fetchargs.query || {},
      headers: prepareHeaders(ctx),
      body: fetchargs.body,
      step: 'start',
    }

    ctx.spec = spec

    // Merge user-provided headers over SDK defaults.
    if (fetchargs.headers) {
      const uheaders = fetchargs.headers
      for (let key in uheaders) {
        spec.headers[key] = uheaders[key]
      }
    }

    // Apply SDK auth (apikey, auth prefix, etc.)
    const authResult = prepareAuth(ctx)
    if (authResult instanceof Error) {
      return authResult
    }

    return makeFetchDef(ctx)
  }


  async direct(fetchargs?: any) {
    const utility = this._utility
    const fetcher = utility.fetcher
    const makeContext = utility.makeContext

    const fetchdef = await this.prepare(fetchargs)
    if (fetchdef instanceof Error) {
      return fetchdef
    }

    let ctx: Context = makeContext({
      opname: 'direct',
      ctrl: (fetchargs || {}).ctrl || {},
    }, this._rootctx)

    try {
      const fetched = await fetcher(ctx, fetchdef.url, fetchdef)

      if (null == fetched) {
        return { ok: false, err: ctx.error('direct_no_response', 'response: undefined') }
      }
      else if (fetched instanceof Error) {
        return { ok: false, err: fetched }
      }

      const status = fetched.status

      // No body responses (204 No Content, 304 Not Modified) and explicit
      // zero content-length must skip JSON parsing — fetched.json() would
      // throw `Unexpected end of JSON input` on an empty body.
      const headers = fetched.headers
      const contentLength = headers && 'function' === typeof headers.get
        ? headers.get('content-length')
        : (headers || {})['content-length']
      const noBody = 204 === status || 304 === status || '0' === String(contentLength)

      let json: any = undefined
      if (!noBody) {
        try {
          json = 'function' === typeof fetched.json ? await fetched.json() : fetched.json
        }
        catch (parseErr) {
          // Body wasn't valid JSON — surface the raw response rather than
          // throwing. data stays undefined; callers can inspect status/headers.
          json = undefined
        }
      }

      return {
        ok: status >= 200 && status < 300,
        status,
        headers: fetched.headers,
        data: json,
      }
    }
    catch (err: any) {
      return { ok: false, err }
    }
  }



  _calculations_module?: CalculationsModuleEntity

  // Idiomatic facade: `client.calculations_module.list()` / `client.calculations_module.load({ id })`.
  get calculations_module(): CalculationsModuleEntity {
    return (this._calculations_module ??= new CalculationsModuleEntity(this, undefined))
  }

  /** @deprecated Use `client.calculations_module` instead. */
  CalculationsModule(data?: any) {
    const self = this
    return new CalculationsModuleEntity(self,data)
  }


  _economic_complexity_module?: EconomicComplexityModuleEntity

  // Idiomatic facade: `client.economic_complexity_module.list()` / `client.economic_complexity_module.load({ id })`.
  get economic_complexity_module(): EconomicComplexityModuleEntity {
    return (this._economic_complexity_module ??= new EconomicComplexityModuleEntity(this, undefined))
  }

  /** @deprecated Use `client.economic_complexity_module` instead. */
  EconomicComplexityModule(data?: any) {
    const self = this
    return new EconomicComplexityModuleEntity(self,data)
  }


  _health?: HealthEntity

  // Idiomatic facade: `client.health.list()` / `client.health.load({ id })`.
  get health(): HealthEntity {
    return (this._health ??= new HealthEntity(this, undefined))
  }

  /** @deprecated Use `client.health` instead. */
  Health(data?: any) {
    const self = this
    return new HealthEntity(self,data)
  }


  _member?: MemberEntity

  // Idiomatic facade: `client.member.list()` / `client.member.load({ id })`.
  get member(): MemberEntity {
    return (this._member ??= new MemberEntity(this, undefined))
  }

  /** @deprecated Use `client.member` instead. */
  Member(data?: any) {
    const self = this
    return new MemberEntity(self,data)
  }


  _module_status?: ModuleStatusEntity

  // Idiomatic facade: `client.module_status.list()` / `client.module_status.load({ id })`.
  get module_status(): ModuleStatusEntity {
    return (this._module_status ??= new ModuleStatusEntity(this, undefined))
  }

  /** @deprecated Use `client.module_status` instead. */
  ModuleStatus(data?: any) {
    const self = this
    return new ModuleStatusEntity(self,data)
  }


  _route_index_get?: RouteIndexGetEntity

  // Idiomatic facade: `client.route_index_get.list()` / `client.route_index_get.load({ id })`.
  get route_index_get(): RouteIndexGetEntity {
    return (this._route_index_get ??= new RouteIndexGetEntity(this, undefined))
  }

  /** @deprecated Use `client.route_index_get` instead. */
  RouteIndexGet(data?: any) {
    const self = this
    return new RouteIndexGetEntity(self,data)
  }


  _tesseract_cube?: TesseractCubeEntity

  // Idiomatic facade: `client.tesseract_cube.list()` / `client.tesseract_cube.load({ id })`.
  get tesseract_cube(): TesseractCubeEntity {
    return (this._tesseract_cube ??= new TesseractCubeEntity(this, undefined))
  }

  /** @deprecated Use `client.tesseract_cube` instead. */
  TesseractCube(data?: any) {
    const self = this
    return new TesseractCubeEntity(self,data)
  }


  _tesseract_module?: TesseractModuleEntity

  // Idiomatic facade: `client.tesseract_module.list()` / `client.tesseract_module.load({ id })`.
  get tesseract_module(): TesseractModuleEntity {
    return (this._tesseract_module ??= new TesseractModuleEntity(this, undefined))
  }

  /** @deprecated Use `client.tesseract_module` instead. */
  TesseractModule(data?: any) {
    const self = this
    return new TesseractModuleEntity(self,data)
  }


  _tesseract_schema?: TesseractSchemaEntity

  // Idiomatic facade: `client.tesseract_schema.list()` / `client.tesseract_schema.load({ id })`.
  get tesseract_schema(): TesseractSchemaEntity {
    return (this._tesseract_schema ??= new TesseractSchemaEntity(this, undefined))
  }

  /** @deprecated Use `client.tesseract_schema` instead. */
  TesseractSchema(data?: any) {
    const self = this
    return new TesseractSchemaEntity(self,data)
  }




  static test(testoptsarg?: any, sdkoptsarg?: any) {
    const struct = stdutil.struct
    const setpath = struct.setpath
    const getdef = struct.getdef
    const clone = struct.clone
    const setprop = struct.setprop

    const sdkopts = getdef(clone(sdkoptsarg), {})
    const testopts = getdef(clone(testoptsarg), {})
    setprop(testopts, 'active', true)
    setpath(sdkopts, 'feature.test', testopts)

    const testsdk = new DataUsaSDK(sdkopts)
    testsdk._mode = 'test'

    return testsdk
  }


  tester(testopts?: any, sdkopts?: any) {
    return DataUsaSDK.test(testopts, sdkopts)
  }


  toJSON() {
    return { name: 'DataUsa' }
  }

  toString() {
    return 'DataUsa ' + this._utility.struct.jsonify(this.toJSON())
  }

  [inspect.custom]() {
    return this.toString()
  }

}




const SDK = DataUsaSDK


export {
  stdutil,

  BaseFeature,
  DataUsaEntityBase,

  DataUsaSDK,
  SDK,
}


