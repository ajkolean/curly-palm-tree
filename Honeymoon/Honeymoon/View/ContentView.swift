import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTIES

    @State private var isShowingAlert = false
    @State private var isShowingGuideModal = false
    @State private var isShowingInfoModal = false
    @GestureState private var dragState = DragState.inactive

    // MARK: - CARD VIEWS

    var cardViews: [CardView] = honeymoonData[0..<2].map { CardView(destination: $0) }

    // MARK: - DRAG STATES

    enum DragState: Equatable {
        case inactive
        case pressing
        case dragging(translation: CGSize)

        var translation: CGSize {
            switch self {
            case .inactive, .pressing:
                return .zero
            case .dragging(let translation):
                return translation
            }
        }

        var isDragging: Bool {
            switch self {
            case .dragging:
                return true
            case .inactive, .pressing:
                return false
            }
        }

        var isPressing: Bool {
            switch self {
            case .pressing, .dragging:
                return true
            case .inactive:
                return false
            }
        }
    }

    // MARK: - BODY
    var body: some View {
        VStack {
            // MARK: - HEADER
            HeaderView(isShowingGuideView: $isShowingGuideModal, isShowingInfoView: $isShowingInfoModal)
                .opacity(dragState.isDragging ? 0.0 : 1.0)
                .animation(.default, value: dragState)

            Spacer()

            // MARK: - CARDS
            ZStack {
                ForEach(cardViews.reversed()) { cardView in
                    cardView
                        .gesture(
                            LongPressGesture(minimumDuration: 0.01)
                                .sequenced(before: DragGesture())
                                .updating($dragState) { value, state, transaction in
                                    switch value {
                                    case .first(true):
                                        state = .pressing
                                    case .second(true, let drag):
                                        state = .dragging(translation: drag?.translation ?? .zero)
                                    default:
                                        break
                                    }
                                }
                        )
                }
            }
            .padding(.horizontal)

            Spacer()

            // MARK: - FOOTER
            FooterView(showBookingAlert: $isShowingAlert)
                .opacity(dragState.isDragging ? 0.0 : 1.0)
                .animation(.default, value: dragState)
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
