//
//  ToDoTable.swift
//  PhotoGramRealm
//
//  Created by 황재하 on 9/8/23.
//

import Foundation
import RealmSwift

class ToDoTable: Object{
    
    @Persisted(primaryKey: true) var _id: ObjectId // 기본키
    @Persisted var title: String
    @Persisted var favorite: Bool
    
    // To Many Relationship => 1 : N, 단방향
    @Persisted var detail: List<DetailTable>
    
    // To One RelationShip => 1 : 1, EmbeddedObject(무조건 옵셔널 필수)사용, 별도의 테이블이 생성되는 형태는 아님 인스턴스가 생성되는 정도
    @Persisted var memo: Memo?
    
    convenience init(title: String, favorite: Bool) {
        self.init()
        
        self.title = title
        self.favorite = favorite
    }
    
}


class DetailTable: Object{
    
    @Persisted(primaryKey: true) var _id: ObjectId // 기본키
    @Persisted var detail: String
    @Persisted var deadline: Date
    
    // 역관계
    // Inverse Relationship Property (LinkingObjects) : 나는 ToDoTable에서 누구의 DetailTable인가 역관계 조회하는 법!
    
    // ToDoTable(부모테이블)의 "detail"(부모테이블의 컬럼_프로퍼티)임, self의 detail아니야!
    @Persisted(originProperty: "detail") var mainToDo: LinkingObjects<ToDoTable>
    
    convenience init(detail: String, deadline: Date) {
        self.init()
        
        self.detail = detail
        self.deadline = deadline
        
    }
}


class Memo: EmbeddedObject {
    @Persisted var content: String
    @Persisted var date: Date
}

