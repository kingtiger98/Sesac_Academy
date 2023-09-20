//
//  Router.swift
//  PunkMVVM
//
//  Created by 황재하 on 9/21/23.
//

import Foundation
import Alamofire

enum Router: URLRequestConvertible {
    
    case Beers
    case SingelBeer(id: String)
    case RandomBeer
    
    private var baseURL: URL{
        return URL(string: "https://api.punkapi.com/v2/")!
    }
    
    private var path: String{
        switch self {
        case .Beers:
            return "beers"
        case .SingelBeer(let id):
            return "beers/\(id)"
        case .RandomBeer:
            return "beers/random"
        }
    }

    
    private var method: HTTPMethod {
        return .get
    }

    var query: [String : String] { // 자료형 Parameters로 해도 오케잉
        switch self {
        case .Beers, .RandomBeer, .SingelBeer:
            return ["" : ""]
        }
    }
    
    
    func asURLRequest() throws -> URLRequest {
        
        let url = baseURL.appendingPathComponent(path)
        
        var request = URLRequest(url: url)
        
        request.method = method
        
        request = try URLEncodedFormParameterEncoder(destination: .methodDependent).encode(query, into: request)
        
        return request
        
    }
    
}
