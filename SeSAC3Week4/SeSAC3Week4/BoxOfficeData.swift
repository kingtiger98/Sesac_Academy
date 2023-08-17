//
//  BoxOfficeData.swift
//  SeSAC3Week4
//
//  Created by 황재하 on 8/14/23.
//

import Foundation

// MARK: - Welcome
struct BoxOffice: Codable {
    let boxOfficeResult: BoxOfficeResult
}

// MARK: - BoxOfficeResult
struct BoxOfficeResult: Codable {
    let showRange, boxofficeType: String
    let dailyBoxOfficeList: [DailyBoxOfficeList]
}

// MARK: - DailyBoxOfficeList
struct DailyBoxOfficeList: Codable {
    let movieCD, scrnCnt, audiInten, salesChange: String
    let audiCnt, audiChange, rnum, salesShare: String
    let openDt: String
    let rankOldAndNew: RankOldAndNew
    let movieNm, rankInten, showCnt, salesAmt: String
    let audiAcc, salesAcc, salesInten, rank: String

    enum CodingKeys: String, CodingKey {
        case movieCD = "movieCd"
        case scrnCnt, audiInten, salesChange, audiCnt, audiChange, rnum, salesShare, openDt, rankOldAndNew, movieNm, rankInten, showCnt, salesAmt, audiAcc, salesAcc, salesInten, rank
    }
}

enum RankOldAndNew: String, Codable {
    case old = "OLD"
}
