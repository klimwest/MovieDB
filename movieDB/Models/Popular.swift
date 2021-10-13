import Foundation

struct Movie: Decodable {
    var results: [Results]
}

struct Results: Decodable {
    var backdrop_path: String
    var title: String
    var overview: String
    var release_date: String
    var vote_average: Double
    var poster_path: String
}
