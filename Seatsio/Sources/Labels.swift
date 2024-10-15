import Foundation

public struct Labels: Decodable {

    public let own: String
    public let parent: String?
    public let section: String?
    public let displayedLabel: String

    public init(own: String, parent: String? = nil, section: String? = nil, displayedLabel: String = "") {
        self.own = own
        self.parent = parent
        self.section = section
        self.displayedLabel = displayedLabel
    }
}
