//
//  RealmModel.swift
//  BOOKWARM
//
//  Created by 황재하 on 9/4/23.
//

import UIKit
import RealmSwift

final class BookTable: Object { 
    
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var bookName: String // 스키마 버전 3 : name -> bookName으로 column이름 변경
    @Persisted var author: String
    @Persisted var price: String
    @Persisted var image: String
    @Persisted var memo: String // 스키마 버전 0
    
    // 스키마 버전 1 : 컬럼 하나 추가 해보기
    // @Persisted var favorite: Bool // 스키마 버전 2 : 컬럼 다시 삭제 해보기
    
    // 스키마 버전 4
    @Persisted var bookInfo: String
    
    convenience init(bookName: String, author: String, price: String, image: String, memo: String) {
        self.init()
        self.bookName = bookName
        self.author = author
        self.price = price
        self.image = image
        self.memo = memo
        //self.favorite = false
        
        self.bookInfo = "책 제목 : \(bookName), 글쓴이 : \(author)"
        
    }
}
