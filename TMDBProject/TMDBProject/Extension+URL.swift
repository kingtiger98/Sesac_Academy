//
//  Extension+URL.swift
//  TMDBProject
//
//  Created by 황재하 on 8/13/23.
//

import Foundation

extension URL {
    
    static let baseURl = "https://api.themoviedb.org/3/"
    
    static func addEndPointURL(endpoint: String) -> String{
        return baseURl + endpoint
    }
}
