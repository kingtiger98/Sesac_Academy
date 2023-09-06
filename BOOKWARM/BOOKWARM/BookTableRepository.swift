//
//  BookTableRepository.swift
//  BOOKWARM
//
//  Created by 황재하 on 9/6/23.
//

import UIKit
import RealmSwift

final class BookTableRepository{
    
    private let realm = try! Realm()
    
    // 스키마 버전 체크하기
    func checkSchemaVersion(){
        
        do{
            let version = try schemaVersionAtURL(realm.configuration.fileURL!)
            print("Schema Version: \(version)")
        } catch {
            print(error)
        }
        
    }

    func fileURL() {
        print(realm.configuration.fileURL)
    }
    
    func fetch() -> Results<BookTable>{
        let data = realm.objects(BookTable.self).sorted(byKeyPath: "bookName", ascending: true)
        return data
    }
    
    func createItem(_ item: BookTable) {
        do {
            try realm.write {
                realm.add(item)
                print("Realm Add Succeed")
            }
            
        } catch {
            print(error)
        }
    }
    
    func updateItem(id: ObjectId, memo: String){
        do {
            try realm.write {
                // 1. 특정 레코드에 있는 모든 값을 수정 할 때 사용합니다.
                // realm.add(item, update: .modified)
                
                // 2. 특정 컬럼 값만 수정 할 때 사용합니다.
                realm.create(BookTable.self, value: ["_id": id, "memo":  memo], update: .modified)
            }
            
        } catch {
            print("error")
        }
    }
    
    func deleteItem(_ item: BookTable){
        
        do {
            try realm.write {
                realm.delete(item)
            }
        } catch {
            print(error)
        }
        

    }
    
    
}
