// async
// 用于async标记异步运行的函数
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

// await
// await您可以通过在异步函数前面写入来标记对异步函数的调用。
func fetchUsername(from server: String) async -> String {
    let userID = await fetchUserID(from: server)
    if userID == 501 {
        return "John Appleseed"
    }
    return "Guest"
}
print("Hello \(await fetchUsername(from: "primary"))")
// Prints："Hello Guest"

// async let
// 您可以使用async let关键字来同时运行多个异步任务。
func connectUser(to server: String) async {
    async let userID = fetchUserID(from: server)
    async let username = fetchUsername(from: server)
    let greeting = await "Hello \(username), user ID \(userID)"
    print(greeting)
}
print(await connectUser(to: "primary"))
// Prints："Hello Guest, user ID 97"

// Task
// 用于Task从同步代码调用异步函数，而无需等待它们返回。
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

// actors
// actors 与类类似，不同之处在于它们确保不同的异步函数可以同时安全地与同一参与者的实例进行交互。
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