import Foundation

public struct AnyEncodable: Encodable {
    public let value: Encodable

    public func encode(to encoder: Encoder) throws {
        try self.value.encode(to: encoder)
    }
}
