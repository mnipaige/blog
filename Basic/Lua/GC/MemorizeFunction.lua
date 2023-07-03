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