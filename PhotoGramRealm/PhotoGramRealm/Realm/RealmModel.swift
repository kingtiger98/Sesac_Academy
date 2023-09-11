//
//  RealmModel.swift
//  PhotoGramRealm
//
//  Created by 황재하 on 9/4/23.
//

import UIKit
import RealmSwift

//데이터구조     =>    | ID | 제목 | 날짜  | 내용 | 사진URL |
//                  | 필수 | 필수 | 필수 | nil |  nil  |

// 1. Realm table 만들기 ***
class DiaryTable: Object {
    
    // 스키마 버전 0
    @Persisted(primaryKey: true) var _id: ObjectId // 기본키
    @Persisted var diaryTitle: String // 일기 제목 (필수)
    @Persisted var diaryDate: Date // 일기 등록 날짜 (필수)
    @Persisted var contents: String? // 일기 내용 (옵션)
    @Persisted var Photo: String? // 일기 사진 URL (옵션)
    @Persisted var diaryLike: Bool // 즐겨찾기 기능(필수)
    
    // 핀 컬럼 추가함 _ 스키마 버전 1이 되겠지? _ AppDelegate 에서 migration 설정 해줘야해!
    // @Persisted var diaryPin: Bool // 핀 기능

    @Persisted var diarySummary: String
    
    convenience init(diaryTitle: String, diaryDate: Date, contents: String?, diaryPhoto: String?) {
        self.init()
        
        self.diaryTitle = diaryTitle
        self.diaryDate = diaryDate
        self.contents = contents
        self.Photo = diaryPhoto
        self.diaryLike = true
        self.diarySummary = "제목은 '\(diaryTitle)'이고, 내용은 '\(contents ?? "")'입니다"
    }
    
    
    
}
