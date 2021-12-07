import SwiftUI

struct HeaderView: View {
    // MARK: - PROPERTIES

    @Binding var isShowingGuideView: Bool
    @Binding var isShowingInfoView: Bool
    let haptics = UINotificationFeedbackGenerator()

    // MARK: - BODY
    var body: some View {
        HStack {
            Button(action: {
                isShowingInfoView.toggle()
                playSound(sound: "sound-click", type: "mp3")
                haptics.notificationOccurred(.success)
            }, label: {
                Image(systemName: "info.circle")
                    .font(.system(size: 24, weight: .regular))
            }) //: BUTTON
                .sheet(isPresented: $isShowingInfoView) {
                    InfoView()
                }

            Spacer()

            Image("logo-honeymoon-pink")
                .resizable()
                .scaledToFit()
                .frame(height: 28)

            Spacer()

            Button(action: {
                isShowingGuideView.toggle()
                playSound(sound: "sound-click", type: "mp3")
                haptics.notificationOccurred(.success)
            }, label: {
                Image(systemName: "questionmark.circle")
                    .font(.system(size: 24, weight: .regular))
            }) //: BUTTON
                .sheet(isPresented: $isShowingGuideView) {
                    GuideView()
                }
        } //: HSTACK
        .padding()
    }
}

// MARK: - PREVIEW
struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(isShowingGuideView: .constant(false), isShowingInfoView: .constant(false))
            .previewLayout(.fixed(width: 375, height: 80))
    }
}
