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
    case all
    
    var requestURL: String {
        switch self {
        case .movie:
            return URL.addEndPointURL(endpoint: "trending/movie/day?")
        case .actor:
            return URL.addEndPointURL(endpoint: "movie/")
        case .all:
            return URL.addEndPointURL(endpoint: "trending/all/day?")
        }
    }
}
 // URL Example: https://api.themoviedb.org/3/trending/all/day?api_key={api key}
