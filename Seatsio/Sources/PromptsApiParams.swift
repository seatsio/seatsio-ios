import Foundation

public struct  OnPlacesPromptParams: Decodable {
    var selectedPlaces: Int
    var minPlaces: Int
    var maxPlaces:     Int
    var objectToSelect: SeatsioObject
}

public struct OnPlacesWithTicketTypesPromptParams: Decodable {
    var ticketTypes: [TicketType]
    var selectedPlacesByTicketType: [String: Int]
    var minPlaces: Int
    var maxPlaces: Int
    var objectsToSelect: [SeatsioObject]
}

public struct OnTicketTypePromptParams: Decodable {
    var ticketTypes: [TicketType]
    var  objectToSelect: SeatsioObject
}
