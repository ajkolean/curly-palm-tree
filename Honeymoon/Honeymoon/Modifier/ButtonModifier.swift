import SwiftUI

struct ButtonModifier: ViewModifier {

    // MARK: - BODY
    func body(content: Content) -> some View {
        content
            .font(.headline)
            .padding()
            .frame(minWidth: 0, maxWidth: .infinity)
            .background {
                Capsule().fill(.pink)
            }
            .foregroundColor(.white)
    }
}

extension View {
    func buttonModifier() -> some View {
        modifier(ButtonModifier())
    }
}

// MARK: - PREVIEW
struct ButtonModifier_Previews: PreviewProvider {
    static var previews: some View {
        Button(action: {}, label: {
            Text("Continue".uppercased())
                .buttonModifier()
        })
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
