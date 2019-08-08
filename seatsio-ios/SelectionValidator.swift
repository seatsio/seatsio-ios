import Foundation

public class SelectionValidator: Encodable {

    let type: SelectionValidatorType

    internal init(_ type: SelectionValidatorType) {
        self.type = type
    }

    class public func consecutiveSeats() -> SelectionValidator {
        return ConsecutiveSeatsSelectionValidator()
    }

    class public func noOrphanSeats(highlight: Bool? = nil) -> SelectionValidator {
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

    override public func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.highlight, forKey: .highlight)
    }
}