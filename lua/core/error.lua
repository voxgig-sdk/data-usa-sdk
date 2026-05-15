-- DataUsa SDK error

local DataUsaError = {}
DataUsaError.__index = DataUsaError


function DataUsaError.new(code, msg, ctx)
  local self = setmetatable({}, DataUsaError)
  self.is_sdk_error = true
  self.sdk = "DataUsa"
  self.code = code or ""
  self.msg = msg or ""
  self.ctx = ctx
  self.result = nil
  self.spec = nil
  return self
end


function DataUsaError:error()
  return self.msg
end


function DataUsaError:__tostring()
  return self.msg
end


return DataUsaError
