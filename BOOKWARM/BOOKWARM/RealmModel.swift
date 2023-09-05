//
//  RealmModel.swift
//  BOOKWARM
//
//  Created by 황재하 on 9/4/23.
//

import UIKit
import RealmSwift

class BookTable: Object { 
    
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var name: String
    @Persisted var author: String
    @Persisted var price: String
    @Persisted var image: String
    @Persisted var memo: String
    
    convenience init(name: String, author: String, price: String, image: String, memo: String) {
        self.init()
        self.name = name
        self.author = author
        self.price = price
        self.image = image
        self.memo = memo

    }
}
