import Foundation

public class Category: Codable {

    let key: Int
    let color: String
    let label: String?
    let accessible: Bool?
    let seatShape: String?

    public init(key: Int, color: String, label: String? = nil, accessible: Bool? = nil, seatShape: String? = nil) {
        self.key = key
        self.color = color
        self.label = label
        self.accessible = accessible
        self.seatShape = seatShape
    }

}
