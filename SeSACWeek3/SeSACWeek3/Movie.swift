//
//  Movie.swift
//  SeSACWeek3
//
//  Created by 황재하 on 7/28/23.
//

import Foundation

struct Movie {
    // 인스턴스를 생성하지 않고 사용할 수 있는 스태틱!
    static let identifier = "MovieTableViewCell"
    
    var title: String
    var releaseDate: String
    var runtime: Int
    var overview: String
    var rate: Double
}


