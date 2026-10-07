import ActivityKit

struct HelloAttributes: ActivityAttributes {
    struct ContentState: Codable, Hashable {
        var message: String
    }
}
