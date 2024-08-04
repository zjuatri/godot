# GDScript 入门
## 可用的脚本语言
Godot 提供了四种游戏编程语言：GDScript、C# 以及通过 GDExtension 技术提供的 C 和 C++。还有更多社区支持的语言，但这四个是官方语言。

你可以在一个项目中使用多种语言。例如，在团队中，你可以在 GDScript 中编写游戏逻辑，因为它编写起来很快，并使用 C# 或 C++ 来实现复杂的算法并最大限度地提高其性能。或者你可以使用 GDScript 或 C# 编写所有内容。由你自己决定。

如果你是初学者，推荐从 GDScript 入手。GDScript的语法类似python，容易上手。
## 标识符
标识符就是我们编程的时候使用的“名字“ , 给类、接口、**方法（函数）、变量、常量名**，包名等起名字的字符序列

任何**仅限于字母字符（ a 到 z 和 A 到 Z ）、 数字（ 0 到 9 ）和下划线 _ 的字符串**都可以作为标识符。此外，标识符**不能以数字开头，并且区分大小写**（ foo 和 FOO 是两个不同的标识符）。

标识符现在也允许包含 UAX#31 所提供的部分 Unicode 字符，也就是说，你现在也可以将非英文字符作为标识符使用。然而， Unicode 字符中易与 ASCII 字符混淆的字符以及颜文字则是无法作为标识符使用的。
**(可以使用汉字或其他合法字符命名，但是不推荐)**
## 关键字
关键字是语言的保留字，不能用作标识符。例如`if`，`for`等。
后面的内容会再提及，这里就提一下
## 类型与变量
类型一般分为两种，内置类型和引用类型。这里的“基本内置类型”即基本类型，除基本类型以外的所有类型都是引用类型。在函数传参时这两种类型会表现出不同的行为。
怎么区分基本类型和引用类型：引用类型一般都类似于一个“容器”，其中会包括很多基本类型。
### 基本内置类型
#### null
`null` 是一个空数据类型，既不包含任何信息，也不能赋值为其他任何值。
#### bool
“boolean”（布尔）的缩写，只能是 `true` 或 `false`。
#### int
英文“integer”（整数）的缩写，存储整数（正整数和负整数）。
#### float
使用浮点值存储实数，包括小数。存储的是 64 位值，等效于 C++ 中的 double。
#### String
Unicode 格式的字符串。
```gdscript
var string1 = "Hello, " #双引号代表这是一个字符串
var string2 = 'World!'  #单引号也可以
var result = string1 + string2
print(result)  # 输出: Hello, World!
```
在gdscript中，因为存在类型自动推断，所以我们不必记住各种类型的名称。
### 变量创建
变量用`var`关键字创建，可以在初始化的时候赋一个值
```gdscript
var a # 初始化（创建）a变量，a的初始值默认是null
var b = 5 # 初始化的同时赋值
var c = 3.8
var d = b + c
```
### 内置向量类型
#### Vector2
2D 向量类型，包含 `x` 和 `y` 两个字段
```gdscript
var a = Vector2(1.1, 2.3) #创建一个二维向量并存入a变量
a.x = 1 #将a向量的x值改为1
```
#### Vector2i
同 Vector2，但其分量均为整型数值，在做2D网格中显示物品时非常实用。
### 容器内置类型
#### 数组(Array)
任意对象类型的泛型序列
```gdscript
var arr = []
arr = [1, 2, 3]
var b = arr[1] # This is 2.
var c = arr[arr.size() - 1] # This is 3.
var d = arr[-1] # Same as the previous line, but shorter.
arr[0] = "Hi!" # Replacing value 1 with "Hi!".
arr.append(4) # Array is now ["Hi!", 2, 3, 4].
```
#### 字典(Dictionary)
键值对的集合，冒号前为键(key)，冒号后为值(value)
```gdscript
var d = {4: 5, "A key": "A value", 28: [1, 2, 3]}
d["Hi!"] = 0 #如果键中有"Hi!"，则把其对应的值改为0；如果没有则增加一对键值对
d = {
    22: "value",
    "some_key": 2,
    "other_key": [2, 3, 4],
    "more_key": "Hello"
}
```
#### 信号(Signal)
略，在后面详细讲
### 指定类型
```gdscript
var a: Array[int]
var b: int = 5
```
## 常用运算符
[运算符](https://www.bookstack.cn/read/godot-4.2-zh/17dff0780b8d3fc0.md#%E8%BF%90%E7%AE%97%E7%AC%A6)
## 函数
允许复用的一段代码。
```gdscript
func my_function(a, b):
    return a + 2b
```
调用函数
```gdscript
var x = my_function(1,2)
print(x) # 5 
```
若函数体只含一行语句，则可以将函数及其函数体缩在同一行语句内编写：
```gdscript
func square(a): return a * a
```
可以在参数列表之后使用箭头标记（`->`）来指定函数的返回值类型：
```gdscript
func my_int_function() -> int:
    return 0
```
### 引用函数
就 Callable 对象而言，函数是其第一类对象。通过名称引用函数而不调用它，会自动生成指向该函数的 Callable。这可用于将函数作为参数传递。
```gdscript
func map(arr: Array, function: Callable) -> Array:
    var result = []
    for item in arr:
        result.push_back(function.call(item))
    return result
```
可调用体**必须**使用 `call` 方法进行调用。你不能直接使用 () 运算符。