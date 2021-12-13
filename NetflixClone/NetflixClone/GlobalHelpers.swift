import Foundation

let exampleMovie1 = Movie(
    id: UUID().uuidString,
    name: "DARK",
    thumbnailURL: URL(string: "https://picsum.photos/200/300?1")!, categories: ["Dystopian", "Exciting", "Sci-Fi TV"]
)

let exampleMovie2 = Movie(
    id: UUID().uuidString,
    name: "Travelers",
    thumbnailURL: URL(string: "https://picsum.photos/200/300?2")!, categories: ["Dystopian", "Exciting", "Sci-Fi TV"]
)

let exampleMovie3 = Movie(
    id: UUID().uuidString,
    name: "Community",
    thumbnailURL: URL(string: "https://picsum.photos/200/300?3")!, categories: ["Dystopian", "Exciting", "Sci-Fi TV"]
)

let exampleMovie4 = Movie(
    id: UUID().uuidString,
    name: "Alone",
    thumbnailURL: URL(string: "https://picsum.photos/200/300?4")!, categories: ["Dystopian", "Exciting", "Sci-Fi TV"]
)

let exampleMovie5 = Movie(
    id: UUID().uuidString,
    name: "Hannibal",
    thumbnailURL: URL(string: "https://picsum.photos/200/300?5")!, categories: ["Dystopian", "Exciting", "Sci-Fi TV"]
)

let exampleMovie6 = Movie(
    id: UUID().uuidString,
    name: "After Life",
    thumbnailURL: URL(string: "https://picsum.photos/200/300?6")!, categories: ["Dystopian", "Exciting", "Sci-Fi TV"]
)


let exampleMovies = [
    exampleMovie1,
    exampleMovie2,
    exampleMovie3,
    exampleMovie4,
    exampleMovie5,
    exampleMovie6
]
