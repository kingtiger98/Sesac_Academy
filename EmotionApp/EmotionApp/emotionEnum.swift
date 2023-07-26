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

let pinkCount = UserDefaults.standard.integer(forKey: "pinkCount")
let orangeCount = UserDefaults.standard.integer(forKey: "orangeCount")
let yellowCount = UserDefaults.standard.integer(forKey: "yellowCount")
let mintCount = UserDefaults.standard.integer(forKey: "mintCount")
let blueCount = UserDefaults.standard.integer(forKey: "blueCount")

var pinkTotal = pinkCount + 1
var orangeTotal = orangeCount + 1
var yellowTotal = yellowCount + 1
var mintTotal = mintCount + 1
var blueTotal = blueCount + 1


var totalCountList = [pinkCount, orangeCount, yellowCount, mintCount, blueCount]

