// 打印
// 使用 print() 函数打印消息。在swift语法中 使用print在控制台打印
print("Hello, World!")
// Prints "Hello, world!"

// 使用 let 定义常量，使用 var 定义变量
var myVariable = 42
myVariable = 50
let myConstant = 42
print(myVariable, myConstant)
// Prints "50 42"

// 类型标注
// 常量或变量必须与要赋给它的值具有相同的类型。不过，您不必总是明确指定类型。
// 创建常量或变量时提供一个值可以让编译器推断其类型。在上面的例子中，编译器推断它是一个整数，因为它的初始值是一个整数。myVariable
// 如果初始值没有提供足够的信息（或者没有初始值），请在变量后面写入类型并用冒号分隔来指定类型。
let explicitDouble: Double = 70
let implicitInteger = 70
let implicitDouble = 70.0
print(explicitDouble, implicitInteger, implicitDouble)
// Prints "70.0 70 70.0"

// 类型安全
// Swift 是一个类型安全的语言。当您定义一个变量或常量时，您可以指定它的类型，或者让 Swift 为您推断类型。
// 值永远不会隐式转换为不同类型。如果您需要值转换为不同类型，请使用类型转换。
// 类型安全的另一个好处是，当您使用一个值时，您可以确定它的类型。
let label = "The width is "
let width = 94
let widthLabel = label + String(width)
print(widthLabel)
// Prints "The width is 94"
// 更简单的方法
// 您可以使用字符串插值来插入值和字符串，而不是像上面的例子那样进行显式转换。
// 要插入值，请在要插入的每个值周围放置圆括号 () ，并在括号之前放置反斜杠 \ 。
let apples = 3
let oranges = 5
let appleSummary = "I have \(apples) apples."
let fruitSummary = "I have \(apples + oranges) pieces of fruit."
print(appleSummary, fruitSummary)
// Prints "I have 3 apples." "I have 8 pieces of fruit."

// 多行字符串
// 您可以使用三个双引号（"""）或三个单引号（'''）来创建多行字符串。
// 字符串可以跨越多行，并且可以包含新行和其他特殊字符，而无需进行转义。
// 每行的开头和结尾的空格和制表符都会被保留，并且字符串中的所有前导空格都将被忽略。
// 您可以使用反斜杠 \ 来转义双引号（"）和反斜杠（\），以及在字符串中表示特殊字符（例如换行符 \n 或制表符 \t）。
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

// 数组和字典
// 数组是一个有序的值集合。您可以使用方括号（[]）来创建一个数组，并使用逗号分隔其中的值。
// 字典是一个无序的键值对集合。您可以使用方括号（[]）来创建一个字典，并使用冒号分隔键和值,不同键值对之间用逗号分隔
// 使用方括号[]创建数组和字典，并通过在方括号中写入索引或键来访问其元素。最后一个元素后可以使用逗号。
var fruits = ["strawberries", "limes", "tangerines",]
fruits[1] = "grapes"
var occupations = [
    "Malcolm": "Captain",
    "Kaylee": "Mechanic",
 ]
print(fruits, occupations)
// Prints "["strawberries", "grapes", "tangerines"] ["Malcolm": "Captain", "Kaylee": "Mechanic"]"
// 数组和字典的新增
// append() 方法可以在数组的末尾添加一个新元素。
// 字典的下标可以用来添加新的键值对。
occupations["Jayne"] = "Public Relations"
fruits.append("oranges")
print(fruits, occupations)
// Prints "["strawberries", "grapes", "tangerines", "oranges"] ["Malcolm": "Captain", "Kaylee": "Mechanic", "Jayne": "Public Relations"]"
// 空数组和空字典
// 您可以使用空括号（[]）创建一个空数组。
// 您可以使用空括号（[:]）创建一个空字典。
fruits = []
occupations = [:]
print(fruits, occupations)
// Prints "[] [:]"
// 如果要将空数组或字典分配给新变量，或分配给没有任何类型信息的其他地方，则需要指定类型。
let emptyArray = [String]()
let emptyDictionary = [String: Float]()
print(emptyArray, emptyDictionary)
// Prints "[] [:]"