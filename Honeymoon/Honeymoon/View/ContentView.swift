import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTIES

    @State private var isShowingAlert = false
    @State private var isShowingGuideModal = false
    @State private var isShowingInfoModal = false

    // MARK: - CARD VIEWS

    var cardViews: [CardView] {
        honeymoonData[0..<2].reversed().map { CardView(destination: $0) }
    }

    // MARK: - BODY
    var body: some View {
        VStack {
            // MARK: - HEADER
            HeaderView(isShowingGuideView: $isShowingGuideModal, isShowingInfoView: $isShowingInfoModal)

            Spacer()

            // MARK: - CARDS
            ZStack {
                ForEach(cardViews) { cardView in
                    cardView
//                        .zIndex(isTopCard(cardView: cardView) ? 1 : 0)
                }
            }
            .padding(.horizontal)

            Spacer()

            // MARK: - FOOTER
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

    // MARK: - HELPERS
    private func isTopCard(cardView: CardView) -> Bool {
        guard let index = cardViews.firstIndex(where: { $0.id == cardView.id }) else {
            return false
        }
        return index == 0
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
