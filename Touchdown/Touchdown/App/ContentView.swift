import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTIES

    // MARK: - BODY
    var body: some View {
        VStack(spacing: 0) {
            NavigationBarView()
                .padding()
                .background(Color.white)
                .shadow(color: .black.opacity(0.05), radius: 5, x: 0, y: 5)

            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 0) {
                    FeaturedTabView()
                        .frame(minHeight: 256)
                        .padding(.vertical, 10)

                    CategoryGridView()

                    FooterView()
                        .padding(.horizontal)
                } //: VSTACK
            } //: SCROLL
        } //: VSTACK
        .background(colorBackground.ignoresSafeArea(.all, edges: .all))
    }
}

// MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
