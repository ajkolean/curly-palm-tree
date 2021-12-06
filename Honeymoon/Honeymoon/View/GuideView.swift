import SwiftUI

struct GuideView: View {

    // MARK: - BODY
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .center, spacing: 20) {
                HeaderComponentView()
                Spacer(minLength: 10)
                Text("Get Started!")
                    .fontWeight(.black)
                    .font(.largeTitle)
                    .foregroundColor(.pink)

                Text("Discover and pick the perfect destination for your romantic Honeymoon!")
                    .lineLimit(nil)
                    .multilineTextAlignment(.center)

                Spacer(minLength: 10)

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
                    print("button tapped")
                }, label: {
                    Text("Continue".uppercased())
                        .font(.headline)
                        .padding()
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .background {
                            Capsule().fill(.pink)
                        }
                        .foregroundColor(.white)
                })

            } //: VSTACK
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding(.top, 15)
            .padding(.bottom, 25)
            .padding(.horizontal, 25)
        }
    }
}

// MARK: - PREVIEW
struct GuideView_Previews: PreviewProvider {
    static var previews: some View {
        GuideView()
    }
}
