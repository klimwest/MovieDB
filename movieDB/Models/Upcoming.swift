
import Foundation

struct Upcoming: Decodable {
    var results: [ResultsUpcoming]
}

struct ResultsUpcoming: Decodable {
    var backdrop_path: String
    var title: String
    var overview: String
    var release_date: String
    var vote_average: Double
    var poster_path: String
}
