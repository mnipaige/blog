--瞬表：一个弱引用键表，就算值引用该弱引用键，当弱引用键只有弱引用表引用时任然可以回收
require("GC.ObjectAtrribute")

local mem = {}
setmetatable(mem, {__mode = "k"})
--工厂方法记忆函数
function CObjectFactory(o)
    local cobjectFunc = mem[o]
    if not cobjectFunc then
        cobjectFunc = function ()
            return o
        end
        --以对象为键存入引用弱引用键的构造函数
        mem[o] = cobjectFunc
    end 
    return cobjectFunc
end

local paige = CObjectFactory(Person:new())()
paige:Init("paige", 26)
Person.PrintAttributeName();

for key, value in pairs(mem) do
    print(key, value)
end

--由于瞬表机制的存在，是的就算值引用弱引用键的表的键，任然可以垃圾回收
paige = nil;
collectgarbage();

for key, value in pairs(mem) do
    print(key, value)
end


