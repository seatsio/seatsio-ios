import Foundation

class SeatingChart {

    let seatsioWebView: SeatsioWebView

    init(_ seatsioWebView: SeatsioWebView) {
        self.seatsioWebView = seatsioWebView
    }

    func selectObjects(_ objects: [String]) {
        seatsioWebView.bridge.call("selectObjects", data: objects)
    }

    func deselectObjects(_ objects: [String]) {
        seatsioWebView.bridge.call("deselectObjects", data: objects)
    }

    func getHoldtoken(_ callback: @escaping (String) -> ()) {
        seatsioWebView.bridge.call(
                "getHoldToken",
                data: nil,
                callback: { (response) in callback(response as! String) }
        )
    }

    func zoomToSelectedObjects() {
        seatsioWebView.bridge.call("zoomToSelectedObjects", data: nil)
    }

    func rerender() {
        seatsioWebView.bridge.call("rerender", data: nil)
    }

    func resetView() {
        seatsioWebView.bridge.call("resetView", data: nil)
    }

    func startNewSession() {
        seatsioWebView.bridge.call("startNewSession", data: nil)
    }

    func selectCategories(_ categories: [String]) {
        seatsioWebView.bridge.call("selectCategories", data: categories)
    }

    func deselectCategories(_ categories: [String]) {
        seatsioWebView.bridge.call("deselectCategories", data: categories)
    }

    func selectBestAvailable(_ bestAvailable: BestAvailable) {
        try! seatsioWebView.bridge.call("selectBestAvailable", data: toJsonString(AnyEncodable(value: bestAvailable)))
    }

    func changeConfig(_ configChange: ConfigChange) {
        try! seatsioWebView.bridge.call("changeConfig", data: toJsonString(AnyEncodable(value: configChange)))
    }

    func clearSelection(_ callback: @escaping () -> ()) {
        seatsioWebView.bridge.call(
                "clearSelection",
                data: nil,
                callback: { (response) in callback() }
        )
    }

    func listCategories(_ callback: @escaping ([Category]) -> ()) {
        seatsioWebView.bridge.call(
                "listCategories",
                data: nil,
                callback: { (response) in callback(decodeCategories(response!)) }
        )
    }

    func findObject(_ object: String, _ successCallback: @escaping (SeatsioObject) -> (), _ errorCallback: @escaping () -> ()) {
        seatsioWebView.bridge.call(
                "findObject",
                data: object,
                callback: { (response) in
                    if response == nil {
                        errorCallback()
                    } else {
                        successCallback(decodeSeatsioObject(response!))
                    }
                }
        )
    }

    func listSelectedObjects(_ callback: @escaping ([SeatsioObject]) -> ()) {
        seatsioWebView.bridge.call(
                "listSelectedObjects",
                data: nil,
                callback: { (response) in callback(decodeSeatsioObjects(response!)) }
        )
    }
}

func toJsonString(_ o: AnyEncodable) -> String {
    let data = try! JSONEncoder().encode(o)
    return String(data: data, encoding: .utf8)!
}
