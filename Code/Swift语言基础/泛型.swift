// 泛型定义
// 在尖括号内写一个名称来创建通用函数或类型。
func makeArray<Item>(repeating item: Item, numberOfTimes: Int) -> [Item] {
    var result: [Item] = []
    for _ in 0..<numberOfTimes {
         result.append(item)
    }
    return result
}
print(makeArray(repeating: "knock", numberOfTimes: 4))
// Print "[knock, knock, knock, knock]"

// 您可以创建函数和方法以及类、枚举和结构的通用形式
// Reimplement the Swift standard library's optional type
enum OptionalValue<Wrapped> {
    case none
    case some(Wrapped)
}
var possibleInteger: OptionalValue<Int> = .none
possibleInteger = .some(100)

// 在主体之前使用where来指定一系列要求 — — 例如，要求类型实现协议、要求两种类型相同或要求类具有特定的超类。
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