//
//  EndPoint.swift
//  PracticeAAPP
//
//  Created by 황재하 on 8/20/23.
//

import Foundation

enum EndPoint{
    case all
    case movie
    case people
    case tv
    
    var requestURL: String {
        switch self{
        case .all:
            return URL.addEndPointURL(endpoint: "trending/all/day?language=ko-KR")
        case .movie:
            return URL.addEndPointURL(endpoint: "movie/day?language=en-US")
        case .people:
            return URL.addEndPointURL(endpoint: "person/day?language=en-US")
        case .tv:
            return URL.addEndPointURL(endpoint: "tv/day?language=en-US")
        }
    }
}
