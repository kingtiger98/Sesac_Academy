//
//  StructTMDB.swift
//  PracticeAAPP
//
//  Created by 황재하 on 8/20/23.
//

import Foundation

// MARK: - Welcome
struct TrendData: Codable {
    let page: Int
    let results: [Trend]
    let totalPages, totalResults: Int

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - Result
struct Trend: Codable {
    let adult: Bool
    let backdropPath: String
    let id: Int
    let name, originalLanguage, originalName, overview: String?
    let posterPath: String
    let mediaType: String?
    let genreIDS: [Int]
    let popularity: Double
    let firstAirDate: String?
    let voteAverage: Double
    let voteCount: Int

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
    }
}

enum MediaType: String, Codable {
    case tv = "tv"
}
