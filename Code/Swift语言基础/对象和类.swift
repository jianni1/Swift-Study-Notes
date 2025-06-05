// 类的创建
// 使用class关键字创建一个类
// 类中的属性声明与常量或变量声明方式相同，只是它处于类的上下文中。同样，方法和函数声明方式也相同。
class Shape {
    var numberOfSides = 0
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}

// 类的使用
var shape = Shape()
shape.numberOfSides = 7
var shapeDescription = shape.simpleDescription()
print(shapeDescription)
// Prints："A shape with 7 sides."

// 初始化器
// 类的初始化器是一种特殊的方法，用于设置新类实例的初始状态。
// 您可以使用init关键字来定义一个初始化器。
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
// 注意：使用 self 来区分初始化器中的属性和参数名称。
// 创建类的实例时，初始化器的参数像函数参数一样传递给初始化器。
// 每个属性都需要被赋值——要么在声明时（如 numberOfSides），要么在初始化器中（如 name）。

// 析构器
// 如果需要在对象被释放前执行一些清理工作，使用 deinit 来创建一个析构器。
// 析构器在对象被释放前调用，可以用来执行一些必要的清理工作。
// 析构器的语法与初始化器相同，只是在关键字 deinit 后面加上一个空的花括号。
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
// 注意：析构器不会被自动调用，只有当对象被释放时才会被调用。

// 继承
// 类可以继承自另一个类。当一个类继承自另一个类时，它会继承父类的所有属性和方法。
// 子类可以重写父类的方法，也可以添加新的方法。
// 子类可以使用 super 关键字来访问父类的方法。
// 子类的示例：
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
// Prints："27.04"
print(square.simpleDescription())
// Prints："A square with sides of length 5.2."
// 注意：
// 子类在其类名后包含超类名，两者之间用冒号分隔。类没有必须继承任何标准根类的要求，因此你可以根据需要包含或省略超类。
// 子类上重写超类实现的方法会标记为 override——如果没有 override 而意外重写方法，编译器会将其检测为错误。编译器还会检测那些实际上没有重写超类中任何方法的带有 override 标记的方法。

// getter 和 setter
// 类、结构体和枚举可以定义属性来存储值。这些值可以是常量或变量，并且可以有 getter 和 setter。
// 您可以使用 getter 和 setter 来控制属性的访问和修改。
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
// 在 perimeter 的 setter 中，新值的隐含名称为 newValue。你可以在 set 之后的括号中提供一个显式名称。
// 注意：
// EquilateralTriangle 类的初始化器有三个不同的步骤：
// 设置子类声明的属性的值。
// 调用父类的初始化器。
// 更改父类定义的属性的值。任何使用方法、获取器或设置器的额外设置工作也可以在此处完成。

// 属性观察器
// 属性观察器可以在属性值更改时运行代码。
// 您可以为属性添加一个或两个观察器：
// 一个 willSet 观察器在设置新值之前运行。
// 一个 didSet 观察器在设置新值之后运行。
// 注意：
// 父类的属性在子类的构造器中设置值之前，会调用父类的 willSet 和 didSet 观察器。
// 父类的属性在子类的构造器中设置值之后，会调用子类的 willSet 和 didSet 观察器。
// 如果你不需要计算属性，但仍然需要提供在设置新值之前和之后运行的代码，请使用 willSet 和 didSet。
// 你提供的代码在任何值在初始化器之外发生变化时都会运行。例如，下面的类确保其三角形的边长始终与其正方形的边长相等。
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
// 注意：在处理可选值时，你可以在方法、属性和下标等操作前加上 ?。如果 ? 前面的值是 nil，那么 ? 后面的所有内容都会被忽略，整个表达式的值将是 nil。否则，可选值将被解包，? 后面的所有内容将对解包后的值进行操作。在这两种情况下，整个表达式的值都是可选值。
let optionalSquare: Square? = Square(sideLength: 2.5, name: "optional square")
let sideLength = optionalSquare?.sideLength
// sideLength 是可选的 Double，值为 "2.5"