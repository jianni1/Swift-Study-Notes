// 定义错误类型
// 您可以使用任何采用该Error协议的类型来表示错误。
enum PrinterError: Error {
    case outOfPaper
    case noToner
    case onFire
}

// 抛出错误
// 用于throw抛出错误，并throws标记可能抛出错误的函数。如果在函数中抛出错误，该函数会立即返回，并且调用该函数的代码会处理该错误。
func send(job: Int, toPrinter printerName: String) throws -> String {
    if printerName == "Never Has Toner" {
        throw PrinterError.noToner
    }
    return "Job sent"
}

// 处理错误
// 您可以使用do-catch语句来处理错误。do块包含可能抛出错误的代码，而catch块包含处理错误的代码。
do {
    let printerResponse = try send(job: 1040, toPrinter: "Bi Sheng")
    print(printerResponse)
} catch {    // 这里的error是一个Error类型的变量
    print(error)
}
// Print "Job sent"

// 处理特定错误
// 您可以提供多个catch块来处理特定的错误。您可以在后面写入一个模式，就像在 switch 中catch写入 after 一样。case后面的模式必须是一个错误类型。
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

// 另外一种处理错误的方式是使用try?来处理错误。如果错误发生，try?将返回nil。
let printerSuccess = try? send(job: 1884, toPrinter: "Mergenthaler")
let printerFailure = try? send(job: 1885, toPrinter: "Never Has Toner")
print(printerSuccess)
// Prints "Optional("Job sent")"
print(printerFailure)
// Prints "nil"

// defer
// 用于defer延迟执行代码，直到当前作用域结束。defer块中的代码将在函数返回之前执行。
// 用于defer编写在函数中所有其他代码之后、函数返回之前执行的代码块。无论函数是否抛出错误，都会执行该代码。您可以使用defer它将设置代码和清理代码并排编写，即使它们需要在不同的时间执行。

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