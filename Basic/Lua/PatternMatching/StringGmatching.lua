--返回一个函数，通过返回的函数可以遍历目标字符串中所有指定的模式
local str = "my name is  Paige"
local words = {}
for value in string.gmatch(str, "%a+") do
    table.insert(words, value)
end

for key, value in pairs(words) do
    print(value)
end

