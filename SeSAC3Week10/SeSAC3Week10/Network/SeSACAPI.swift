//
//  SeSACAPI.swift
//  SeSAC3Week10
//
//  Created by 황재하 on 9/19/23.
//

import Foundation
import Alamofire

enum SeSACAPI {
    
    private static let key = "jIIsu7aMtDknZPWcBQXtkoENW103bwaUMg8nw5OdYYc"
    
    case search(query: String)
    case random
    case photo(id: String) // 연관값 _ associated Value

    
//    var baseURL: String{
//        switch self {
//        case .search, .random:
//            return "https://api.unsplash.com/"
//        case .photo:
//            return "https://api.unsplash.com/"
//        }
//    }
    
    
    private var baseURL: String{
       return "https://api.unsplash.com/"
    }
    
    var endPoint: URL{
        switch self {
        case .search:
            return URL(string: baseURL + "search/photos")!
        case .random:
            return URL(string: baseURL + "photos/random")!
        case .photo(let id):
            return URL(string: baseURL + "photos/\(id)")!
        }
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var query: [String : String] { // 자료형 Parameters로 해도 오케잉
        switch self {
        case .search(let query):
            return ["query" : query]
        case .random, .photo:
            return ["":""]
        }
    }
    
    var header: HTTPHeaders{
        return [ "Authorization" : "Client-ID \(SeSACAPI.key)" ]
    }

}
