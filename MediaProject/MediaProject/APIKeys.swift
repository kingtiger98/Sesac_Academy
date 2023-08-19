//
//  APIKeys.swift
//  MediaProject
//
//  Created by 황재하 on 8/19/23.
//

import Foundation

enum APIKey {
    case tmdbToken
    case tmdbKey
    
    
    
    var key : String {
        switch self {
        case .tmdbToken:
            return "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJjMGI0NTQ2NDIwYzcyNmE4MWQyYjcxMWEwNDhlMTg0NiIsInN1YiI6IjY0ZDZlZGU3ZjQ5NWVlMDI4ZjYzZDNiYyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.BGtl-e-IpDeMJ9JAqP2qK5rmfvOf5gBPOuuYeYfDcbk"
        case .tmdbKey:
            return "c0b4546420c726a81d2b711a048e1846"
        }
  
    }
}
