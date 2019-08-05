import Foundation

class SeatingChartConfig: Encodable {
    var publicKey: String
    var events: Set<String>
    var pricing: [Pricing]?
    var priceFormatter: Optional<(Float) -> String>

    init(publicKey: String,
         event: String? = nil,
         events: Set<String>? = nil,
         pricing: [Pricing]? = nil,
         priceFormatter: Optional<(Float) -> String> = nil) {
        self.publicKey = publicKey
        self.events = event == nil ? events! : [event!]
        self.pricing = pricing
        self.priceFormatter = priceFormatter
    }

    private enum CodingKeys: String, CodingKey {
        case publicKey
        case events
        case pricing
    }
}