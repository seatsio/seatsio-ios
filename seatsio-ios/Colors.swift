import Foundation

public class Colors: Encodable {

    var colorSelected: String?
    var cursorTooltipBackgroundColor: String?
    var colorTitle: String?

    public func colorSelected(_ colorSelected: String) -> Self {
        self.colorSelected = colorSelected
        return self
    }

    public func cursorTooltipBackgroundColor(_ cursorTooltipBackgroundColor: String) -> Self {
        self.cursorTooltipBackgroundColor = cursorTooltipBackgroundColor
        return self
    }

    public func colorTitle(_ colorTitle: String) -> Self {
        self.colorTitle = colorTitle
        return self
    }
}
