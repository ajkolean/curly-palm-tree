import SwiftUI
import Kingfisher

struct StandardHomeMovieView: View {
    // MARK: - PROPERTIES
    let movie: Movie

    // MARK: - BODY
    var body: some View {
        KFImage(movie.thumbnailURL)
            .resizable()
            .scaledToFill()
    }
}

// MARK: - PREVIEW
struct StandardHomeMovieView_Previews: PreviewProvider {
    static var previews: some View {
        StandardHomeMovieView(movie: exampleMovie1)
            .previewLayout(.fixed(width: 200, height: 300))
    }
}
