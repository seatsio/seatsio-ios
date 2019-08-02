import XCTest
@testable import seatsio_ios

class seatsio_iosTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

    func tooltipInfo() -> String {
        return "hello"
    }


    func testSeatsioConfig() {
        var config = SeatsioConfig(
                publicKey: "50652883-7b37-4310-9ea9-acfe954e30bf",
                event: "e2cbe498-b27a-4888-ac1d-6b40d29ec9ff"
        );
        //config.setTooltipInfo(fn: { (object: SeatsioObject) -> String in return "\(object.label!) asdasd" })
        var json = config.convertToString!

    }
}
