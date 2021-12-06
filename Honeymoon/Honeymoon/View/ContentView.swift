import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTIES

    @State private var isShowingAlert = false
    @State private var isShowingGuideModal = false
    @State private var isShowingInfoModal = false

    // MARK: - BODY
    var body: some View {
        VStack {
            HeaderView(isShowingGuideView: $isShowingGuideModal, isShowingInfoView: $isShowingInfoModal)

            Spacer()

            CardView(destination: honeymoonData[3])
            // TODO: Add pading to cards
                .padding()

            Spacer()

            FooterView(showBookingAlert: $isShowingAlert)
        } //: VSTACK
        .alert(isPresented: $isShowingAlert) {
            Alert(
                title: Text("Success"),
                message: Text("Wishing a lovely and most precious of the times together for the amazing couple."),
                dismissButton: .default(Text("Happy Honeymoon!"))
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
