//
//  EndPoint.swift
//  MediaProject
//
//  Created by 황재하 on 8/19/23.
//

import Foundation

enum EndPoint {
    
    case trend
    case similar
    case video
    
    var requestURL: String {
        switch self {
        case .trend:
            return URL.addEndPointURL(endPoint: "trending/movie/day?language=ko-KR")
        case .similar:
            return URL.addEndPointURL(endPoint: "movie/") // https://api.themoviedb.org/3/movie/{movie_id}/similar
        case .video:
            return URL.addEndPointURL(endPoint: "movie/") // https://api.themoviedb.org/3/movie/{movie_id}/videos
        }
    }
    
}
