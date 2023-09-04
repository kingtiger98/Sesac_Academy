//
//  ApiKey.swift
//  BOOKWARM
//
//  Created by 황재하 on 9/4/23.
//

import Foundation


enum Api{
    case kakao
    
    var key: String {
        switch self{
        case .kakao:
            return "7a71cd816c94ec531a086cfae68fc921"
        }
    }
}
