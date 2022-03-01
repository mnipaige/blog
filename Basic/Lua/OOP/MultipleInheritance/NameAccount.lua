require("OOP.MultipleInheritance.MultipleInheritanceModel")
require("OOP/Class/Account")

Name = {}

function Name:getName()
    return self.name
end

function Name:setName(name)
    self.name = name
end

NameAccount = createClass(Account, Name)