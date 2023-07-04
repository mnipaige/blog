CObject = {}

---@class CObject
---@param o table
---@return CObject
function CObject:new(o)
    o = o or {}
    --如果表o中找不到的索引那么在self表中找__index元方法，由于self的__index元方法就是自己，所以在self中查找，从而实现继承
    self.__index = self
    setmetatable(o, self)
    return o
end

function CObject:Destory()
    print("cobject distory")
end
