//
//  AppDelegate.swift
//  PhotoGramRealm
//
//  Created by jack on 2023/09/03.
//

import UIKit
import RealmSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        // migration 스키마 버전 작업 _ 컬럼과 테이블 단순 추가 삭제의 경우엔 별도 코드가 필요없음
        let config = Realm.Configuration(schemaVersion: 5) { migration, oldSchemaVersion in
            
            if oldSchemaVersion < 1 { } // diaryPin Column 추가
            
            if oldSchemaVersion < 2 { } // diaryPin Column 삭제

            if oldSchemaVersion < 3 { // diaryPhoto -> photo로 column 이름 변경
                migration.renameProperty(onType: DiaryTable.className(), from: "diaryPhoto", to: "photo")
            }
            
            // 앱이 정상적으로 작동하지만 치명적인 실수다 이러면
            if oldSchemaVersion < 4 { } // diaryContents -> contents로 column 이름 변경시 만약 코드를 작성 안하면 다 null 이 되버림!!!
            
            
            if oldSchemaVersion < 5 { // diarySummary 컬럼 추가 <= title + contents 합쳐서 넣기
                migration.enumerateObjects(ofType: DiaryTable.className()) { oldObject, newObject in
                    guard let new = newObject else { return }
                    guard let old = oldObject else { return }
                    
                    new["diarySummary"] = "제목은 '\(old["diaryTitle"])'이고, 내용은 '\(old["contents"])'입니다"
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

