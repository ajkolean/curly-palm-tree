import SwiftUI

struct SymbolModifier: ViewModifier {
    // MARK: - BODY
    func body(content: Content) -> some View {
        content
            .foregroundColor(.white)
            .font(.system(size: 128))
            .shadow(color: Color(UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)), radius: 12, x: 0, y: 0)
    }
}

extension View {
    func symbolModifier() -> some View {
        modifier(SymbolModifier())
    }
}

// MARK: - PREVIEW
struct SymbolModifier_Previews: PreviewProvider {
    static var previews: some View {
        Image(systemName: "x.circle")
            .symbolModifier()
            .previewLayout(.sizeThatFits)
            .background(.black)
    }
}
