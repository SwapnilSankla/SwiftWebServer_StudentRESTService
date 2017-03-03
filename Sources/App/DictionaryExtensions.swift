import Foundation

extension Dictionary {
    func toJson() throws -> String {
        return try JSONSerialization.data(withJSONObject: self, options: .prettyPrinted).string()
    }
}
