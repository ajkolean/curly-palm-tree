import SwiftUI

struct CreditsView: View {
    // MARK: - PROPERTIES

    // MARK: - BODY
    var body: some View {
        VStack(spacing: 3) {
            // PROFILE IMAGE
            Image("developer-no3")
                .resizable()
                .scaledToFit()
                .layoutPriority(1)

            // HEADER
            HeaderView(title: "Credits")

            // CONTENT
            Text("Andy Kolean")
                .foregroundColor(.primary)
                .fontWeight(.bold)

            Text("Developer")
                .font(.footnote)
                .foregroundColor(.secondary)
                .fontWeight(.light)
        } //: VSTACK
    }
}

// MARK: - PREVIEW
struct CreditsView_Previews: PreviewProvider {
    static var previews: some View {
        CreditsView()
    }
}
