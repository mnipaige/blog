require("OOP.Class.CObject")
--lua opp 对象属性私有性的一种表示方法，对偶表示的一种优化，即用弱引用表存储对象和对象的属性，当对象没有其他地方引用时，垃圾回收时会清楚属性表中的键值对
---@type table key:object, value:attribute
local attributeName = {}
---@type table key:object, value:attribute
local attributeAge = {}
setmetatable(attributeName, { __mode = "k" })
setmetatable(attributeAge, { __mode = "k" })

Person = CObject:new()

function Person:Init(name, age)
    attributeName[self] = name;
    attributeAge[self] = age;
end

function Person:Destory()
    
end

function Person.PrintAttributeName()
    for key, value in pairs(attributeName) do
        print(key, value)
    end
end

function Person.PrintAttributeAge()
    for key, value in pairs(attributeAge) do
        print(key, value)
    end
end
