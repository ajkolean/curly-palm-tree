import SwiftUI

struct ColorSchemeModifier: ViewModifier {
    func body(content: Content) -> some View {
        ForEach(ColorScheme.allCases, id: \.self) {
            content
                .preferredColorScheme($0)
        }
    }
}


extension View {
    func colorSchemes() -> some View {
        modifier(ColorSchemeModifier())
    }
}

