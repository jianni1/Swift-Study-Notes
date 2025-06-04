// 控制流的基本结构
// if 和 switch 构成条件语句，使用for-in、while和repeat-while构成循环。
// 条件或循环变量周围的括号是可选的。语句主体周围的大括号是必需的。
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

// if条件语句的强类型性
// 在 Swift 中，if条件语句的条件必须始终是布尔值（true或false）。
// 这意味着 if score {...} 是错误的，因为 score 是一个整数，而整数不能直接用于条件。
// 要检查整数是否大于某个值，您需要使用比较运算符（如 > 、 < 、 == 等）来创建一个布尔表达式。
// 您可以在赋值的等号 ( ) 后面或 后面写入if或，以根据条件选择一个值。switch=return
let scoreDecoration = if teamScore > 10 {
    "🎉"
} else {
    ""
}
print("Score:", teamScore, scoreDecoration)
// Prints "Score: 11 🎉"

// if 和let 一起使用
// 你可以使用 if 和 let 一起处理可能缺失的值。这些值被表示为可选值。
// 一个可选值要么包含一个值，要么包含 nil 来表示值缺失。在值的类型后加上问号 (?) 来标记该值为可选。
var optionalString: String? = "Hello"
print(optionalString == nil)
// Prints "false"
// 如果可选值为 nil，条件为 false，括号内的代码将被跳过。否则，可选值被解包并赋值给 let 后的常量，这使得解包后的值在代码块内可用。
var optionalName: String? = "John Appleseed"
var greeting = "Hello!"
if let name = optionalName {
    greeting = "Hello, \(name)"
}
print(greeting)
// Prints "Hello, John Appleseed"

// ??运算符在条件判断中的使用
// 处理可选值的另一种方法是使用 ?? 运算符提供一个默认值。如果可选值缺失，则使用默认值。
let nickname: String? = nil
let fullName: String = "John Appleseed"
let informalGreeting = "Hi \(nickname ?? fullName)"
print(informalGreeting)
// Prints "Hi John Appleseed"
// 你可以使用更短的拼写来解包一个值，使用相同的名称来表示这个解包后的值。
if let nickname {
    print("Hello, \(nickname)!")
}
// 不打印任何内容，因为 nickname 是 nil

// switch 语句
// switch 语句支持任何类型的数据，而不仅仅是整数。
// 这使得 switch 语句比 if 语句更灵活。
// 您可以使用 switch 语句来检查多个可能的值。
// default 关键字用于处理所有其他情况。不能去掉 default 关键字。
// 执行匹配的 switch case 中的代码后，程序会退出 switch 语句。
// 执行不会继续到下一个 case，因此你不需要在每个 case 的代码末尾显式地跳出 switch。
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

// for-in 循环
// 您使用 for-in 来遍历字典中的项，为每个键值对提供一对名称。字典是无序的集合，因此它们的键和值以任意顺序被遍历。
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

// while 和 repeat-while 循环
// 使用 while 重复一段代码，直到条件改变。循环的条件也可以放在末尾，这样可以确保循环至少运行一次。
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

// ..< 和... 运算符的使用
// 可以通过使用 ..< 来创建一个索引范围，以在循环中保持一个索引。
// 使用 ..< 来创建一个不包括其上限值的范围，并使用 ... 来创建一个包含两个值的范围。
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