//
//  AppDelegate.swift
//  BOOKWARM
//
//  Created by 황재하 on 7/31/23.
//

import UIKit
import RealmSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        UINavigationBar.appearance().tintColor = .black
        
        // migration 스키마 버전 작업 _ 컬럼과 테이블 단순 추가 삭제의 경우엔 별도 코드가 필요없음
        let config = Realm.Configuration(schemaVersion: 4) {  migration, oldSchemaVersion in
            
            if oldSchemaVersion < 1 { } // favorite 컬럼 추가
            if oldSchemaVersion < 2 { } // favorite 컬럼 삭제
            
            if oldSchemaVersion < 3 { // name -> bookName으로 column이름 변경
                migration.renameProperty(onType: BookTable.className(), from: "name", to: "bookName")
            }
            
            
            if oldSchemaVersion < 4 { // bookInfo 컬럼 추가 <= bookName + author 합쳐서 넣기
                migration.enumerateObjects(ofType: BookTable.className()) { oldObject, newObject in
                    guard let new = newObject else { return }
                    guard let old = oldObject else { return }
                    
                    
                    new["bookInfo"] = "책 제목 : \(old["bookName"]), 글쓴이 : \(old["author"])"
                }
            }
            
        }
        
        Realm.Configuration.defaultConfiguration = config
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

