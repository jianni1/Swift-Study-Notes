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

```swift 
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


### 函数和闭包

#### 函数的基本结构

使用 func 声明函数。通过在函数名后跟一个括号内的参数列表来调用函数。使用 -> 将参数名和类型与函数的返回类型分开。

```swift 
func greet(person: String, day: String) -> String {
    return "Hello \(person), today is \(day)."
}
print(greet(person: "Bob", day: "Tuesday"))
// Prints："Hello Bob, today is Tuesday."
```


#### 无参数标签

函数参数可以在调用时省略其标签。

默认情况下，函数使用其参数名称作为其参数的标签。在参数名称之前编写自定义的参数标签，或编写\_以使用无参数标签。

```swift 
func greet(_ person: String, on day: String) -> String {
    return "Hello \(person), today is \(day)."
}
greet("John", on: "Wednesday")
// Prints："Hello John, today is Wednesday."
```


#### 使用元组来创建复合值

例如，从函数返回多个值。元组的元素可以通过名称或编号来引用。

```swift 
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
```


#### 函数可以嵌套

嵌套函数可以访问在外部函数中声明的变量。你可以使用嵌套函数来组织一个长或复杂的函数中的代码。

```swift 
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
```


#### 函数是一等类型

这意味着函数可以像其他类型一样传递。例如，您可以将函数作为参数传递给其他函数，或者从函数返回函数。

这使您能够编写高阶函数，这些函数可以接受函数作为参数，或者返回函数作为结果。

以下是一个简单的示例，演示了如何从函数返回函数。

```swift 
func makeIncrementer() -> ((Int) -> Int) {
    func addOne(number: Int) -> Int {
        return 1 + number
    }
    return addOne
}
var increment = makeIncrementer()
print(increment(7))
// Prints："8"


```


函数可以将其中的一个参数作为另一个函数。

以下是一个简单的示例，演示了如何将函数作为参数传递给其他函数。

```swift 
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
```


#### 闭包

闭包实际上是函数的一种特殊形式：

函数实际上是闭包的一种特殊情况：可以稍后调用的代码块。闭包中的代码可以访问在闭包创建时所在作用域中可用的变量和函数，即使闭包在执行时处于不同的作用域中也是如此——你已经看到了嵌套函数的例子。你可以通过用大括号（`{}`）包围代码来编写无名的闭包。使用`in`将参数和返回类型与主体分开。

```swift 
numbers.map({ (number: Int) -> Int in
    let result = 3 * number
    return result
})
// Prints："[6, 18, 21, 36]"
```


#### 闭包的简化语法

闭包的简化语法可以让您忽略参数类型和返回类型。编译器可以推断出参数和返回类型。

&#x20;以下是一个示例，演示了如何使用简化语法编写闭包。

```swift 
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
```


### 对象和类

#### 类的创建

使用class关键字创建一个类

类中的属性声明与常量或变量声明方式相同，只是它处于类的上下文中。同样，方法和函数声明方式也相同。

```swift 
class Shape {
    var numberOfSides = 0
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}
```


#### 类的使用

```swift 
var shape = Shape()
shape.numberOfSides = 7
var shapeDescription = shape.simpleDescription()
print(shapeDescription)
// Prints："A shape with 7 sides."
```


#### 初始化器

类的初始化器是一种特殊的方法，用于设置新类实例的初始状态。

您可以使用init关键字来定义一个初始化器。

```swift 
class NamedShape {
    var numberOfSides: Int = 0
    var name: String
    init(name: String) {
        self.name = name
    }
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}
```


> 📌注意：使用 self 来区分初始化器中的属性和参数名称。创建类的实例时，初始化器的参数像函数参数一样传递给初始化器。每个属性都需要被赋值——要么在声明时（如 numberOfSides），要么在初始化器中（如 name）。

#### 析构器

如果需要在对象被释放前执行一些清理工作，使用deinit来创建一个析构器。

析构器在对象被释放前调用，可以用来执行一些必要的清理工作。

析构器的语法与初始化器相同，只是在关键字deinit后面加上一个空的花括号。

```swift 
// 析构器的示例：
class Person {
    let name: String
    init(name: String) {
        self.name = name
        print("\(name) is being initialized")
    }
    deinit {
        print("\(name) is being deinitialized")
    }
}
let person = Person(name: "John")
// Prints："John is being initialized"
// Prints："John is being deinitialized"
```


> 📌注意：析构器不会被自动调用，只有当对象被释放时才会被调用。

#### 继承

类可以继承自另一个类。当一个类继承自另一个类时，它会继承父类的所有属性和方法。

子类可以重写父类的方法，也可以添加新的方法。

子类可以使用super关键字来访问父类的方法。

```swift 
class Square: NamedShape {
    var sideLength: Double
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 4
    }
    func area() -> Double {
        return sideLength * sideLength
    }
    override func simpleDescription() -> String {
        return "A square with sides of length \(sideLength)."
    }
}
let square = Square(sideLength: 5.2, name: "my square")
print(square.area())
// Prints: "27.04"
print(square.simpleDescription())
// Prints: "A square with sides of length 5.2."

