import Foundation

public struct Colors: Encodable {

    public let colorSelected: String?
    public let cursorTooltipBackgroundColor: String?
    public let colorTitle: String?

    public init(colorSelected: String? = nil, cursorTooltipBackgroundColor: String? = nil, colorTitle: String? = nil) {
        self.colorSelected = colorSelected
        self.cursorTooltipBackgroundColor = cursorTooltipBackgroundColor
        self.colorTitle = colorTitle
    }
}
