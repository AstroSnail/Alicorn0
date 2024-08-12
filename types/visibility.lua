-- THIS FILE AUTOGENERATED BY terms-gen-meta.lua
---@meta "visibility.lua"

---@class (exact) visibility: EnumValue
visibility = {}

---@return boolean
function visibility:is_explicit() end
---@return nil
function visibility:unwrap_explicit() end
---@return boolean
function visibility:as_explicit() end
---@return boolean
function visibility:is_implicit() end
---@return nil
function visibility:unwrap_implicit() end
---@return boolean
function visibility:as_implicit() end

---@class (exact) visibilityType: EnumType
---@field define_enum fun(self: visibilityType, name: string, variants: Variants): visibilityType
---@field explicit visibility
---@field implicit visibility
return {}