```


> 📌注意：子类在其类名后包含超类名，两者之间用冒号分隔。类没有必须继承任何标准根类的要求，因此你可以根据需要包含或省略超类。子类上重写超类实现的方法会标记为 override——如果没有 override 而意外重写方法，编译器会将其检测为错误。编译器还会检测那些实际上没有重写超类中任何方法的带有 override 标记的方法。

#### getter 和 setter

类、结构体和枚举可以定义属性来存储值。这些值可以是常量或变量，并且可以有 getter 和 setter。

您可以使用 getter 和 setter 来控制属性的访问和修改。

```swift 
class EquilateralTriangle: NamedShape {
    var sideLength: Double = 0.0
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 3
    }


    var perimeter: Double {
        get {
             return 3.0 * sideLength
        }
        set {
            sideLength = newValue / 3.0
        }
    }


    override func simpleDescription() -> String {
        return "An equilateral triangle with sides of length \(sideLength)."
    }
}
var triangle = EquilateralTriangle(sideLength: 3.1, name: "a triangle")
print(triangle.perimeter)
// Prints "9.3"
triangle.perimeter = 9.9
print(triangle.sideLength)
// Prints "3.3000000000000003"
```


> 📌注意：EquilateralTriangle 类的初始化器有三个不同的步骤：1.设置子类声明的属性的值。2.调用父类的初始化器。3.更改父类定义的属性的值，任何使用方法、获取器或设置器的额外设置工作也可以在此处完成。

#### 属性观察器willSet和didSet

属性观察器可以在属性值更改时运行代码。

您可以为属性添加一个或两个观察器：

一个willSet观察器在设置新值之前运行。

一个didSet观察器在设置新值之后运行。

注意：

父类的属性在子类的构造器中设置值之前，会调用父类的willSet和didSet观察器。

父类的属性在子类的构造器中设置值之后，会调用子类的willSet和didSet观察器。

如果你不需要计算属性，但仍然需要提供在设置新值之前和之后运行的代码，请使用willSet和didSet。

你提供的代码在任何值在初始化器之外发生变化时都会运行。例如，下面的类确保其三角形的边长始终与其正方形的边长相等。

```swift 
class TriangleAndSquare {
    var triangle: EquilateralTriangle {
        willSet {
            square.sideLength = newValue.sideLength
        }
    }
    var square: Square {
        willSet {
            triangle.sideLength = newValue.sideLength
        }
    }
    init(size: Double, name: String) {
        square = Square(sideLength: size, name: name)
        triangle = EquilateralTriangle(sideLength: size, name: name)
    }
}
var triangleAndSquare = TriangleAndSquare(size: 10, name: "another test shape")
print(triangleAndSquare.square.sideLength)
// Prints "10.0"
print(triangleAndSquare.triangle.sideLength)
// Prints "10.0"
triangleAndSquare.square = Square(sideLength: 50, name: "larger square")
print(triangleAndSquare.triangle.sideLength)
// Prints "50.0"
```


> 📌注意：在处理可选值时，你可以在方法、属性和下标等操作前加上 ?。如果 ? 前面的值是 nil，那么 ? 后面的所有内容都会被忽略，整个表达式的值将是 nil。否则，可选值将被解包，? 后面的所有内容将对解包后的值进行操作。在这两种情况下，整个表达式的值都是可选值。

```swift 
let optionalSquare: Square? = Square(sideLength: 2.5, name: "optional square")
let sideLength = optionalSquare?.sideLength
// sideLength 是可选的 Double，值为 "2.5"
```


### 枚举和结构体

#### 枚举的基本结构

使用enum关键字来定义枚举。和类以及其他所有命名类型一样，枚举可以关联方法。

默认情况下，Swift 从零开始分配原始值，每次递增一，但你可以通过显式指定值来更改这种行为。

在下面的示例中，Ace 被显式分配了原始值1，其余的原始值按顺序分配。你也可以使用字符串或浮点数作为枚举的原始类型。

使用 rawValue 属性来访问枚举案例的原始值。

```swift 
enum Rank: Int {
    case ace = 1
    case two, three, four, five, six, seven, eight, nine, ten
    case jack, queen, king
    func simpleDescription() -> String {
        switch self {
        case .ace:
            return "ace"
        case .jack:
            return "jack"
        case .queen:
            return "queen"
        case.king:
            return "king"
        default:
            return String(self.rawValue)
        }
    }
}
let ace = Rank.ace
let aceRawValue = ace.rawValue
// Prints："1"
```


> 📌注意： 枚举的原始值可以是字符串、字符、整数或浮点数。原始值的类型必须相同。

#### 枚举的初始化器

使用 init?(rawValue:) 初始化器，从原始值创建枚举实例。它返回与原始值匹配的枚举案例，或者如果没有匹配的 Rank，则返回 nil。

```swift 
if let convertedRank = Rank(rawValue: 3) {
    let threeDescription = convertedRank.simpleDescription()
    print(threeDescription)
}
```


#### 枚举的关联值

如果一个枚举有原始值，这些值是在声明时确定的，这意味着特定枚举情况的所有实例始终具有相同的原始值。枚举情况的另一个选择是与情况关联值——这些值在你创建实例时确定，并且每个枚举情况的实例可以不同。你可以将关联值视为枚举情况实例的存储属性。例如，考虑从服务器请求日出和日落时间的情况。服务器要么返回请求的信息，要么返回出错描述。

```swift 
enum ServerResponse {
    case result(String, String)
    case failure(String)
}
let success = ServerResponse.result("6:00 am", "8:09 pm")
let failure = ServerResponse.failure("Out of cheese.")

