--析构器
local t = {}
setmetatable(t , {__gc = function ()
    print("finalizer!!!")
end})

g_t = {}
setmetatable(g_t, {__gc = function ()
    print("g_t finalizer!!!")
end})
_G["g_t"] = g_t

--设置原表时不设置，需要占位
local temp = {}
local mt = {__gc = true}
setmetatable(temp, mt)
mt.__gc = function ()
    print("temp finalizer!!!")
end
--t = nil;
--collectgarbage();
os.exit();

--gc执行顺序是注册顺序反着执行
-- temp finalizer!!!
-- g_t finalizer!!!
-- finalizer!!!

