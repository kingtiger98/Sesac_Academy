//
//  APIKeys.swift
//  PracticeAAPP
//
//  Created by 황재하 on 8/20/23.
//

import Foundation


enum APIKEY{
    case TMDBTOKEN
    
    var Token: String {
        switch self{
        case .TMDBTOKEN:
            return "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJjMGI0NTQ2NDIwYzcyNmE4MWQyYjcxMWEwNDhlMTg0NiIsInN1YiI6IjY0ZDZlZGU3ZjQ5NWVlMDI4ZjYzZDNiYyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.BGtl-e-IpDeMJ9JAqP2qK5rmfvOf5gBPOuuYeYfDcbk"
        }
    }
}
