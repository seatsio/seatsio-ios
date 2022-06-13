import Foundation

public struct HoldToken: Decodable {
    public let token: String
    public let expiresInSeconds: Int
    public let expiresAt: Date
}
