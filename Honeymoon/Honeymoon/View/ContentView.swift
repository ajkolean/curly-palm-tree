import SwiftUI

struct ContentView: View {

    // MARK: - BODY
    var body: some View {
        VStack {
            HeaderView()

            Spacer()

            CardView(destination: honeymoonData[3])
            // TODO: Add pading to cardds
                .padding()

            Spacer()
        } //: VSTACK
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
