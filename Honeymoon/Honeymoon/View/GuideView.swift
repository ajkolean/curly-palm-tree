import SwiftUI

struct GuideView: View {
    // MARK: - PROPERTIES

    @Environment(\.presentationMode) private var presentationMode

    // MARK: - BODY
    var body: some View {
        GeometryReader { geometry in
            ScrollView(showsIndicators: false) {
                VStack(alignment: .center, spacing: 20) {
                    HeaderComponentView()
                    Spacer(minLength: 10)
                        .frame(maxHeight: 20)

                    Text("Get Started!")
                        .fontWeight(.black)
                        .titleModifier()

                    Text("Discover and pick the perfect destination for your romantic Honeymoon!")
                        .lineLimit(nil)
                        .multilineTextAlignment(.center)

                    Spacer(minLength: 10)
                        .frame(maxHeight: 20)

                    VStack(alignment: .leading, spacing: 25) {
                        GuideComponentView(
                            title: "Like",
                            subtitle: "Swipe right",
                            description: "Do you like this destination? Touch the screen and swipe right. It will be saved to the favorites.",
                            icon: "heart.circle"
                        )
                        GuideComponentView(
                            title: "Dismiss",
                            subtitle: "Swipe left",
                            description: "Would you rather skip this place? Touch the screen and swipe left. You will no longer see it.",
                            icon: "xmark.circle"
                        )
                        GuideComponentView(
                            title: "Book",
                            subtitle: "Tap the button",
                            description: "Our selection of honeymoon restorts is the perfect setting for you to embark your new life together.",
                            icon: "checkmark.square"
                        )
                    } //: VSTACK

                    Spacer(minLength: 10)

                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Text("Continue".uppercased())
                            .buttonModifier()
                    })

                } //: VSTACK
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: geometry.size.height - 40)
                .padding(.top, 15)
                .padding(.bottom, 25)
                .padding(.horizontal, 25)
            } //: SCROLL
        } //: GEOMETRY
    }
}

// MARK: - PREVIEW
struct GuideView_Previews: PreviewProvider {
    static var previews: some View {
        GuideView()
    }
}
