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

class DiaryTable: Object {
    
    @Persisted(primaryKey: true) var _id: ObjectId // 기본키
    @Persisted var diaryTitle: String // 일기 제목 (필수)
    @Persisted var diaryDate: Date // 일기 등록 날짜 (필수)
    @Persisted var diaryContents: String? // 일기 내용 (옵션)
    @Persisted var diaryPhoto: String? // 일기 사진 URL (옵션)
    @Persisted var diaryLike: Bool // 즐겨찾기 기능(필수)

    convenience init(diaryTitle: String, diaryDate: Date, diaryContents: String?, diaryPhoto: String?) {
        self.init()
        
        self.diaryTitle = diaryTitle
        self.diaryDate = diaryDate
        self.diaryContents = diaryContents
        self.diaryPhoto = diaryPhoto
        self.diaryLike = false
    }
    
    
}


