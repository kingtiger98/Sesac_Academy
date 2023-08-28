//
//  EndPoint.swift
//  TMDBProject
//
//  Created by 황재하 on 8/13/23.
//

import Foundation

enum EndPoint{
    case movie
    case actor
    
    var requestURL: String {
        switch self {
        case .movie:
            return URL.addEndPointURL(endpoint: "trending/movie/day?language=ko-KR")
        case .actor:
            return URL.addEndPointURL(endpoint: "movie/")
            
        }
    }
}
