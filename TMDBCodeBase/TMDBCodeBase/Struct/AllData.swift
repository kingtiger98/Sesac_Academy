import Foundation

// MARK: - Welcome
struct AllData: Codable {
    let page: Int
    let results: [All]
    let totalPages, totalResults: Int

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - Result
struct All: Codable {
    let adult: Bool
    let backdropPath: String
    let id: Int
    let name: String?
    let originalLanguage: AllOriginalLanguage
    let originalName: String?
    let overview, posterPath: String
    let mediaType: AllMediaType
    let genreIDS: [Int]
    let popularity: Double
    let firstAirDate: String?
    let voteAverage: Double
    let voteCount: Int
    let originCountry: [String]?
    let title, originalTitle, releaseDate: String?
    let video: Bool?

    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case id, name
        case originalLanguage = "original_language"
        case originalName = "original_name"
        case overview
        case posterPath = "poster_path"
        case mediaType = "media_type"
        case genreIDS = "genre_ids"
        case popularity
        case firstAirDate = "first_air_date"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
        case originCountry = "origin_country"
        case title
        case originalTitle = "original_title"
        case releaseDate = "release_date"
        case video
    }
}

enum AllMediaType: String, Codable {
    case movie = "movie"
    case tv = "tv"
}

enum AllOriginalLanguage: String, Codable {
    case en = "en"
    case ja = "ja"
    case nl = "nl"
    case sv = "sv"
}
