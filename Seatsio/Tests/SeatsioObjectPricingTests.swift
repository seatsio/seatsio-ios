import XCTest
@testable import Seatsio

final class SeatsioObjectPricingTests: XCTestCase {

    func testInitFromJSON_withStringFormattedPrice() throws {
        // Given
        let json = """
        {
            "ticketType": "VIP",
            "price": 120.5,
            "formattedPrice": "$120.50",
            "originalPrice": 150.0,
            "formattedOriginalPrice": "$150.00",
            "label": "Early Bird",
            "fee": 5.0,
            "description": "Front row"
        }
        """.data(using: .utf8)!

        // When
        let decoded = try JSONDecoder().decode(SeatsioObjectPricing.self, from: json)

        // Then
        XCTAssertEqual(decoded.ticketType, "VIP")
        XCTAssertEqual(decoded.price, 120.5)
        XCTAssertEqual(decoded.formattedPrice, "$120.50")
        XCTAssertEqual(decoded.originalPrice, 150.0)
        XCTAssertEqual(decoded.formattedOriginalPrice, "$150.00")
        XCTAssertEqual(decoded.label, "Early Bird")
        XCTAssertEqual(decoded.fee, 5.0)
        XCTAssertEqual(decoded.description, "Front row")
    }

    func testInitFromJSON_withNumericFormattedPrice() throws {
        // Given
        let json = """
        {
            "formattedPrice": 120.5,
            "formattedOriginalPrice": 150.0
        }
        """.data(using: .utf8)!

        // When
        let decoded = try JSONDecoder().decode(SeatsioObjectPricing.self, from: json)

        // Then
        XCTAssertEqual(decoded.formattedPrice, "120.5")
        XCTAssertEqual(decoded.formattedOriginalPrice, "150.0")
    }
}
