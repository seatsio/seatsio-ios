import Foundation

public struct HoldToken: Decodable {
    
    public let token: String
    public let expiresInSeconds: Int
    public let expiresAt: Date
    
    public init(token: String, expiresInSeconds: Int, expiresAt: Date) {
        self.token = token
        self.expiresInSeconds = expiresInSeconds
        self.expiresAt = expiresAt
    }
}
