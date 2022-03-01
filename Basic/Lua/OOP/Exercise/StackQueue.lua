require("OOP.Exercise.Stack")

StackQueue = Stack:new()

function StackQueue:insertbottom(item)
    table.insert(self.content, 1, item)
end