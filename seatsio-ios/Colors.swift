import Foundation

class Colors: Encodable {

    var colorSelected: String?
    var cursorTooltipBackgroundColor: String?
    var colorTitle: String?

    func colorSelected(_ colorSelected: String) -> Self {
        self.colorSelected = colorSelected
        return self
    }

    func cursorTooltipBackgroundColor(_ cursorTooltipBackgroundColor: String) -> Self {
        self.cursorTooltipBackgroundColor = cursorTooltipBackgroundColor
        return self
    }

    func colorTitle(_ colorTitle: String) -> Self {
        self.colorTitle = colorTitle
        return self
    }
}
