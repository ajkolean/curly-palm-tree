import SwiftUI

struct BackgroundGradientView<Content: View>: View {
    // MARK: - PROPERTIES
    @ViewBuilder let content: Content

    // MARK: - BODY
    var body: some View {
        ZStack {
            // MARK: - BACKGROUND
            LinearGradient(
                colors: [pinkColor, purpleColor],
                startPoint: .top,
                endPoint: .bottom
            )
                .edgesIgnoringSafeArea(.all)
            content
        }
    }
}

// MARK: - PREVIEW
struct BackgroundGradientView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundGradientView {
            Text("Hello World")
                .foregroundColor(.white)
        }
    }
}
