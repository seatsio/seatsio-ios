import Foundation

public class SeatingChart {

    let seatsioWebView: SeatsioWebView

    public init(_ seatsioWebView: SeatsioWebView) {
        self.seatsioWebView = seatsioWebView
    }

    public func selectObjects(_ objects: [String]) {
        seatsioWebView.bridge.call("selectObjects", data: objects)
    }

    public func deselectObjects(_ objects: [String]) {
        seatsioWebView.bridge.call("deselectObjects", data: objects)
    }

    public func getHoldtoken(_ callback: @escaping (String?) -> ()) {
        seatsioWebView.bridge.call(
                "getHoldToken",
                data: nil,
                callback: { (response) in callback(nullToNil(value: response) as? String) }
        )
    }

    public func zoomToSelectedObjects() {
        seatsioWebView.bridge.call("zoomToSelectedObjects", data: nil)
    }

    public func rerender() {
        seatsioWebView.bridge.call("rerender", data: nil)
    }

    public func resetView() {
        seatsioWebView.bridge.call("resetView", data: nil)
    }

    public func startNewSession() {
        seatsioWebView.bridge.call("startNewSession", data: nil)
    }

    public func selectCategories(_ categories: [String]) {
        seatsioWebView.bridge.call("selectCategories", data: categories)
    }

    public func deselectCategories(_ categories: [String]) {
        seatsioWebView.bridge.call("deselectCategories", data: categories)
    }

    public func selectBestAvailable(_ bestAvailable: BestAvailable) {
        seatsioWebView.bridge.call("selectBestAvailable", data: toJsonString(AnyEncodable(value: bestAvailable)))
    }

    public func changeConfig(_ configChange: ConfigChange) {
        seatsioWebView.bridge.call("changeConfig", data: toJsonString(AnyEncodable(value: configChange)))
    }

    public func clearSelection(_ callback: @escaping () -> ()) {
        seatsioWebView.bridge.call(
                "clearSelection",
                data: nil,
                callback: { (response) in callback() }
        )
    }

    public func listCategories(_ callback: @escaping ([Category]) -> ()) {
        seatsioWebView.bridge.call(
                "listCategories",
                data: nil,
                callback: { (response) in callback(decodeCategories(response!)) }
        )
    }

    public func findObject(_ object: String, _ successCallback: @escaping (SeatsioObject) -> (), _ errorCallback: @escaping () -> ()) {
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

    public func listSelectedObjects(_ callback: @escaping ([SeatsioObject]) -> ()) {
        seatsioWebView.bridge.call(
                "listSelectedObjects",
                data: nil,
                callback: { (response) in callback(decodeSeatsioObjects(response!)) }
        )
    }

    func selectObject(_ label: String, _ ticketType: String?) {
        seatsioWebView.bridge.call("selectObject", data: ["label": label, "ticketType": ticketType])
    }

    func deselectObject(_ label: String, _ ticketType: String?) {
        seatsioWebView.bridge.call("deselectObject", data: ["label": label, "ticketType": ticketType])
    }

    func pulseObject(_ label: String) {
        seatsioWebView.bridge.call("pulseObject", data: label)
    }

    func unpulseObject(_ label: String) {
        seatsioWebView.bridge.call("unpulseObject", data: label)
    }

    func isObjectInChannel(_ label: String, _ channel: String, _ callback: @escaping (Bool) -> ()) {
        seatsioWebView.bridge.call("isObjectInChannel", data: ["label": label, "channel": channel], callback: { (response) in callback((response as? Bool)!) })
    }
}

func toJsonString(_ o: AnyEncodable) -> String {
    let data = try! JSONEncoder().encode(o)
    return String(data: data, encoding: .utf8)!
}

func nullToNil(value: Any?) -> Any? {
    if value is NSNull {
        return nil
    } else {
        return value
    }
}
