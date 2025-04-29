import Foundation

public struct Colors: Encodable {

    public let colorSelected: String?
    public let cursorTooltipBackgroundColor: String?
    public let colorTitle: String?
    public let availableObjectColor: String?
    public let selectedObjectColor: String?
    public let errorColor: String?

    public init(colorSelected: String? = nil, cursorTooltipBackgroundColor: String? = nil, colorTitle: String? = nil,
                availableObjectColor: String? = nil, selectedObjectColor: String? = nil, errorColor: String? = nil) {
        self.colorSelected = colorSelected
        self.cursorTooltipBackgroundColor = cursorTooltipBackgroundColor
        self.colorTitle = colorTitle
        self.availableObjectColor = availableObjectColor
        self.selectedObjectColor = selectedObjectColor
        self.errorColor = errorColor
    }
}
