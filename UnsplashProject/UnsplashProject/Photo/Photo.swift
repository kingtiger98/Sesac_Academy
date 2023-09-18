//
//  Photo.swift
//  UnsplashProject
//
//  Created by 황재하 on 9/12/23.
//

import Foundation

struct Photo: Codable, Hashable {
    let total: Int
    let total_pages: Int
    let results: [PhotoResult]?
}

struct PhotoResult: Codable, Hashable {
    let id: String
    let created_at: String
    let description: String?
    let urls: PhotoURL
    let links: PhotoLink
    let likes: Int
    let user: PhotoUser
}

struct PhotoURL: Codable, Hashable {
    let full: String
    let thumb: String
}

struct PhotoLink: Codable, Hashable {
    let html: String
}

struct PhotoUser: Codable, Hashable {
    let username: String
}
