//
//  URL+Extenstion.swift
//  SeSAC3Week4
//
//  Created by 황재하 on 8/11/23.
//

import Foundation

extension URL {
    static let baseURL = "https://dapi.kakao.com/v2/search/"
    
    static func makeEndPointString(_ endpoint: String) -> String {
        return baseURL + endpoint
    }
    
}
