
// 协议声明
// 用于protocol声明协议。
protocol ExampleProtocol {
     var simpleDescription: String { get }
     mutating func adjust()
}

// 协议使用
// 类、枚举和结构都可以采用协议。
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

// extension 扩展
// 用于extension向现有类型添加功能，例如新方法和计算属性。您可以使用扩展为在其他位置声明的类型，甚至从库或框架导入的类型添加协议一致性。
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

// 协议类型
// 你可以像使用任何其他命名类型一样使用协议名称——例如，创建一个包含不同类型但均遵循同一协议的对象集合。当你处理类型为装箱协议类型的值时，协议定义之外的方法将不可用
let protocolValue: ExampleProtocol = a // 这里的a是一个类，而不是一个协议
print(protocolValue.simpleDescription)
// Print "A very simple class.  Now 100% adjusted."
// protocolValue.anotherProperty  
// Uncomment to see the error
