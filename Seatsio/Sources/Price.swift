import Foundation

public enum Price {
    case priceForCategory(CategoryPricing)
    case priceForObjects(ObjectPricing)
}

extension Price: Codable {

    private enum CodingKeys: String, CodingKey {
        case base, payload
    }

    private enum Base: Int, Codable {
        case priceForCategory, priceForObjects
    }

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let base = try container.decode(Base.self, forKey: .base)
        switch base {
            case .priceForCategory:
                self = .priceForCategory(try container.decode(CategoryPricing.self, forKey: .payload))
            case .priceForObjects:
                self = .priceForObjects(try container.decode(ObjectPricing.self, forKey: .payload))
        }
    }

    public func encode(to encoder: Encoder) throws {
        switch self {
            case .priceForCategory(let payload):
                try payload.encode(to: encoder)
            case .priceForObjects(let payload):
                try payload.encode(to: encoder)
        }
    }
}
