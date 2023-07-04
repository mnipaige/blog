local results = {}
--原版记忆函数会有弊端，随着load函数越来越多，内存会不断增加
--优化，将results设置为弱引用表
setmetatable(results, {__mode = "kv"})
function mem_loadstring(s)
    local res = results[s]
    if nil == res then
        res = assert(load(s))
        results[s] = res
    end
    return res
end

--建立了对函数的引用
mem_loadstring("print('hello world')")()

for key, value in pairs(results) do
    print(key, value)
end

--此时弱引用表中只有对函数对象的弱引用，此时垃圾回收会回收弱引用表中的键值对
collectgarbage()

for key, value in pairs(results) do
    print(key, value)
end

