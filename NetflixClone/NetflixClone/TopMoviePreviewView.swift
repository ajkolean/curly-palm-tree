import SwiftUI
import Kingfisher

struct TopMoviePreviewView: View {
    // MARK: - PROPERTIES

    let movie: Movie

    // MARK: - BODY
    var body: some View {
        ZStack {
            KFImage(movie.thumbnailURL)
                .resizable()
                .scaledToFill()
                .clipped()

            VStack {
                Spacer()
                HStack {
                    ForEach(movie.categories, id: \.self) { category in
                        HStack {
                            Text(category)
                            if !isLastCategory(category) {
                                Image(systemName: "circle.fill")
                                    .foregroundColor(.blue)
                                    .font(.system(size: 3))
                            }
                        }
                    }
                }
                Text("Row of buttons")
            } //: VSTACK
        } //: ZSTACK
        .foregroundColor(.white)
    }

    // MARK: - HELPERS

    private func isLastCategory(_ category: String) -> Bool {
        movie.categories.last == category
    }
}


// MARK: - PREVIEW
struct TopMoviePreviewView_Previews: PreviewProvider {
    static var previews: some View {
        TopMoviePreviewView(movie: exampleMovie3)
    }
}
