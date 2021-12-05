import SwiftUI

struct GameOverModalView: View {
    let coins: Binding<Int>
    var body: some View {
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
                        coins.wrappedValue = 100
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
}

struct GameOverModalView_Previews: PreviewProvider {
    static var previews: some View {
        GameOverModalView(coins: .constant(0))
    }
}
