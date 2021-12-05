import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTIES
    let symbols = ["gfx-bell", "gfx-cherry", "gfx-coin", "gfx-grape", "gfx-seven", "gfx-strawberry"]

    @State private var highScore = 0
    @State private var coins = 100
    @State private var betAmount = 10
    @State private var reels = [0, 1, 2]
    @State private var isShowingInfoView = false

    private var isActiveBet10: Bool {
        betAmount == 10
    }

    private var isActiveBet20: Bool {
        betAmount == 20
    }

    private var isShowingModal: Bool {
        coins <= 0
    }
    

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

                        Text("\(coins)")
                            .scoreNumberStyle()
                            .scoreNumberModifier()
                    } //: HSTACK
                    .scoreContainerModifier()

                    Spacer()

                    HStack {
                        Text("\(highScore)")
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
                        Image(symbols[reels[0]])
                            .resizable()
                            .imageModifier()
                    } //: ZSTACK

                    HStack(alignment: .center, spacing: 0) {
                        // MARK: - REEL #2
                        ZStack {
                            ReelView()
                            Image(symbols[reels[1]])
                                .resizable()
                                .imageModifier()
                        } //: ZSTACK

                        Spacer()

                        // MARK: - REEL #3
                        ZStack {
                            ReelView()
                            Image(symbols[reels[2]])
                                .resizable()
                                .imageModifier()
                        } //: ZSTACK
                    } //: HSTACK
                    .frame(maxWidth: 500)

                    // MARK: - SPIN BUTTON
                    Button(action: {
                        spinReels()
                        checkWinning()
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
                            activateBet20()
                        }, label: {
                            Text("20")
                                .fontWeight(.heavy)
                                .foregroundColor(isActiveBet20 ? yellowColor : .white)
                                .betNumberModifier()
                        }) //: BUTTON
                            .betCapsuleModifier()

                        Image("gfx-casino-chips")
                            .resizable()
                            .opacity(isActiveBet20 ? 1 : 0)
                            .casinoChipsModifier()
                    } // HSTACK

                    // MARK: - BET 10
                    HStack(alignment: .center, spacing: 10) {
                        Image("gfx-casino-chips")
                            .resizable()
                            .opacity(isActiveBet10 ? 1 : 0)
                            .casinoChipsModifier()

                        Button(action: {
                            activateBet10()
                        }, label: {
                            Text("10")
                                .fontWeight(.heavy)
                                .foregroundColor(isActiveBet10 ? yellowColor : .white)
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
            .blur(radius: isShowingModal ? 5 : 0, opaque: false)

            // MARK: - POPUP
            if isShowingModal {
                ZStack {
                    shadowColor.edgesIgnoringSafeArea(.all)

                    // MODAL
                    VStack(spacing: 0) {
                        Text("GAME OVER")
                            .font(.system(.title, design: .rounded))
                            .fontWeight(.heavy)
                            .padding()
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .background(pinkColor)
                            .foregroundColor(.white)

                        Spacer()

                        // MESAAGE
                        VStack(alignment: .center, spacing: 16) {
                            Image("gfx-seven-reel")
                                .resizable()
                                .scaledToFit()
                                .frame(maxHeight: 72)

                            Text("Bad luck! You lost all of the coins. \nLet's play again!")
                                .font(.system(.body, design: .rounded))
                                .lineLimit(2)
                                .multilineTextAlignment(.center)
                                .foregroundColor(.gray)
                                .layoutPriority(1)

                            Button(action: {
                                coins = 100
                            }, label: {
                                Text("New Game".uppercased())
                                    .font(.system(.body, design: .rounded))
                                    .fontWeight(.semibold)
                                    .tint(pinkColor)
                                    .padding(.horizontal, 12)
                                    .padding(.vertical, 8)
                                    .frame(minWidth: 128)
                                    .background(
                                        Capsule()
                                            .strokeBorder(lineWidth: 1.75)
                                            .foregroundColor(pinkColor)
                                    )
                            }) //: BUTTON
                        }

                        Spacer()
                    } //: VSTACK
                    .frame(
                        minWidth: 280,
                        idealWidth: 280,
                        maxWidth: 320,
                        minHeight: 260,
                        idealHeight: 280,
                        maxHeight: 320,
                        alignment: .center
                    )
                    .background(.white)
                    .cornerRadius(20)
                    .shadow(color: shadowColor, radius: 6, x: 0, y: 8)
                } //: ZSTACK
            }

        } //: ZSTACK
        .sheet(isPresented: $isShowingInfoView) {
            InfoView()
        }
    }

    // MARK: - Helpers

    private func spinReels() {
        reels = reels.map { _ in
            Int.random(in: 0...symbols.count - 1)
        }
    }

    // CHECK THE WINNING
    private func checkWinning() {
        if Set(reels).count == 1 {
            playerWins()
            if coins > highScore {
                newHighScore()
            }
        } else {
            playerLoses()
        }
    }

    private func playerWins() {
        coins += betAmount * 10
    }

    private func newHighScore() {
        highScore = coins
    }

    private func playerLoses() {
        coins -= betAmount
    }

    private func activateBet20() {
        betAmount = 20
    }

    private func activateBet10() {
        betAmount = 10
    }
}

// MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
