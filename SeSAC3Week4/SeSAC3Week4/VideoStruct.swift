//
//  VideoStruct.swift
//  SeSAC3Week4
//
//  Created by 황재하 on 8/17/23.
//

import Foundation

// MARK: - Welcome
struct VideoData: Codable {
    let documents: [Document]
}

// MARK: - Document
struct Document: Codable {
    let playTime: Int
    let datetime: String
    let thumbnail: String
    let author, title: String
    let url: String

    enum CodingKeys: String, CodingKey {
        case playTime = "play_time"
        case datetime, thumbnail, author, title, url
    }
}


