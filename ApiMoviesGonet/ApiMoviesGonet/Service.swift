import Foundation

struct ItemsMoviesService: Codable {
    let id: String? = ""
    let items: [ItemToMovies] = [ItemToMovies]()
}

struct ItemToMovies: Codable {
    let title: String? = ""
    let original_title: String? = ""
}

