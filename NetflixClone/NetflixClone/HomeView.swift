import SwiftUI

struct HomeView: View {
    // MARK: - PROPERTIES

    @StateObject var viewModel = HomeViewModel()

    // MARK: - BODY
    var body: some View {

        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)

            // MAIN VSTACK
            ScrollView(showsIndicators: false) {
                LazyVStack {
                    ForEach(viewModel.allCategories, id: \.self) { category in
                        VStack {
                            HStack {
                                Text(category)
                                    .font(.title3)
                                    .bold()
                                Spacer()
                            } //: HSTACK

                            ScrollView(.horizontal, showsIndicators: false) {
                                LazyHStack {
                                    ForEach(viewModel.getMoves(forCat: category)) { movie in
                                        StandardHomeMovieView(movie: movie)
                                            .frame(width: 100, height: 200)
                                            .padding(.horizontal, 20)
                                    }
                                }
                            } //: SCROLL
                        } //: VSTACK
                    } //: LOOP
                } //: VSTACK
            } //: SCROLL
        } //: ZSTACK
        .foregroundColor(.white)
    }
}

// MARK: - PREVIEW
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
