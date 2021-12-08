import SwiftUI

struct FormRowLinkView: View {
    // MARK: - PROPERTIES

    let icon: String
    let color: Color
    let text: String
    let link: String

    // MARK: - BODY
    var body: some View {
        HStack {
            ZStack {
                RoundedRectangle(cornerRadius: 8, style: .continuous)
                    .fill(color)

                Image(systemName: icon)
                    .imageScale(.large)
                    .foregroundColor(.white)
            }
            .frame(width: 36, height: 36, alignment: .center)

            Text(text).foregroundColor(.gray)

            Spacer()

            Button(action: {
                openLink()
            }, label: {
                Image(systemName: "chevron.right")
                    .font(.system(size: 14, weight: .semibold, design: .rounded))
            })
                .tint(Color(.systemGray2))
        }
    }

    // MARK: - HELPERS

    private func openLink() {
        guard let url = URL(string: link), UIApplication.shared.canOpenURL(url) else {
            return
        }
        UIApplication.shared.open(url as URL)
    }
}

// MARK: - PREVIEW
struct FormRowLinkView_Previews: PreviewProvider {
    static var previews: some View {
        FormRowLinkView(icon: "globe", color: .pink, text: "Website", link: "https://swiftuimasterclass.com")
            .previewLayout(.fixed(width: 375, height: 60))
            .padding()
    }
}
