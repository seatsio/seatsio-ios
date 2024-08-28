import Foundation

public class Style: Encodable {

    public let font: String?
    public let fontWeight: String?
    public let borderRadius: String?
    public let border: String?
    public let padding: String?
    public let buttonFace: String?

    public init(font: String? = nil, fontWeight: String? = nil, borderRadius: String? = nil, border: String? = nil, padding: String? = nil, buttonFace: String? = nil) {
        self.font = font
        self.fontWeight = fontWeight
        self.borderRadius = borderRadius
        self.border = border
        self.padding = padding
        self.buttonFace = buttonFace
    }
}
