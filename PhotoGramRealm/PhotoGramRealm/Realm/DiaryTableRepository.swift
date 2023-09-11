//
//  DiaryTableRepository.swift
//  PhotoGramRealm
//
//  Created by 황재하 on 9/6/23.
//

import UIKit
import RealmSwift


protocol DiaryTableRepositoryType: AnyObject {
    
    func fetch() -> Results<DiaryTable>
    func fetchFilter() -> Results<DiaryTable>
    func createItem(_ item: DiaryTable)
    
}


class DiaryTableRepository: DiaryTableRepositoryType{
    
    private let realm = try! Realm()
    
    private func a() { // 다른 파일에서 쓸 일이 없고, 클래스 안에서만 쓸 수 있음 ==> 오버라이딩 불가능 ==> 자동으로 final 키워드를 잠재적으로 유추
        
    }
    
    
    // 스키마 버전 체쿠~
    func checkSchemaVersion(){
        
        do{
            let version = try schemaVersionAtURL(realm.configuration.fileURL!)
            print("Schema Version: \(version)")
        } catch {
            print(error)
        }
        
    }
    
    
    // 가지고 오는 작업은 fetch로 명시해
    func fetch() -> Results<DiaryTable> {
        let data = realm.objects(DiaryTable.self).sorted(byKeyPath: "diaryTitle", ascending: true)
        
        return data
    }
    
    
    func fetchFilter() -> Results<DiaryTable> {
        
        let result = realm.objects(DiaryTable.self).where {
            // 1. 대소문자 구별 없음 : caseInsensitive
            // $0.diaryTitle.contains("제목", options: .caseInsensitive)
            
            // 2. Bool : diaryLike가 true인 값만 가져오기
            // $0.diaryLike == true
            
            // 3. 사진이 있는 데이터만 불러오기 (diaryPhoto의 nil 여부 판단)
             $0.Photo != nil
        }
        
        return result
    }
    
    // 쓰는 작업들은 create로 명시해
    func createItem(_ item: DiaryTable) {
        
        do {
            try realm.write {
                realm.add(item)
            }
        } catch {
            print(error)
        }
        
    }
    
    // 업데이트 작업들은 update로 명시해
    func updateItem(id: ObjectId, title: String, contents: String) {
        do {
            try realm.write {
                // 특정 레코드의 값을 수정하려 할 떄 사용 .modified _ 외에도 방법 많아
                // realm.add(item, update: .modified)
                
                // 원하는 컬럼 값만 수정할 수도 있음!
                realm.create(DiaryTable.self, value: ["_id": id, "diaryTitle":  title, "diaryContents": contents], update: .modified)
            }
            
        } catch {
            print("error")
        }
    }

    
    
}
