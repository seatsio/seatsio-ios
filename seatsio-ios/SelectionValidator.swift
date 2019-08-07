import Foundation

class SelectionValidator: Encodable {

    let type: SelectionValidatorType

    internal init(_ type: SelectionValidatorType) {
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
        super.init(SelectionValidatorType.consecutiveSeats)
    }
}

class NoOrphanSeatsSelectionValidator: SelectionValidator {

    let highlight: Bool?

    internal init(_ highlight: Bool?) {
        self.highlight = highlight
        super.init(SelectionValidatorType.noOrphanSeats)
    }

    private enum CodingKeys: CodingKey {
        case highlight
    }

    override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.highlight, forKey: .highlight)
    }
}