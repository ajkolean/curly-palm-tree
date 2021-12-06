import SwiftUI

struct ScoreView: View {
    // MARK: - PROPERTIES

    let coins: Int
    let highScore: Int

    // MARK: - BODY
    var body: some View {
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
    }
}

struct ScoreView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreView(coins: 100, highScore: 300)
            .previewLayout(.sizeThatFits)
            .padding()
            .background(.gray)
    }
}
