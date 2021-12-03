import SwiftUI

struct SettingsView: View {
    // MARK: - PROPERTIES

    @State private var isNotifcationEnabled = true
    @State private var isBackgroundRefreshEnabled = true

    // MARK: - BODY
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            // MARK: - HEADER
            VStack(alignment: .center, spacing: 5) {
                Image("avocado")
                    .resizable()
                    .scaledToFit()
                    .padding(.top)
                    .frame(width: 100, height: 100, alignment: .center)
                    .shadow(color: Color("ColorBlackTransparentLight"), radius: 8, x: 0, y: 4)

                Text("Avocados".uppercased())
                    .font(.system(.title, design: .serif))
                    .fontWeight(.bold)
                    .foregroundColor(Color("ColorGreenAdaptive"))
            } //: VSTACK
            .padding()

            Form {
                // SECTION 1
                Section(header: Text("General Settings")) {
                    Toggle(isOn: $isNotifcationEnabled) {
                        Text("Enable notification")
                    }
                    Toggle(isOn: $isBackgroundRefreshEnabled) {
                        Text("Background refresh")
                    }
                } //: SECTION

                // SECTION 2
                Section(header: Text("Application")) {
                    if isNotifcationEnabled {
                        HStack {
                            Text("Product")
                                .foregroundColor(.gray)
                            Spacer()
                            Text("Avocado Recipes")
                        }
                        HStack {
                            Text("Compatibility")
                                .foregroundColor(.gray)
                            Spacer()
                            Text("iPhone & iPad")
                        }
                        HStack {
                            Text("Developer")
                                .foregroundColor(.gray)
                            Spacer()
                            Text("Andy Kolean")
                        }
                        HStack {
                            Text("Website")
                                .foregroundColor(.gray)
                            Spacer()
                            Text("swiftuimasterclass.com")
                        }
                        HStack {
                            Text("Version")
                                .foregroundColor(.gray)
                            Spacer()
                            Text("1.0.0")
                        }
                    } else {
                        HStack {
                            Text("Personal message")
                                .foregroundColor(.gray)
                            Spacer()
                            Text("Happy Coding")
                        }
                    }
                } //: SECTION
            } //: FORM
        } //: VSTACK
        .frame(maxWidth: 640)
        .ignoresSafeArea(edges: [.leading, .trailing])
    }
}

// MARK: - PREVIEW
struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
