//
//  CastData.swift
//  TMDBCodeBase
//
//  Created by 황재하 on 8/29/23.
//

import Foundation


// MARK: - Welcome
struct CastData: Codable {
    let id: Int
    let crew, cast: [Cast]
}

// MARK: - Cast
struct Cast: Codable {
    let profilePath: String?
    let knownForDepartment: String
    let castID: Int?
    let id: Int
    let adult: Bool
    let name, originalName: String
    let gender: Int
    let creditID: String
    let popularity: Double
    let character: String?
    let order: Int?
    let job, department: String?

    enum CodingKeys: String, CodingKey {
        case profilePath = "profile_path"
        case knownForDepartment = "known_for_department"
        case castID = "cast_id"
        case id, adult, name
        case originalName = "original_name"
        case gender
        case creditID = "credit_id"
        case popularity, character, order, job, department
    }
}
