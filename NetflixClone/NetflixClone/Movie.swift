import Foundation

struct Movie: Identifiable {
    let id: String
    let name: String
    let thumbnailURL: URL
    let categories: [String]
}
