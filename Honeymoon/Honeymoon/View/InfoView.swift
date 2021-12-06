import SwiftUI

struct InfoView: View {

    // MARK: - BODY
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 20) {
                HeaderComponentView()

                Spacer(minLength: 10)

                Text("App Info")
                    .fontWeight(.bold)
                    .titleModifier()

                AppInfoView()

                Text("Credits")
                    .fontWeight(.black)
                    .titleModifier()

                CreditsView()

                Spacer(minLength: 10)

                Button(action: {
                    print("tapped button")
                }, label: {
                    Text("Continue".uppercased())
                        .buttonModifier()
                }) //: BUTTON
                
            } //: VSTACK
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding(.top, 15)
            .padding(.bottom, 25)
            .padding(.horizontal, 25)
        } //: SCROLL
    }
}

struct AppInfoView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            RowAppInfoView(itemOne: "Application", itemTwo: "Honeymoon")
            RowAppInfoView(itemOne: "Compatibility", itemTwo: "iPhone & iPad")
            RowAppInfoView(itemOne: "Developer", itemTwo: "Andy Kolean")
            RowAppInfoView(itemOne: "Designer", itemTwo: "Robert Petras")
            RowAppInfoView(itemOne: "Website", itemTwo: "swiftuimasterclass.com")
            RowAppInfoView(itemOne: "Version", itemTwo: "1.0.0")
        } //: VSTAC
    }
}

struct RowAppInfoView: View {
    // MARK: - PROPERTIES
    let itemOne: String
    let itemTwo: String

    // MARK: - BODY
    var body: some View {
        VStack {
            HStack {
                Text(itemOne).foregroundColor(.gray)
                Spacer()
                Text(itemTwo)
            }
            Divider()
        }
    }
}

struct CreditsView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            RowAppInfoView(itemOne: "Photos", itemTwo: "Unsplash")

            Text("Photographers").foregroundColor(.gray)

            Text("Shifaaz Shamoon (Maldives), Grillot Edouard (France), Evan Wise (Greece), Christoph Schulz (United Arab Emirates), Andrew Coelho (USA), Damiano Baschiera (Italy), Daniel Olah (Hungary), Andrzej Rusinowski (Poland), Lucas Miguel (Slovenia), Florencia Potter (Spain), Ian Simmonds (USA), Ian Keefe (Canada), Denys Nevozhai (Thailand), David Köhler (Italy), Andre Benz (USA), Alexandre Chambon (South Korea), Roberto Nickson (Mexico), Ajit Paul Abraham (UK), Jeremy Bishop (USA), Davi Costa (Brazil), Liam Pozz (Australia)")
                .multilineTextAlignment(.leading)
                .font(.footnote)
        }
    }
}

// MARK: - PREVIEW
struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}