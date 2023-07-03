local weakReferenceTable = {}
local mt = {__mode = "k"}
setmetatable(weakReferenceTable, mt)


local key = {}
weakReferenceTable[key] = 1

--覆盖了第一个键值对的key
key = {}
weakReferenceTable[key] = 2

for key, value in pairs(weakReferenceTable) do
    print(key, value)
end

collectgarbage();

for key, value in pairs(weakReferenceTable) do
    print(key, value)
end
--只有对象可以从弱引用表中回收，而像数字，布尔值，字符串这种“值”是不会别回收的