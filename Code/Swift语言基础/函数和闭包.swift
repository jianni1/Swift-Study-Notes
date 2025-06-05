// 函数的基本结构
//使用 func 声明函数。通过在函数名后跟一个括号内的参数列表来调用函数。使用 -> 将参数名和类型与函数的返回类型分开。
func greet(person: String, day: String) -> String {
    return "Hello \(person), today is \(day)."
}
print(greet(person: "Bob", day: "Tuesday"))
// Prints："Hello Bob, today is Tuesday."

// 无参数标签
// 函数参数可以在调用时省略其标签。
// 默认情况下，函数使用其参数名称作为其参数的标签。在参数名称之前编写自定义的参数标签，或编写 _ 以使用无参数标签。
func greet(_ person: String, on day: String) -> String {
    return "Hello \(person), today is \(day)."
}
greet("John", on: "Wednesday")
// Prints："Hello John, today is Wednesday."

// 使用元组来创建复合值
// 例如，从函数返回多个值。元组的元素可以通过名称或编号来引用。
func calculateStatistics(scores: [Int]) -> (min: Int, max: Int, sum: Int) {
    var min = scores[0]
    var max = scores[0]
    var sum = 0
    for score in scores {
        if score > max {
            max = score
        }else if score < min {
            min = score
        }
        sum += score
    }
    return (min, max, sum)
}
let statistics = calculateStatistics(scores: [5, 3, 100, 3, 9])
print(statistics.sum)
// Prints："120"
print(statistics.2)
// Prints："120"

// 函数可以嵌套。
// 嵌套函数可以访问在外部函数中声明的变量。你可以使用嵌套函数来组织一个长或复杂的函数中的代码。
func returnFifteen() -> Int {
    var y = 10
    func add() {
        y += 5
    } 
    add()  
    return y
}
print(returnFifteen())
// Prints："15"

// 函数是一等类型
// 这意味着函数可以像其他类型一样传递。例如，您可以将函数作为参数传递给其他函数，或者从函数返回函数。
// 这使您能够编写高阶函数，这些函数可以接受函数作为参数，或者返回函数作为结果。
// 以下是一个简单的示例，演示了如何从函数返回函数。
func makeIncrementer() -> ((Int) -> Int) {
    func addOne(number: Int) -> Int {
        return 1 + number
    }
    return addOne
}
var increment = makeIncrementer()
print(increment(7))
// Prints："8"

// 函数可以将其中的一个参数作为另一个函数。
// 以下是一个简单的示例，演示了如何将函数作为参数传递给其他函数。
func hasAnyMatches(list: [Int], condition: (Int) -> Bool) -> Bool {
    for item in list {
        if condition(item) {
            return true
        }
    }
    return false
}
func lessThanTen(number: Int) -> Bool {
    return number < 10
}
var numbers = [20, 19, 7, 12]
print(hasAnyMatches(list: numbers, condition: lessThanTen))
// Prints："true"

// 闭包实际上是函数的一种特殊形式：
// 函数实际上是闭包的一种特殊情况：可以稍后调用的代码块。闭包中的代码可以访问在闭包创建时所在作用域中可用的变量和函数，即使闭包在执行时处于不同的作用域中也是如此——你已经看到了嵌套函数的例子。你可以通过用大括号（`{}`）包围代码来编写无名的闭包。使用`in`将参数和返回类型与主体分开。
var numbers = [20, 19, 7, 12]
let mappedNumbers = numbers.map({ (number: Int) -> Int in
    let result = 3 * number
    return result
})
print(mappedNumbers)
// Prints："[60, 57, 21, 36]"
// 闭包的简化语法
// 闭包的简化语法可以让您忽略参数类型和返回类型。编译器可以推断出参数和返回类型。
// 以下是一个示例，演示了如何使用简化语法编写闭包。
let mappedNumbers1 = numbers.map({ number in 3 * number })
print(mappedNumbers1)
// Prints："[60, 57, 21, 36]"
// 闭包的参数名称
// 当闭包作为参数传递给函数时，您可以忽略闭包的参数标签，并使用 $0 ， $1 ， $2 等表示闭包的参数。
// 以下是一个示例，演示了如何使用简化语法和参数名称编写闭包。
let sortedNumbers = numbers.sorted { $0 > $1 }
print(sortedNumbers)
// Prints："[20, 19, 12, 7]"