import SwiftUI

struct HeaderComponentView: View {

    // MARK: - BODY
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            Capsule()
                .frame(width: 120, height: 6)
                .foregroundColor(.secondary)
                .opacity(0.2)

            Image("logo-honeymoon")
                .resizable()
                .scaledToFit()
                .frame(height: 28)
        }
    }
}

// MARK: - PREVIEW
struct HeaderComponentView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderComponentView()
            .previewLayout(.fixed(width: 375, height: 128))
    }
}
