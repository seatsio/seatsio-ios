import Foundation

class SelectionValidator: Encodable {

    let type: String

    internal init(_ type: String) {
        self.type = type
    }

    class func consecutiveSeats() -> SelectionValidator {
        return ConsecutiveSeatsSelectionValidator()
    }

    class func noOrphanSeats(highlight: Bool? = nil) -> SelectionValidator {
        return NoOrphanSeatsSelectionValidator(highlight)
    }
}

class ConsecutiveSeatsSelectionValidator: SelectionValidator {

    internal init() {
        super.init("consecutiveSeats")
    }
}

class NoOrphanSeatsSelectionValidator: SelectionValidator {

    let highlight: Bool?

    internal init(_ highlight: Bool?) {
        self.highlight = highlight
        super.init("noOrphanSeats")
    }

    private enum CodingKeys: CodingKey {
        case highlight
    }

    override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.highlight, forKey: .highlight)
    }
}