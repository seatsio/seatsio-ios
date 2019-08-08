import Foundation

class Style: Encodable {

    var font: String?
    var fontWeight: String?
    var borderRadius: String?
    var border: String?
    var padding: String?
    var buttonFace: String?

    func font(_ font: String) -> Self {
        self.font = font
        return self
    }

    func fontWeight(_ fontWeight: String) -> Self {
        self.fontWeight = fontWeight
        return self
    }

    func borderRadius(_ borderRadius: String) -> Self {
        self.borderRadius = borderRadius
        return self
    }

    func border(_ border: String) -> Self {
        self.border = border
        return self
    }

    func padding(_ padding: String) -> Self {
        self.padding = padding
        return self
    }

    func buttonFace(_ buttonFace: String) -> Self {
        self.buttonFace = buttonFace
        return self
    }
}
