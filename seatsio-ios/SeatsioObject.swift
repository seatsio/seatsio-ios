import Foundation

public struct SeatsioObject: Decodable {
    let objectType: String
    let label: String
    let labels: Labels
    let id: String

    let category: Category?
    let center: Point?
    let pricing: Pricing?
    let status: String?
    let forSale: Bool?
    let selectable: Bool?
    let selected: Bool?
    let selectedTicketType: String?
    let extraData: Data?

    let capacity: Int?
    let numBooked: Int?
    let numFree: Int?
    let numSelected: Int?
    let selectionPerTicketType: [String:Int]?

    let sectionCategory: Category?
    let numberOfSelectableObjects: Int?
    let numberOfSelectedObjects: Int?
    let selectableCategories: [Category]?
    let isInteractive: Bool?
}
