//
//  Extension+URL.swift
//  MediaProject
//
//  Created by 황재하 on 8/19/23.
//

import Foundation

extension URL {
    
    static let baseURL = "https://api.themoviedb.org/3/"

    static func addEndPointURL(endPoint: String) -> String{
        return baseURL + endPoint
    }
    
}
