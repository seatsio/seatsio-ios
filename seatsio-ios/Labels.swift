import Foundation

public struct Labels: Decodable {

    public let own: String
    public let parent: String?
    public let section: String?
    public let displayedLabel: String
}
