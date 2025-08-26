import Foundation

public struct ChannelPricing: Codable {

    public let channel: String
    public let price: Float?
    public let ticketTypes: [TicketTypePricing]?

    public init(channel: String, ticketTypes: [TicketTypePricing]) {
        self.channel = channel
        self.price = nil
        self.ticketTypes = ticketTypes
    }

    public init(channel: String, price: Float) {
        self.channel = channel
        self.price = price
        self.ticketTypes = nil
    }
}
