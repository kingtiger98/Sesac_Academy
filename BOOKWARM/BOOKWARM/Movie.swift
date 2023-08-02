//
//  Movie.swift
//  BOOKWARM
//
//  Created by 황재하 on 7/31/23.
//

import UIKit

struct Movie {
    
    // 랜덤 색 추출
    static func changeBackgroundColorRandom() -> UIColor{
        let r : CGFloat = CGFloat.random(in: 0...1)
        let g : CGFloat = CGFloat.random(in: 0...1)
        let b : CGFloat = CGFloat.random(in: 0...1)

        
        return UIColor(red: r, green: g, blue: b, alpha: 1)
    }
    
    let title: String
    let releaseDate: String
    let runtime: Int
    let overview: String
    let rate: Double
    var favorite: Bool
    let color: UIColor
}
