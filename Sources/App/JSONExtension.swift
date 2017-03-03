import HTTP
import Vapor

extension JSON {
    static func empty() -> JSON {
        return try! JSON(node: [])
    }
}
