function PrivacyAccount(initBalance)

    local self = {balance = initBalance}

    local withdraw = function (v)
        self.balance = self.balance - v
    end

    local deposit = function (v)
        self.balance = self.balance + v
    end

    local getBalance = function ()
        return self.balance
    end

    return{
        withdraw = withdraw,
        deposit = deposit,
        getBalance = getBalance
    }
    
end