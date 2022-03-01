SpecialAccount = Account:new({limit = 100})

function SpecialAccount:getLimit()
    return self.limit
end

