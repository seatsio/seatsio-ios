import XCTest
@testable import Seatsio

final class SeatsioObjectPricingTests: XCTestCase {

    func testInitFromJSON_withStringFormattedPrice() throws {
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

        let decoded = try JSONDecoder().decode(SeatsioObjectPricing.self, from: json)

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
        let json = """
        {
                    "formattedPrice": 120.5,
                    "formattedOriginalPrice": 150.0
                }
        """.data(using: .utf8)!

        let decoded = try JSONDecoder().decode(SeatsioObjectPricing.self, from: json)

        XCTAssertEqual(decoded.formattedPrice, "120.5")
        XCTAssertEqual(decoded.formattedOriginalPrice, "150.0")
    }

    func testInitFromJSON_withoutFormattedPriceFields() throws {
        let json = """
        {
                    "ticketType": "Standard",
                    "price": 90.0,
                    "originalPrice": 100.0
                }
        """.data(using: .utf8)!

        let decoded = try JSONDecoder().decode(SeatsioObjectPricing.self, from: json)

        XCTAssertEqual(decoded.ticketType, "Standard")
        XCTAssertEqual(decoded.price, 90.0)
        XCTAssertEqual(decoded.originalPrice, 100.0)
        XCTAssertNil(decoded.formattedPrice)
        XCTAssertNil(decoded.formattedOriginalPrice)
    }

    func testInitFromJSON_onlyFormattedPricePresent() throws {
        let json = """
        {
                    "formattedPrice": "$45.00"
                }
        """.data(using: .utf8)!

        let decoded = try JSONDecoder().decode(SeatsioObjectPricing.self, from: json)

        XCTAssertEqual(decoded.formattedPrice, "$45.00")
        XCTAssertNil(decoded.formattedOriginalPrice)
        XCTAssertNil(decoded.price)
        XCTAssertNil(decoded.originalPrice)
    }

    func testInitFromJSON_onlyFormattedOriginalPricePresent() throws {
        let json = """
        {
                    "formattedOriginalPrice": "$150.00"
                }
        """.data(using: .utf8)!

        let decoded = try JSONDecoder().decode(SeatsioObjectPricing.self, from: json)

        XCTAssertNil(decoded.formattedPrice)
        XCTAssertEqual(decoded.formattedOriginalPrice, "$150.00")
        XCTAssertNil(decoded.price)
        XCTAssertNil(decoded.originalPrice)
    }
}
