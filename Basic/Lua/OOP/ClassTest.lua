require("OOP/Class/Account")
require("OOP/Inheritance/SpecialAccount")
require("OOP.MultipleInheritance.NameAccount")
require("OOP.Privacy.PrivacyAccount")
require("OOP.Exercise.Stack")
require("OOP.Exercise.StackQueue")

-- local a = Account:new({name = "a"})
-- a.balance = 100
-- print(a:getBalance())
-- local tempAccount = a
-- local b = Account:new({name = "b"})
-- b.balance = 1000
--print(tempAccount.limit)
local sa = SpecialAccount:new()
sa.limit = 10
print(sa.limit)
print(sa:getLimit())

--local nameAccount = NameAccount:new({name = "Paige", age = 100})
--print(nameAccount)
--print(nameAccount:getName())
--print(nameAccount:getName())

-- local pricayAccount = PrivacyAccount(1000)

-- pricayAccount.deposit(300)
-- pricayAccount.withdraw(600)
-- print(pricayAccount.getBalance())

-- local stack = Stack:new()
-- print(stack:isempty())

-- stack:push(100)
-- print(stack:isempty())
-- print(stack:top())
-- stack:push(20)
-- print(stack:top())
-- print(stack:pop())
-- print(stack:top())
-- print(stack:pop())
-- print(stack:isempty())

-- local stackQueue = StackQueue:new()
-- stackQueue:push(100)
-- stackQueue:push(101)
-- stackQueue:push(102)
-- stackQueue:insertbottom(103)
-- stackQueue:printContent()
