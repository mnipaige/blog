--返回目标字符串与模式相匹配的字符串
local today = "today is 2022-1-17"
local model = "%d+-%d+-%d+"
print(string.match(today, model))