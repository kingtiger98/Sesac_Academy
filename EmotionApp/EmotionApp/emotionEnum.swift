//
//  emotionEnum.swift
//  EmotionApp
//
//  Created by 황재하 on 7/25/23.
//

import Foundation

enum Emotion: Int{
    case pink = 1
    case orange 
    case yellow
    case mint
    case blue
    
    var key: String {
        switch self{
        case .pink:
            return "pinkCount"
        case .orange:
            return "orangeCount"
        case .yellow:
            return "yellowCount"
        case .mint:
            return "mintCount"
        case .blue:
            return "blueCount"
        }
    }
    
}


enum UserDefaultKey: String {
    case pink = "pinkCount"
    case orange = "orangeCount"
    case yellow = "yellowCount"
    case mint = "mintCount"
    case blue = "blueCount"
}




