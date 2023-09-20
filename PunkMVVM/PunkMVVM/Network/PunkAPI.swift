//
//  PunkAPI.swift
//  PunkMVVM
//
//  Created by 황재하 on 9/20/23.
//

import Foundation
import Alamofire

enum PunkAPI{
    
    case Beers
    case SingelBeer(id: String)
    case RandomBeer
    
    var baseURL: String {
        return "https://api.punkapi.com/v2/"
    }
    
    var endPoint: URL{
        switch self {
        case .Beers:
            return URL(string: baseURL + "beers")!
        case .SingelBeer(let id):
            return URL(string: baseURL + "beers/\(id)")!
        case .RandomBeer:
            return URL(string: baseURL + "beers/random")!
        }
    }
    
    var method: HTTPMethod{
        return .get
    }
    
}
