//
//  TMDBStruct.swift
//  TMDBProject
//
//  Created by 황재하 on 8/15/23.
//

import Foundation


// MARK: - Welcome
struct MovieData: Codable {
    let totalPages, totalResults, page: Int
    let results: [Movie]

    enum CodingKeys: String, CodingKey {
        case totalPages = "total_pages"
        case totalResults = "total_results"
        case page, results
    }
}

// MARK: - Result
struct Movie: Codable {
    let id: Int
    let genreIDS: [Int]
    let video: Bool
    let title: String
    let popularity, voteAverage: Double
    let releaseDate: String
    let mediaType: MediaType
    let backdropPath: String
    let originalLanguage: String
    let voteCount: Int
    let overview, posterPath: String
    let adult: Bool
    let originalTitle: String

    enum CodingKeys: String, CodingKey {
        case id
        case genreIDS = "genre_ids"
        case video, title, popularity
        case voteAverage = "vote_average"
        case releaseDate = "release_date"
        case mediaType = "media_type"
        case backdropPath = "backdrop_path"
        case originalLanguage = "original_language"
        case voteCount = "vote_count"
        case overview
        case posterPath = "poster_path"
        case adult
        case originalTitle = "original_title"
    }
}

enum MediaType: String, Codable {
    case movie = "movie"
}

enum OriginalLanguage: String, Codable {
    case en = "en"
    case hi = "hi"
}
