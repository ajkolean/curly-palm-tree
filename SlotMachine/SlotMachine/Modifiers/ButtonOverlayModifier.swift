import SwiftUI

struct ButtonOverlayModifier: ViewModifier {
    // MARK: - PROPERTIES
    let didTapReset: (() -> Void)?
    let didTapInfo: (() -> Void)?

    // MARK: - BODY
    func body(content: Content) -> some View {
        content
            .overlay(
                // RESET
                Button(action: {
                    didTapReset?()
                }, label: {
                    Image(systemName: "arrow.2.circlepath.circle")
                })
                    .buttonModifier(),
                alignment: .topLeading
            )
            .overlay(
                // INFO
                Button(action: {
                    didTapInfo?()
                }, label: {
                    Image(systemName: "info.circle")
                })
                    .buttonModifier(),
                alignment: .topTrailing
            )
            .padding()
            .frame(maxWidth: 720)
    }
}

extension View {
    func buttonOverlayModifier(didTapReset: (() -> Void)?, didTapInfo: (() -> Void)?) -> some View {
        modifier(ButtonOverlayModifier(didTapReset: didTapReset, didTapInfo: didTapInfo))
    }
}

// MARK: - PREVEIW
struct ButtonOverlayModifier_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundGradientView {
            Text("Hello World")
        }
        .buttonOverlayModifier(didTapReset: nil, didTapInfo: nil)
    }
}
