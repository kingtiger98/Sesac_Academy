//
//  EndPoint.swift
//  MediaProject
//
//  Created by 황재하 on 8/19/23.
//

import Foundation

enum EndPoint {
    
    case Trend
    case similar
    
    var requestURL: String {
        switch self {
        case .Trend:
            return URL.addEndPointURL(endPoint: "trending/movie/day?language=ko-KR")
        case .similar:
            return URL.addEndPointURL(endPoint: "movie/") // https://api.themoviedb.org/3/movie/{movie_id}/similar
        }
    }
    
}
