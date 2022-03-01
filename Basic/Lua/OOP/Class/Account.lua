Account = {
    balance = 0
}

--正常的写法
-- function Account:new(o)
--     o = o or {}
--     self.__index = self
--     setmetatable(o , self)
--     return o
-- end


local function printTable(t)
    local str = ""
    for key, value in pairs(t) do
        str = str.." "..tostring(key).." "..tostring(value).."\n"
    end
    
    print(str)
end

--使用代理表来实现对偶表示
function Account:new(o)
    o = o or {}
    self.__index = self
    setmetatable(o, self)

    local proxy = {}

    local mt = {
        __index = function (_, key)
            print("访问了对象的"..key.."属性")
            --printTable(o)
            return o[key]
        end
    }

    setmetatable(proxy, mt)

    return proxy
    --return o
end

function Account:getBalance()
    return self.balance
end

