import XCTest
@testable import Seatsio

final class BestAvailableForHoldingTests: XCTestCase {

    func testEncodesWithAllFields() throws {
        let bestAvailable = BestAvailableForHolding(
            number: 3,
            categories: ["cat1", "cat2"],
            zone: "zone1",
            sections: ["section1", "section2"],
            accessibleSeats: 2,
            ticketTypes: ["adult": 2, "child": 1]
        )

        let data = try JSONEncoder().encode(bestAvailable)
        let json = try JSONSerialization.jsonObject(with: data) as! [String: Any]

        XCTAssertEqual(json["number"] as? Int, 3)
        XCTAssertEqual(json["categories"] as? [String], ["cat1", "cat2"])
        XCTAssertEqual(json["zone"] as? String, "zone1")
        XCTAssertEqual(json["sections"] as? [String], ["section1", "section2"])
        XCTAssertEqual(json["accessibleSeats"] as? Int, 2)
        XCTAssertEqual(json["ticketTypes"] as? [String: Int], ["adult": 2, "child": 1])
    }

    func testEncodesWithOnlyNumber() throws {
        let bestAvailable = BestAvailableForHolding(number: 5)

        let data = try JSONEncoder().encode(bestAvailable)
        let json = try JSONSerialization.jsonObject(with: data) as! [String: Any]

        XCTAssertEqual(json["number"] as? Int, 5)
        XCTAssertNil(json["categories"])
        XCTAssertNil(json["zone"])
        XCTAssertNil(json["sections"])
        XCTAssertNil(json["accessibleSeats"])
        XCTAssertNil(json["ticketTypes"])
    }

    func testDecodesFromJSON() throws {
        let json = """
        {
            "number": 3,
            "categories": ["cat1", "cat2"],
            "zone": "zone1",
            "sections": ["section1"],
            "accessibleSeats": 2,
            "ticketTypes": {"adult": 2}
        }
        """.data(using: .utf8)!

        let decoded = try JSONDecoder().decode(BestAvailableForHolding.self, from: json)

        XCTAssertEqual(decoded.number, 3)
        XCTAssertEqual(decoded.categories, ["cat1", "cat2"])
        XCTAssertEqual(decoded.zone, "zone1")
        XCTAssertEqual(decoded.sections, ["section1"])
        XCTAssertEqual(decoded.accessibleSeats, 2)
        XCTAssertEqual(decoded.ticketTypes, ["adult": 2])
    }

    func testDecodesBestAvailableHeldResult() throws {
        let json = """
        {
            "objects": ["A-1", "A-2", "A-3"],
            "nextToEachOther": true
        }
        """.data(using: .utf8)!

        let decoded = try JSONDecoder().decode(BestAvailableHeldResult.self, from: json)

        XCTAssertEqual(decoded.objects, ["A-1", "A-2", "A-3"])
        XCTAssertEqual(decoded.nextToEachOther, true)
    }

    func testDecodesBestAvailableHeldResultWithoutNextToEachOther() throws {
        let json = """
        {
            "objects": ["A-1"]
        }
        """.data(using: .utf8)!

        let decoded = try JSONDecoder().decode(BestAvailableHeldResult.self, from: json)

        XCTAssertEqual(decoded.objects, ["A-1"])
        XCTAssertNil(decoded.nextToEachOther)
    }

    func testDecodesBestAvailableHoldFailedResult() throws {
        let json = """
        {
            "message": "Not enough seats available"
        }
        """.data(using: .utf8)!

        let decoded = try JSONDecoder().decode(BestAvailableHoldFailedResult.self, from: json)

        XCTAssertEqual(decoded.message, "Not enough seats available")
    }
}
