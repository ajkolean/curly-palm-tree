import SwiftUI

struct SettingsRowView: View {
    // MARK: - PROPERTIES

    let name: String
    var content: String? = nil
    var linkLabel: String? = nil
    var linkDestination: String? = nil


    // MARK: - BODY
    var body: some View {
        VStack {
            Divider().padding(.vertical, 4)

            HStack {
                Text(name).foregroundColor(.gray)
                Spacer()
                if let content = content {
                    Text(content)
                } else if let label = linkLabel, let destination = linkDestination {
                    Link(label, destination: URL(string: "https://\(destination)")!)
                    Image(systemName: "arrow.up.right.square").foregroundColor(.pink)
                } else {
                    EmptyView()
                }
            }
        }
    }
}

// MARK: - PREVIEW
struct SettingsRowView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SettingsRowView(name: "Developer", content: "Andy")
                .previewLayout(.fixed(width: 375, height: 60))
            .padding()
            SettingsRowView(name: "Website", linkLabel: "SWiftUI Masterclass", linkDestination: "swiftuimasterclass.com")
                .preferredColorScheme(.dark)
                .previewLayout(.fixed(width: 375, height: 60))
                .padding()
        }
    }
}
