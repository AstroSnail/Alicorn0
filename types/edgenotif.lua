-- THIS FILE AUTOGENERATED BY terms-gen-meta.lua
---@meta "types.edgenotif"

---@class (exact) edgenotif: EnumValue
edgenotif = {}

---@return boolean
function edgenotif:is_Constrain() end
---@return number, SubtypeRelation, number, number, any
function edgenotif:unwrap_Constrain() end
---@return boolean, number, SubtypeRelation, number, number, any
function edgenotif:as_Constrain() end
---@return boolean
function edgenotif:is_CallLeft() end
---@return number, value, SubtypeRelation, number, number, any
function edgenotif:unwrap_CallLeft() end
---@return boolean, number, value, SubtypeRelation, number, number, any
function edgenotif:as_CallLeft() end
---@return boolean
function edgenotif:is_CallRight() end
---@return number, SubtypeRelation, number, value, number, any
function edgenotif:unwrap_CallRight() end
---@return boolean, number, SubtypeRelation, number, value, number, any
function edgenotif:as_CallRight() end

---@class (exact) edgenotifType: EnumType
---@field define_enum fun(self: edgenotifType, name: string, variants: Variants): edgenotifType
---@field Constrain fun(left: number, rel: SubtypeRelation, right: number, shallowest_block: number, cause: any): edgenotif
---@field CallLeft fun(left: number, arg: value, rel: SubtypeRelation, right: number, shallowest_block: number, cause: any): edgenotif
---@field CallRight fun(left: number, rel: SubtypeRelation, right: number, arg: value, shallowest_block: number, cause: any): edgenotif
return {}
