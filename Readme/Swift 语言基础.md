# Swift 语言基础

### Hello, world！

在swift语法中 使用print在控制台打印

```swift 
print("Hello, World!")
// Prints "Hello, world!"

```


### 简单值

#### 使用 let 定义常量，使用 var 定义变量

```swift 
var myVariable = 42
myVariable = 50
let myConstant = 42
print(myVariable, myConstant)
// Prints "50 42"
```


#### 类型标注

常量或变量必须与要赋给它的值具有相同的类型。不过不必总是明确指定类型。创建常量或变量时提供一个值可以让编译器推断其类型。在上面的例子中，编译器推断它是一个整数，因为它的初始值是一个整数。`myVariable`如果初始值没有提供足够的信息（或者没有初始值），请在变量后面写入类型并用冒号分隔来指定类型。

```swift 
let explicitDouble: Double = 70
let implicitInteger = 70
let implicitDouble = 70.0
print(explicitDouble, implicitInteger, implicitDouble)
// Prints "70.0 70 70.0"
```


#### 类型安全

swift 是一个类型安全的语言。当您定义一个变量或常量时，您可以指定它的类型，或者让 Swift 为您推断类型。值永远不会隐式转换为不同类型。如果您需要值转换为不同类型，请使用类型转换。类型安全的另一个好处是，当您使用一个值时，您可以确定它的类型。

```swift 
let label = "The width is ";
let width = 94;
let widthLabel = label + String(width);
print(widthLabel);
// Prints "The width is 94"
```


更简单的方法

您可以使用字符串插值来插入值和字符串，而不是像上面的例子那样进行显式转换。

要插入值，请在要插入的每个值周围放置圆括号() ，并在括号之前放置反斜杠 \。

```swift 
let apples = 3
let oranges = 5
let appleSummary = "I have \(apples) apples."
let fruitSummary = "I have \(apples + oranges) pieces of fruit."
print(appleSummary, fruitSummary)
// Prints "I have 3 apples." "I have 8 pieces of fruit."
```


#### 多行字符串

