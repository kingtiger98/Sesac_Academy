//
//  PunkStruct.swift
//  PunkMVVM
//
//  Created by 황재하 on 9/20/23.
//

import Foundation

struct BeerData: Decodable {
    
    let id: Int
    let name, description: String
    let imageURL: String

    enum CodingKeys: String, CodingKey {
        case id, name
        case description
        case imageURL = "image_url"
    }
    
}

typealias Beer = [BeerData]
