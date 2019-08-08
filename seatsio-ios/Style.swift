import Foundation

public class Style: Encodable {

    var font: String?
    var fontWeight: String?
    var borderRadius: String?
    var border: String?
    var padding: String?
    var buttonFace: String?

    public func font(_ font: String) -> Self {
        self.font = font
        return self
    }

    public func fontWeight(_ fontWeight: String) -> Self {
        self.fontWeight = fontWeight
        return self
    }

    public func borderRadius(_ borderRadius: String) -> Self {
        self.borderRadius = borderRadius
        return self
    }

    public func border(_ border: String) -> Self {
        self.border = border
        return self
    }

    public func padding(_ padding: String) -> Self {
        self.padding = padding
        return self
    }

    public func buttonFace(_ buttonFace: String) -> Self {
        self.buttonFace = buttonFace
        return self
    }
}
