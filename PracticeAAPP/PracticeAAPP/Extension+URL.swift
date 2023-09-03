//
//  Extension+URL.swift
//  PracticeAAPP
//
//  Created by 황재하 on 8/20/23.
//

import Foundation


extension URL {
    
    static let baseURL = "https://api.themoviedb.org/3/trending/"
    
    static func addEndPointURL(endpoint: String) -> String{
        return baseURL + endpoint
    }
    
    
}
