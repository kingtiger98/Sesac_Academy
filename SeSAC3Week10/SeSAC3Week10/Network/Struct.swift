//
//  Struct.swift
//  SeSAC3Week10
//
//  Created by 황재하 on 9/20/23.
//

import Foundation

struct Photo: Decodable {
    
    let total: Int
    let total_pages: Int
    let results: [PhotoResult]
    
}

struct PhotoResult: Decodable{
    
    let id: String
    let created_at: String
    let urls: PhotoURL
    
}

struct PhotoURL: Decodable{
    
    let full: String
    let thumb: String
    
}