您可以使用三个双引号（"""）或三个单引号（'''）来创建多行字符串。

字符串可以跨越多行，并且可以包含新行和其他特殊字符，而无需进行转义。

每行的开头和结尾的空格和制表符都会被保留，并且字符串中的所有前导空格都将被忽略。

您可以使用反斜杠\来转义双引号（"）和反斜杠（\），以及在字符串中表示特殊字符（例如换行符\n或制表符\t）。

```swift 
let quotation = """
        Even though there's whitespace to the left,
        the actual lines aren't indented.
            Except for this line.
        Double quotes (") can appear without being escaped.

        I still have \(apples + oranges) pieces of fruit.
        """
print(quotation)
// Prints 
// "Even though there's whitespace to the left,
// the actual lines aren't indented.
//     Except for this line.
// Double quotes ("") can appear without being escaped.
//
// I still have 8 pieces of fruit."
```


#### 数组和字典

#### 基本情况

数组是一个有序的值集合。您可以使用方括号（\[]）来创建一个数组，并使用逗号分隔其中的值。

字典是一个无序的键值对集合。您可以使用方括号（\[]）来创建一个字典，并使用冒号分隔键和值,不同键值对之间用逗号分隔

使用方括号\[]创建数组和字典，并通过在方括号中写入索引或键来访问其元素。最后一个元素后可以使用逗号。

```swift 
var fruits = ["strawberries", "limes", "tangerines",]
fruits[1] = "grapes"
var occupations = [
    "Malcolm": "Captain",
    "Kaylee": "Mechanic",
 ]
print(fruits, occupations)
// Prints "["strawberries", "grapes", "tangerines"] ["Malcolm": "Captain", "Kaylee": "Mechanic"]"
```


#### 数组和字典的新增

append() 方法可以在数组的末尾添加一个新元素。

字典的下标可以用来添加新的键值对。

```swift 
occupations["Jayne"] = "Public Relations"
fruits.append("oranges")
print(fruits, occupations)
// Prints "["strawberries", "grapes", "tangerines", "oranges"] ["Malcolm": "Captain", "Kaylee": "Mechanic", "Jayne": "Public Relations"]"

```


#### 空数组和空字典

您可以使用空括号（\[]）创建一个空数组。

您可以使用空括号（\[:]）创建一个空字典。

```swift 
fruits = []
occupations = [:]
print(fruits, occupations)
// Prints "[] [:]"
```


如果要将空数组或字典分配给新变量，或分配给没有任何类型信息的其他地方，则需要指定类型。

```swift 
let emptyArray = [String]()
let emptyDictionary = [String: Float]()
print(emptyArray, emptyDictionary)
// Prints "[] [:]"
```


### 控制流

#### 控制流的基本结构

if和switch构成条件语句，使用for-in、while和repeat-while构成循环。

条件或循环变量周围的括号是可选的。语句主体周围的大括号是必需的。

```swift 
let individualScores = [75, 43, 103, 87, 12]
var teamScore = 0
for score in individualScores {
    if score > 50 {
        teamScore += 3
    } else {
        teamScore += 1
    }
}
print(teamScore)
// Prints "11"
```


#### if条件语句的强布尔性

在 Swift 中，if条件语句的条件必须始终是布尔值（true或false）。

这意味着ifscore {...} 是错误的，因为 score 是一个整数，而整数不能直接用于条件。

要检查整数是否大于某个值，您需要使用比较运算符（如>、<、==等）来创建一个布尔表达式。

您可以在赋值的等号( ) 后面或 后面写入if或，以根据条件选择一个值。switch=return

```swift 
let scoreDecoration = if teamScore > 10 {
    "🎉"
} else {
    ""
}
print("Score:", teamScore, scoreDecoration)
// Prints "Score: 11 🎉"
```


#### if 和let 一起使用

你可以使用if和let一起处理可能缺失的值。这些值被表示为可选值。

一个可选值要么包含一个值，要么包含nil来表示值缺失。在值的类型后加上问号(?) 来标记该值为可选。

```swift 
var optionalString: String? = "Hello"
print(optionalString == nil)
// Prints "false"
```


如果可选值为 nil，条件为 false，括号内的代码将被跳过。否则，可选值被解包并赋值给 let 后的常量，这使得解包后的值在代码块内可用。

```swift 
var optionalName: String? = "John Appleseed"
var greeting = "Hello!"
if let name = optionalName {
    greeting = "Hello, \(name)"
}
print(greeting)
// Prints "Hello, John Appleseed"
```


#### ??运算符在条件判断中的使用

处理可选值的另一种方法是使用 ?? 运算符提供一个默认值。如果可选值缺失，则使用默认值。

```swift 
let nickname: String? = nil
let fullName: String = "John Appleseed"
let informalGreeting = "Hi \(nickname ?? fullName)"
print(informalGreeting)
// Prints "Hi John Appleseed"
```


你可以使用更短的拼写来解包一个值，使用相同的名称来表示这个解包后的值。

```swift 
if let nickname {
    print("Hello, \(nickname)!")
}
// 不打印任何内容，因为 nickname 是 nil
```


#### switch语句

switch语句支持任何类型的数据，而不仅仅是整数。

这使得switch语句比if语句更灵活。

您可以使用switch语句来检查多个可能的值。

default关键字用于处理所有其他情况。不能去掉default关键字。

执行匹配的switchcase中的代码后，程序会退出switch语句。

执行不会继续到下一个case，因此你不需要在每个case的代码末尾显式地跳出switch。

```swift 
let vegetable = "red pepper"
switch vegetable {
case "celery":
    print("Add some raisins and make ants on a log.")   
case "cucumber", "watercress":
    print("That would make a good tea sandwich.")
case let x where x.hasSuffix("pepper"):
    print("Is it a spicy \(x)?")
default:
    print("Everything tastes good in soup.")
}
// Prints "Is it a spicy red pepper?"
```


#### for-in 循环

您使用 for-in 来遍历字典中的项，为每个键值对提供一对名称。字典是无序的集合，因此它们的键和值以任意顺序被遍历。

```swift 
let interestingNumbers = [
    "Prime": [2, 3, 5, 7, 11, 13],
    "Fibonacci": [1, 1, 2, 3, 5, 8],
    "Square": [1, 4, 9, 16, 25],
]
var largest = 0
var largestKey = ""
for (key, numbers) in interestingNumbers {
    for number in numbers {
        if number > largest {
            largestKey = key
            largest = number
        }
    }
}
print("The largest value in interestingNumbers is \(largest) (\(largestKey)).")
// Prints "The largest value in interestingNumbers is 25 (Square)."
```


#### while 和 repeat-while 循环

使用 while 重复一段代码，直到条件改变。循环的条件也可以放在末尾，这样可以确保循环至少运行一次。

```javascript 
// 先判断条件，再执行循环体。
var n = 2
while n < 100 {
    n *= 2
}
print(n)
// Prints "128"
// 先执行循环体，再判断条件。
var m = 2
repeat {
    m *= 2
} while m < 100
print(m)
// Prints "128"
```


#### ..< 和... 运算符的使用

可以通过使用..<来创建一个索引范围，以在循环中保持一个索引。

使用..<来创建一个不包括其上限值的范围，并使用...来创建一个包含两个值的范围。

```swift 
var firstForLoop = 0
for i in 0..<4 {
    firstForLoop += i
}   
print(firstForLoop)
// Prints "6" 

var secondForLoop = 0
for i in 0...4 {
    secondForLoop += i
}
print(secondForLoop)
// Prints "10"

```
