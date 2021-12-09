import SwiftUI

struct SettingsView: View {
    // MARK: - PROPERTIES

    @Environment(\.presentationMode) private var presentationMode
    @EnvironmentObject var iconSettings: IconNames

    // MARK: - BODY
    var body: some View {
        NavigationView {
            VStack(alignment: .center, spacing: 0) {
                Form {

                    // MARK: - SECTION 1
                    Section(content: {
                        Picker(selection: $iconSettings.currentIndex) {
                            ForEach(0..<iconSettings.iconNames.count) { index in
                                HStack {
                                    Image(uiImage: UIImage(named: iconSettings.iconNames[index] ?? "Blue") ?? UIImage())
                                        .renderingMode(.original)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 44, height: 44)
                                        .cornerRadius(8)

                                    Spacer().frame(width: 8)

                                    Text(iconSettings.iconNames[index] ?? "Blue")
                                        .frame(alignment: .leading)
                                } //: HSTACK
                                .padding(3)
                            } //: LOOP
                        } label: {
                            HStack {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 8, style: .continuous)
                                        .strokeBorder(.primary, lineWidth: 2)
                                    Image(systemName: "paintbrush")
                                        .font(.system(size: 28, weight: .regular, design: .default))
                                        .foregroundColor(.primary)
                                } //: ZSTACK
                                .frame(width: 44, height: 44)

                                Text("App Icons".uppercased())
                                    .fontWeight(.bold)
                                    .foregroundColor(.primary)
                            } //: HSTACK
                        } //: PICKER
                        .onReceive([iconSettings.currentIndex].publisher.first()) { value in
                            let index = iconSettings.iconNames.firstIndex(of: UIApplication.shared.alternateIconName) ?? 0
                            if index != value {
                                UIApplication.shared.setAlternateIconName(iconSettings.iconNames[value]) { error in
                                    if let error = error {
                                        print(error.localizedDescription)
                                    } else {
                                        print("Success!")
                                    }
                                }
                            }
                        }

                    }, header: {
                        Text("Choose the app icon")
                    }) //: SECTION 1
                        .padding(.vertical, 3)

                    // MARK: - SECTION 3
                    Section(content: {
                        FormRowLinkView(icon: "globe", color: .pink, text: "Website", link: "https://swiftuimasterclass.com")
                        FormRowLinkView(icon: "link", color: .blue, text: "Twitter", link: "https://twitter.com/robertpetras")
                        FormRowLinkView(icon: "play.rectangle", color: .green, text: "Courses", link: "https://www.udemy.com/user/robert-petras")
                    }, header: {
                        Text("Follow use on social media")
                    }) //: SECTION 3
                        .padding(.vertical, 3)


                    // MARK: - SECTION 4
                    Section(content: {
                        FormRowStaticView(icon: "gear", firstText: "Application", secondText: "Todos")
                        FormRowStaticView(icon: "checkmark.seal", firstText: "Compatibility", secondText: "iPhone, iPad")
                        FormRowStaticView(icon: "keyboard", firstText: "Developer", secondText: "Andy Kolean")
                        FormRowStaticView(icon: "paintbrush", firstText: "Designer", secondText: "Robert Petras")
                        FormRowStaticView(icon: "flag", firstText: "Version", secondText: "1.0.0")
                    }, header: {
                        Text("About the application")
                    }) //: SECTION 4

                } //: FORM

                // MARK: - FOOTER
                Text("Copyright © All rights reserved.\nBetter Apps ♡ Less Code")
                    .multilineTextAlignment(.center)
                    .font(.footnote)
                    .padding(.top, 6)
                    .padding(.bottom, 8)
                    .foregroundColor(.secondary)

            } //: VSTACK
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Image(systemName: "xmark")
                    })
                }
            }
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.inline)
        } //: NAVIGATION
    }
}

// MARK: - PREVIEW
struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            .environmentObject(IconNames())
    }
}