switch success {
case let .result(sunrise, sunset):
    print("Sunrise is at \(sunrise) and sunset is at \(sunset).")
    
case let .failure(message):
    print("Failure...  \(message)")
}
// Prints："Sunrise is at 6:00 am and sunset is at 8:09 pm."
switch failure {
case let.result(sunrise, sunset):
    print("Sunrise is at \(sunrise) and sunset is at \(sunset).")

case let.failure(message):
    print("Failure...  \(message)")
}
// Prints："Failure...  Out of cheese."

```


#### 结构体

使用struct关键字来定义结构体。

结构体支持许多与类相同的行为，包括方法和初始化器。结构体和类之间最重要的区别之一是，当在代码中传递结构体时，它们总是被复制，而类是通过引用传递的。

```swift 
// 结构体的示例：
struct Card {
    var rank: Rank
    var suit: Suit
    func simpleDescription() -> String {
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
}
let threeOfSpades = Card(rank: .three, suit: .spades)
let threeOfSpadesDescription = threeOfSpades.simpleDescription()
print(threeOfSpadesDescription)
// Prints："The 3 of spades"


```


### 并发

#### async

用于async标记异步运行的函数

```swift 
func fetchUserID(from server: String) async -> Int {
    if server == "primary" {
        return 97
    }
    if server == "secondary" {
        return 101
    }
    if server == "development" {
        return 103
    }
    return 501
}
```


#### await

await您可以通过在异步函数前面写入来标记对异步函数的调用。

```swift 
func fetchUsername(from server: String) async -> String {
    let userID = await fetchUserID(from: server)
    if userID == 501 {
        return "John Appleseed"
    }
    return "Guest"
}
print("Hello \(await fetchUsername(from: "primary"))")
// Prints："Hello Guest"
```


#### async let

您可以使用async let关键字来同时运行多个异步任务。

```swift 
func connectUser(to server: String) async {
    async let userID = fetchUserID(from: server)
    async let username = fetchUsername(from: server)
    let greeting = await "Hello \(username), user ID \(userID)"
    print(greeting)
}
print(await connectUser(to: "primary"))
// Prints："Hello Guest, user ID 97"
```


#### Task

用于Task从同步代码调用异步函数，而无需等待它们返回。

```swift 
Task {
    await connectUser(to: "primary")
}
// Prints "Hello Guest, user ID 97"
// 使用任务组来构建并发代码。
let userIDs = await withTaskGroup(of: Int.self) { group in
    for server in ["primary", "secondary", "development"] {
        group.addTask {
            return await fetchUserID(from: server)
        }
    }


    var results: [Int] = []
    for await result in group {
        results.append(result)
    }
    return results
}
print(userIDs)
// Prints "[97, 101, 103]"


```


#### actors

actors 与类类似，不同之处在于它们确保不同的异步函数可以同时安全地与同一参与者的实例进行交互。

```swift 
actor ServerConnection {
    var server: String = "primary"
    private var activeUsers: [Int] = []
    func connect() async -> Int {
        let userID = await fetchUserID(from: server)
        // ... communicate with server ...
        activeUsers.append(userID)
        return userID
    }
}
let connection = ServerConnection()
let userID = await connection.connect()
print(userID)
// Prints："97"
```


### 协议和扩展

#### 协议声明

用protocol声明协议。

```swift 
protocol ExampleProtocol {
     var simpleDescription: String { get }
     mutating func adjust()
}
```


#### 协议使用

类、枚举和结构都可以采用协议。

```swift 
class SimpleClass: ExampleProtocol {
     var simpleDescription: String = "A very simple class."
     var anotherProperty: Int = 69105
     func adjust() {
          simpleDescription += "  Now 100% adjusted."
     }
}
var a = SimpleClass()
a.adjust()
let aDescription = a.simpleDescription
print("aDescription: \(aDescription)")
// Print "aDescription: A very simple class.  Now 100% adjusted."
struct SimpleStructure: ExampleProtocol {
     var simpleDescription: String = "A simple structure"
     mutating func adjust() {
          simpleDescription += " (adjusted)"
     }
}
var b = SimpleStructure()
b.adjust()
let bDescription = b.simpleDescription
print("bDescription: \(bDescription)")
// Print "bDescription: A simple structure (adjusted)"


```


#### extension扩展

用于extension向现有类型添加功能，例如新方法和计算属性。您可以使用扩展为在其他位置声明的类型，甚至从库或框架导入的类型添加协议一致性。

```swift 
extension Int: ExampleProtocol {
     var simpleDescription: String {
          return "The number \(self)"
     }
     mutating func adjust() {
          self += 42
     }
}
print(7.simpleDescription)
// Print "The number 7"
```


#### 协议类型

你可以像使用任何其他命名类型一样使用协议名称——例如，创建一个包含不同类型但均遵循同一协议的对象集合。当你处理类型为装箱协议类型的值时，协议定义之外的方法将不可用

```swift 
let protocolValue: ExampleProtocol = a // 这里的a是一个类，而不是一个协议
print(protocolValue.simpleDescription)
// Print "A very simple class.  Now 100% adjusted."
// protocolValue.anotherProperty  
// Uncomment to see the error
```


### 错误处理

#### 定义错误类型

您可以使用任何采用该Error协议的类型来表示错误。

```swift 
enum PrinterError: Error {
    case outOfPaper
    case noToner
    case onFire
}
```


#### 抛出错误

用于throw抛出错误，并throws标记可能抛出错误的函数。如果在函数中抛出错误，该函数会立即返回，并且调用该函数的代码会处理该错误。

```swift 
func send(job: Int, toPrinter printerName: String) throws -> String {
    if printerName == "Never Has Toner" {
        throw PrinterError.noToner
    }
    return "Job sent"
}
```


#### 处理错误

您可以使用do-catch语句来处理错误。do块包含可能抛出错误的代码，而catch块包含处理错误的代码。

```swift 
do {
    let printerResponse = try send(job: 1040, toPrinter: "Bi Sheng")
    print(printerResponse)
} catch {    // 这里的error是一个Error类型的变量
    print(error)
}
// Print "Job sent"
```


#### 处理特定错误

您可以提供多个catch块来处理特定的错误。您可以在后面写入一个模式，就像在 switch 中catch写入 after 一样。case后面的模式必须是一个错误类型。

```swift 
do {
    let printerResponse = try send(job: 1440, toPrinter: "Gutenberg")
    print(printerResponse)
} catch PrinterError.onFire {
    print("I'll just put this over here, with the rest of the fire.")
} catch let printerError as PrinterError {
    print("Printer error: \(printerError).")
} catch {
    print(error)
}
// Prints "Job sent"
```


#### 使用try?来处理错误

另外一种处理错误的方式是使用try?来处理错误。如果错误发生，try?将返回nil。

```swift 
let printerSuccess = try? send(job: 1884, toPrinter: "Mergenthaler")
let printerFailure = try? send(job: 1885, toPrinter: "Never Has Toner")
print(printerSuccess)
// Prints "Optional("Job sent")"
print(printerFailure)
// Prints "nil"
```


#### defer

用于defer延迟执行代码，直到当前作用域结束。defer块中的代码将在函数返回之前执行。

用于defer编写在函数中所有其他代码之后、函数返回之前执行的代码块。无论函数是否抛出错误，都会执行该代码。您可以使用defer它将设置代码和清理代码并排编写，即使它们需要在不同的时间执行。

```swift 
var fridgeIsOpen = false
let fridgeContent = ["milk", "eggs", "leftovers"]


func fridgeContains(_ food: String) -> Bool {
    fridgeIsOpen = true
    defer {
        fridgeIsOpen = false
    }


    let result = fridgeContent.contains(food)
    return result
}
if fridgeContains("banana") {
    print("Found a banana")
}
print(fridgeIsOpen)
// Prints "false"
```


### 泛型

#### 泛型定义

在尖括号内写一个名称来创建通用函数或类型。

```swift 
func makeArray<Item>(repeating item: Item, numberOfTimes: Int) -> [Item] {
    var result: [Item] = []
    for _ in 0..<numberOfTimes {
         result.append(item)
    }
    return result
}
print(makeArray(repeating: "knock", numberOfTimes: 4))
// Print "[knock, knock, knock, knock]"
```


#### 泛型使用

您可以创建函数和方法以及类、枚举和结构的通用形式

```swift 
enum OptionalValue<Wrapped> {
    case none
    case some(Wrapped)
}
var possibleInteger: OptionalValue<Int> = .none
possibleInteger = .some(100)
```


#### 在where中使用

在主体之前使用where来指定一系列要求 — — 例如，要求类型实现协议、要求两种类型相同或要求类具有特定的超类。

```swift 
func anyCommonElements<T: Sequence, U: Sequence>(_ lhs: T, _ rhs: U) -> Bool
    where T.Element: Equatable, T.Element == U.Element
{
    for lhsItem in lhs {
        for rhsItem in rhs {
            if lhsItem == rhsItem {
                return true
            }
        }
    }
   return false
}
print(anyCommonElements([1, 2, 3], [3]))
// Print "true"
```
