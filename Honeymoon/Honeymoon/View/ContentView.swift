import SwiftUI

struct ContentView: View {

    // MARK: - BODY
    var body: some View {
        CardView(destination: honeymoonData[1])
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
