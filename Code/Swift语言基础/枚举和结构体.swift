// 枚举的基本结构
// 使用 enum 关键字来定义枚举。和类以及其他所有命名类型一样，枚举可以关联方法。
// 默认情况下，Swift 从零开始分配原始值，每次递增一，但你可以通过显式指定值来更改这种行为。
// 在下面的示例中，Ace 被显式分配了原始值 1，其余的原始值按顺序分配。你也可以使用字符串或浮点数作为枚举的原始类型。
// 使用 rawValue 属性来访问枚举案例的原始值。
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
// 注意：
// 枚举的原始值可以是字符串、字符、整数或浮点数。
// 原始值的类型必须相同。

// 初始化器
// 使用 init?(rawValue:) 初始化器，从原始值创建枚举实例。它返回与原始值匹配的枚举案例，或者如果没有匹配的 Rank，则返回 nil。

if let convertedRank = Rank(rawValue: 3) {
    let threeDescription = convertedRank.simpleDescription()
    print(threeDescription)
}

// 枚举的案例值是实际值，而不仅仅是它们原始值的一种写法。事实上，在没有有意义的原始值的情况下，你不必提供原始值。
enum Suit {
    case spades, hearts, diamonds, clubs


    func simpleDescription() -> String {
        switch self {
        case .spades:
            return "spades"
        case .hearts:
            return "hearts"
        case .diamonds:
            return "diamonds"
        case .clubs:
            return "clubs"
        }
    }
    func color() -> String {
        switch self {
        case.spades, .clubs:
            return "black"
        case.hearts, .diamonds:
            return "red"
        }
    }
}
let hearts = Suit.hearts
let heartsDescription = hearts.simpleDescription()
// 注意上面两次引用枚举的 hearts 情况的方式：当为 hearts 常量赋值时，由于常量没有显式指定类型，因此引用枚举情况 Suit.hearts 的完整名称。在 switch 语句内部，由于 self 的值已经知道是花色，因此引用枚举情况的缩写形式 .hearts。只要值的类型已经知道，就可以使用缩写形式。

// 枚举的关联值
// 如果一个枚举有原始值，这些值是在声明时确定的，这意味着特定枚举情况的所有实例始终具有相同的原始值。枚举情况的另一个选择是与情况关联值——这些值在你创建实例时确定，并且每个枚举情况的实例可以不同。你可以将关联值视为枚举情况实例的存储属性。例如，考虑从服务器请求日出和日落时间的情况。服务器要么返回请求的信息，要么返回出错描述。
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

// 结构体
// 使用 struct 关键字来定义结构体。
// 结构体支持许多与类相同的行为，包括方法和初始化器。结构体和类之间最重要的区别之一是，当在代码中传递结构体时，它们总是被复制，而类是通过引用传递的。
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
