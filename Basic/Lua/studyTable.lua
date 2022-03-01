print("hello world")
--创建表
a = {}
k = "x"
a[k] = 100
print(a["x"])
--删除表
a = nil

--表索引
a = {["x"] = 120}
print(a["x"])
print(a.x)
--索引类型强制转换
a[2.0] = "paige"
print(a[2])

--表的构造器
--列表式
data1 = {"pai", "wen", "luo"}
print(data1[1])
--记录式
data2 = {x = 100}

print(data2.x)
--添加字段
print(data2.y)
data2.y = 200
print(data2.y)
--删除字段
data2.y = nil

--列表式和记录式混用
data3 = {
	name = "paige",
	age = 18,
	lang = "25cm",
	{x = 100, y = 100},
	{x = 200, y = 200}
}
print(data3[2].x)

--以上两种构造函数的限制
--1.不能使用负数索引初始化表元素
--2.不能使用不符合规范的标识符作为索引
data4 = {["+"] = add, ["-"] = sub}
print(data4["+"])
--但是不能用.号访问