import SwiftUI

struct TitleModifier: ViewModifier {

    // MARK: - BODY
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.pink)
    }
}

// MARK: - PREVIEW
struct TitleModifier_Previews: PreviewProvider {
    static var previews: some View {
        Text("Hello World")
            .modifier(TitleModifier())
            .previewLayout(.sizeThatFits)
            .padding()
    }
}

extension View {
    func titleModifier() -> some View {
        modifier(TitleModifier())
    }
}
