import Foundation

class Likes: Codable {
    
    var overview: String
    var title: String
    var like: Bool
    var poster: String
    var yearAndGenre: String
    
    init(overview: String, title: String, like: Bool, poster: String, yearAndGenre: String) {
        self.like = like
        self.overview = overview
        self.title = title
        self.poster = poster
        self.yearAndGenre = yearAndGenre
    }
    
    enum CodingKeys: String, CodingKey {
        case like, overview, title, poster, yearAndGenre
    }
    
    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.like = try container.decode(Bool.self, forKey: .like)
        self.overview = try container.decode(String.self, forKey: .overview)
        self.title = try container.decode(String.self, forKey: .title)
        self.poster = try container.decode(String.self, forKey: .poster)
        self.yearAndGenre = try container.decode(String.self, forKey: .yearAndGenre)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(self.like, forKey: .like)
        try container.encode(self.overview, forKey: .overview)
        try container.encode(self.title, forKey: .title)
        try container.encode(self.poster, forKey: .poster)
        try container.encode(self.yearAndGenre, forKey: .yearAndGenre)
    }
}
