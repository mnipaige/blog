Stack = {}
local this = Stack
--正常表示的写法
function Stack:new(o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    self.content = {}
    return o
end

function Stack:push(item)
    table.insert(self.content, item)
end

function Stack:pop()
    return table.remove(self.content, #self.content)
end

function Stack:top()
    return self.content[#self.content]
end

function Stack:isempty()
    return #self.content == 0
end

function Stack:printContent()
    local str = ""
    for i = 1, #self.content do
        str = str.." "..tostring(self.content[i]) 
    end
    print(str)
end

--对偶表示的写法
-- function Stack:new(o)
--     o = o or {}
--     setmetatable(o, self)
--     self.__index = self
--     --self.content = {}
--     Stack.content = {}
--     Stack.content[o] = {}
--     return o
-- end

-- function Stack:push(item)
--     table.insert(this.content[self], item)
-- end

-- function Stack:pop()
--     return table.remove(this.content[self], #this.content[self])
-- end

-- function Stack:top()
--     return this.content[self][#this.content[self]]
-- end

-- function Stack:isempty()
--     return #this.content[self] == 0
-- end

-- function Stack:printContent()
--     local str = ""
--     for i = 1, #this.content[self] do
--         str = str.." "..tostring(this.content[self][i]) 
--     end
--     print(str)
-- end