import Foundation

public struct Floor: Decodable {

    public let name: String
    public let categories: [Category]

    public init(name: String, categories: [Category]) {
        self.name = name
        self.categories = categories
    }
}