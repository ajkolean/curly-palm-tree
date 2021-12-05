import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTIES
    let symbols = ["gfx-bell", "gfx-cherry", "gfx-coin", "gfx-grape", "gfx-seven", "gfx-strawberry"]

    @AppStorage("highScore") var highScore = 0

    @State private var coins = 100
    @State private var betAmount = 10
    @State private var reels = [0, 1, 2]
    @State private var isShowingInfoView = false
    @State private var isSymbolAnimating = false

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
                            .opacity(isSymbolAnimating ? 1 : 0)
                            .offset(y: isSymbolAnimating ? 0 : -50)
                            .animation(symbolAnimation(withRandomRange: 0.5...0.7), value: isSymbolAnimating)
                            .onAppear {
                                isSymbolAnimating = true
                            }
                    } //: ZSTACK

                    HStack(alignment: .center, spacing: 0) {
                        // MARK: - REEL #2
                        ZStack {
                            ReelView()
                            Image(symbols[reels[1]])
                                .resizable()
                                .imageModifier()
                                .opacity(isSymbolAnimating ? 1 : 0)
                                .offset(y: isSymbolAnimating ? 0 : -50)
                                .animation(symbolAnimation(withRandomRange: 0.7...0.9), value: isSymbolAnimating)
                                .onAppear {
                                    isSymbolAnimating = true
                                }
                        } //: ZSTACK

                        Spacer()

                        // MARK: - REEL #3
                        ZStack {
                            ReelView()
                            Image(symbols[reels[2]])
                                .resizable()
                                .imageModifier()
                                .opacity(isSymbolAnimating ? 1 : 0)
                                .offset(y: isSymbolAnimating ? 0 : -50)
                                .animation(symbolAnimation(withRandomRange: 0.9...1.1), value: isSymbolAnimating)
                                .onAppear {
                                    isSymbolAnimating = true
                                }
                        } //: ZSTACK
                    } //: HSTACK
                    .frame(maxWidth: 500)

                    // MARK: - SPIN BUTTON
                    Button(action: {
                        isSymbolAnimating = false

                        spinReels()

                        withAnimation {
                            isSymbolAnimating = true
                        }

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
                            .offset(x: isActiveBet20 ? 0 : 20)
                            .opacity(isActiveBet20 ? 1 : 0)
                            .casinoChipsModifier()
                    } // HSTACK

                    Spacer()

                    // MARK: - BET 10
                    HStack(alignment: .center, spacing: 10) {
                        Image("gfx-casino-chips")
                            .resizable()
                            .offset(x: isActiveBet10 ? 0 : -20)
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
                    resetGame()
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
                GameOverModalView() {
                    coins = 100
                    activateBet10()
                }
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

    private func resetGame() {
        highScore = 0
        coins = 100
        activateBet10()
    }

    private func symbolAnimation(withRandomRange range: ClosedRange<Double>) -> Animation? {
        // If isAnimating is false returns nil, this causes the animation to not fire in reverse
        isSymbolAnimating ? .easeOut(duration: Double.random(in: range)) : nil
    }
}

// MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

