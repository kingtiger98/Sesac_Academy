//
//  VideoStruct.swift
//  MediaProject
//
//  Created by 황재하 on 8/19/23.
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


// ==================================================================


// MARK: - Welcome
struct SimilarData: Codable {
    let page: Int
    let results: [Similar]
    let totalPages, totalResults: Int

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - Result
struct Similar: Codable {
    let adult: Bool
    let backdropPath: String?
    let genreIDS: [Int]
    let id: Int
    let originalLanguage, originalTitle, overview: String
    let popularity: Double
    let posterPath, releaseDate, title: String
    let video: Bool
    let voteAverage: Double
    let voteCount: Int

    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case genreIDS = "genre_ids"
        case id
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview, popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title, video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}

// ==================================================================

// MARK: - Welcome
struct VideoData: Codable {
    let id: Int
    let results: [Video]
}

// MARK: - Result
struct Video: Codable {
    let iso639_1, iso3166_1, name, key: String
    let site: String
    let size: Int
    let type: String
    let official: Bool
    let publishedAt, id: String

    enum CodingKeys: String, CodingKey {
        case iso639_1 = "iso_639_1"
        case iso3166_1 = "iso_3166_1"
        case name, key, site, size, type, official
        case publishedAt = "published_at"
        case id
    }
}





