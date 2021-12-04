import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTIES

    @State private var isShowingInfoView = false

    // MARK: - BODY
    var body: some View {
        ZStack {
            // MARK: - BACKGROUND
            LinearGradient(
                colors: [pinkColor, purpleColor],
                startPoint: .top,
                endPoint: .bottom
            )
                .edgesIgnoringSafeArea(.all)

            // MARK: - INTERFACE
            VStack(alignment: .center, spacing: 5) {
                // MARK: - HEADER
                LogoView()

                Spacer()

                // MARK: - SCORE
                HStack {
                    HStack {
                        Text("Your\nCoins".uppercased())
                            .scoreLabelStyle()
                            .multilineTextAlignment(.trailing)

                        Text("100")
                            .scoreNumberStyle()
                            .scoreNumberModifier()
                    } //: HSTACK
                    .scoreContainerModifier()

                    Spacer()

                    HStack {
                        Text("200")
                            .scoreNumberStyle()
                            .scoreNumberModifier()

                        Text("High\nScore".uppercased())
                            .scoreLabelStyle()
                            .multilineTextAlignment(.leading)

                    } //: HSTACK
                    .scoreContainerModifier()
                } //: HSTACK

                // MARK: - SLOT MACCHINE
                VStack(alignment: .center, spacing: 0) {
                    // MARK: - REEL #1
                    ZStack {
                        ReelView()
                        Image("gfx-bell")
                            .resizable()
                            .imageModifier()
                    } //: ZSTACK

                    HStack(alignment: .center, spacing: 0) {
                        // MARK: - REEL #2
                        ZStack {
                            ReelView()
                            Image("gfx-seven")
                                .resizable()
                                .imageModifier()
                        } //: ZSTACK

                        Spacer()

                        // MARK: - REEL #3
                        ZStack {
                            ReelView()
                            Image("gfx-cherry")
                                .resizable()
                                .imageModifier()
                        } //: ZSTACK
                    } //: HSTACK
                    .frame(maxWidth: 500)

                    // MARK: - SPIN BUTTON
                    Button(action: {
                        print("Spin the reels")
                    }, label: {
                        Image("gfx-spin")
                            .renderingMode(.original)
                            .resizable()
                            .imageModifier()
                    })

                } //: VSTACK
                .layoutPriority(2)

                // MARK: - FOOTER
                Spacer()

                HStack {
                    // MARK: - BET 20
                    HStack(alignment: .center, spacing: 10) {
                        Button(action: {
                            print("Bet 20 coins")
                        }, label: {
                            Text("20")
                                .fontWeight(.heavy)
                                .foregroundColor(.white)
                                .betNumberModifier()
                        }) //: BUTTON
                            .betCapsuleModifier()

                        Image("gfx-casino-chips")
                            .resizable()
                            .opacity(0)
                            .casinoChipsModifier()
                    } // HSTACK

                    // MARK: - BET 10
                    HStack(alignment: .center, spacing: 10) {
                        Image("gfx-casino-chips")
                            .resizable()
                            .opacity(1)
                            .casinoChipsModifier()

                        Button(action: {
                            print("Bet 10 coins")
                        }, label: {
                            Text("10")
                                .fontWeight(.heavy)
                                .foregroundColor(.yellow)
                                .betNumberModifier()
                        }) //: BUTTON
                            .betCapsuleModifier()

                    } // HSTACK
                } //: HSTACK

            } //: VSTACK
            // MARK: - BUTTONS
            .overlay(
                // RESET
                Button(action: {
                    print("reset the game")
                }, label: {
                    Image(systemName: "arrow.2.circlepath.circle")
                })
                    .buttonModifier(),
                alignment: .topLeading
            )
            .overlay(
                // INFO
                Button(action: {
                    isShowingInfoView = true
                }, label: {
                    Image(systemName: "info.circle")
                })
                    .buttonModifier(),
                alignment: .topTrailing
            )
            .padding()
            .frame(maxWidth: 720)

            // MARK: - POPUP
        } //: ZSTACK
        .sheet(isPresented: $isShowingInfoView) {
            InfoView()
        }
    }
}

// MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
