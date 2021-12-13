import Foundation

class HomeViewModel: ObservableObject {

    // String == Category
    @Published var movies: [String: [Movie]] = [:]

    public var allCategories: [String] {
        movies.keys.map { $0 }
    }

    init() {
        setupMovies()
    }

    // MARK: - PUBLIC

    public func getMoves(forCat cat: String) -> [Movie] {
        movies[cat] ?? []
    }

    // MARK: - Helpers
    private func setupMovies() {
        movies["Trending Now"] = exampleMovies
        movies["Standup Comedy"] = exampleMovies.shuffled()
        movies["Watch it Again"] = exampleMovies.shuffled()
        movies["New Releases"] = exampleMovies.shuffled()
        movies["Drama"] = exampleMovies.shuffled()
    }
}
