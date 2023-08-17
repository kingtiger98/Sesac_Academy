//
//  Endpoint.swift
//  SeSAC3Week4
//
//  Created by 황재하 on 8/11/23.
//

import Foundation


// let url = "https://dapi.kakao.com/v2/search/vclip?query=\(text)&size=10&page=\(page)"


enum Endpoint {
    case blog
    case cafe
    case video
    
    var requestURL: String {
        switch self {
        case .blog:
            return URL.makeEndPointString("blog?query=")
        case .cafe:
            return URL.makeEndPointString("cafe?query=")
        case .video:
            return URL.makeEndPointString("vclip?query=")
        }
    
    }
}

