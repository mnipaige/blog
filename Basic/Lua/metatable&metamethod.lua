--元表 metatable
--可以用来修改一个值面对未知操作时的行为
-- --设置元表
-- local table = {}
-- setmetatable(table, {})
-- --获取元表
-- print(getmetatable(table))


--元方法 metamethod
--预先定义再元表中的一类方法，用来处理值的未知操作
--算数运算相关原方法
--加法（__add）
--减法（__sub）
--除法（__div）
--floor除法（__idiv）
--负数（__unm）
--取模（__mod）
--幂运算（__pow）

--位操作也有元方法：
--按位与（__band）
--按位或（__bor）
--按位异或（__bxor）
--按位取反（__bnot）
--向左移位（__shl）
--向右移位（__shr）

--连接运算符（__concat）

--关系运算符相关元方法：
--等于（__eq）
--小于（__lt）
--小于等于（__le）

--库相关元方法：
--获取字符串（__tostring）
--用于保护元表（__metatable）
--注：如果在元表中设置__metatable字段，那么getmetatable会返回这个字段的值，而setmetatable则会引发一个错误
--遍历（__pairs）
--只有使用pairs方法遍历时才会调用此元方法

--表相关原方法:
--用于查找（__index）rawget查找不会调用元方法
--用于更新赋值（__newindex）rawset查找不会调用元方法

