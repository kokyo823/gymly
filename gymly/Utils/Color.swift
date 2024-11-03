import SwiftUI

struct ColorPalette {
    // Colors
    static let accent = Color(hex: "#f1f5f9")
    static let accentForeground = Color(hex: "#0f172a")
    static let background = Color(hex: "#ffffff")
    static let border = Color(hex: "#e2e8f0")
    static let card = Color(hex: "#ffffff")
    static let cardForeground = Color(hex: "#020617")
    static let destructive = Color(hex: "#ef4444")
    static let destructiveForeground = Color(hex: "#f8fafc")
    static let foreground = Color(hex: "#020617")
    static let hoverDestructive = Color(hex: "#dc2626")
    static let hoverPrimary = Color(hex: "#1e293b")
    static let hoverSecondary = Color(hex: "#e2e8f0")
    static let input = Color(hex: "#e2e8f0")
    static let muted = Color(hex: "#f1f5f9")
    static let mutedForeground = Color(hex: "#64748b")
    static let popover = Color(hex: "#ffffff")
    static let popoverForeground = Color(hex: "#020617")
    static let primary = Color(hex: "#4da0fe")
    static let primaryForeground = Color(hex: "#f8fafc")
    static let ring = Color(hex: "#64748b")
    static let secondary = Color(hex: "#f1f5f9")
    static let secondaryForeground = Color(hex: "#0f172a")
    
    // Radii
    static let radiusSmall: CGFloat = 4 // 0.25rem
    static let radiusMedium: CGFloat = 6 // 0.375rem
    static let radius: CGFloat = 8 // 0.5rem
}

extension Color {
    init(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")
        
        var rgb: UInt64 = 0
        Scanner(string: hexSanitized).scanHexInt64(&rgb)
        
        let red = Double((rgb >> 16) & 0xFF) / 255.0
        let green = Double((rgb >> 8) & 0xFF) / 255.0
        let blue = Double(rgb & 0xFF) / 255.0
        
        self.init(red: red, green: green, blue: blue)
    }
}
