local function search(k, plist)
    for i = 1, #plist do
        local v = plist[i][k]
        if v then
            return v
        end
    end
end

function createClass(...)
    local c = {}
    local parents = {...}
    setmetatable(c, {__index = function (t, k)--元方法，此处的t是c
        local v = search(k, parents)
        --此处可在c中把找到的方法存下来，下次不用查找，弊端，运行时代码更新不会向下传递
        --t[k] = v
        return v
    end})

    c.__index = c

    function c:new(o)
        o = o or {}
        setmetatable(o, c)
        return o
    end

    return c
end