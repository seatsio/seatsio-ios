import Foundation

public class SeatParent: Decodable {

    public let type: String

    public init(type: String) {
        self.type = type
    }
}
