//
//  Router.swift
//  SeSAC3Week10
//
//  Created by 황재하 on 9/20/23.
//

import Foundation
import Alamofire

enum Router: URLRequestConvertible {
    
    private static let key = "jIIsu7aMtDknZPWcBQXtkoENW103bwaUMg8nw5OdYYc"
    
    case search(query: String)
    case random
    case photo(id: String) // 연관값 _ associated Value
    
    private var baseURL: URL{
        return URL(string: "https://api.unsplash.com/")!
    }
    
    private var path: String{
        switch self {
        case .search:
            return "search/photos"
        case .random:
            return  "photos/random"
        case .photo(let id):
            return "photos/\(id)"
        }
    }
    
    private var header: HTTPHeaders{
        return [ "Authorization" : "Client-ID \(Router.key)" ]
    }
    
    private var method: HTTPMethod {
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
    
    func asURLRequest() throws -> URLRequest {
        
        let url = baseURL.appendingPathComponent(path)
        
        var request = URLRequest(url: url)
        
        request.method = method
        request.headers = header
        
        request = try URLEncodedFormParameterEncoder(destination: .methodDependent).encode(query, into: request)
        
        return request
        
    }
    
}
