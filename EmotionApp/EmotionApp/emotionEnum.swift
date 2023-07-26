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
}

let defaults = UserDefaults.standard

var pinkTotal = pinkCount + 1
var orangeTotal = orangeCount + 1
var yellowTotal = yellowCount + 1
var mintTotal = mintCount + 1
var blueTotal = blueCount + 1

// 감정별 탭했던 횟수 가져오기
let pinkCount = defaults.integer(forKey: "pinkCount")
let orangeCount = defaults.integer(forKey: "orangeCount")
let yellowCount = defaults.integer(forKey: "yellowCount")
let mintCount = defaults.integer(forKey: "mintCount")
let blueCount = defaults.integer(forKey: "blueCount")

var totalCountList = [pinkCount, orangeCount, yellowCount, mintCount, blueCount]
