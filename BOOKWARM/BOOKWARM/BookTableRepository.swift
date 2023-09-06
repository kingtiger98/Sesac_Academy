//
//  BookTableRepository.swift
//  BOOKWARM
//
//  Created by 황재하 on 9/6/23.
//

import UIKit
import RealmSwift

class BookTableRepository{
    
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
    
    
    
    
    
}
