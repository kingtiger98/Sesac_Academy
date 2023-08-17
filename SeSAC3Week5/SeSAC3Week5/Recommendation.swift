//
//  Recommendation.swift
//  SeSAC3Week5
//
//  Created by 황재하 on 8/17/23.
//

import Foundation

// MARK: - Welcome
struct Recommendation: Codable {
    let totalResults, page, totalPages: Int
    let results: [Movie]

    enum CodingKeys: String, CodingKey {
        case totalResults = "total_results"
        case page
        case totalPages = "total_pages"
        case results
    }
}

// MARK: - Result
struct Movie: Codable {
    let voteCount: Int
    let adult: Bool
    let originalLanguage: String?
    let voteAverage: Double
    let id: Int
    let posterPath: String?
    let popularity: Double
    let mediaType: MediaType
    let backdropPath: String?
    let originalTitle, title, overview, releaseDate: String
    let genreIDS: [Int]
    let video: Bool

    enum CodingKeys: String, CodingKey {
        case voteCount = "vote_count"
        case adult
        case originalLanguage = "original_language"
        case voteAverage = "vote_average"
        case id
        case posterPath = "poster_path"
        case popularity
        case mediaType = "media_type"
        case backdropPath = "backdrop_path"
        case originalTitle = "original_title"
        case title, overview
        case releaseDate = "release_date"
        case genreIDS = "genre_ids"
        case video
    }
}

enum MediaType: String, Codable {
    case movie = "movie"
}

