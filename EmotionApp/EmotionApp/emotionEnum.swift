//
//  emotionEnum.swift
//  EmotionApp
//
//  Created by 황재하 on 7/25/23.
//

import Foundation

enum Emotion {
    case pink
    case orange
    case yellow
    case mint
    case blue
}

var countTapped: [Emotion: Int] = [.pink: 0, .orange: 0, .yellow: 0, .mint: 0, .blue: 0]