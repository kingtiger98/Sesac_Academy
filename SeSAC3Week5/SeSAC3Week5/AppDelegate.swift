//
//  AppDelegate.swift
//  SeSAC3Week5
//
//  Created by jack on 2023/08/14.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        // 알림 권한 설정
        UNUserNotificationCenter.current().delegate = self
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { success, error in
            //print(success, error)
        }
        
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        
        
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        
        
    }


}

extension AppDelegate : UNUserNotificationCenterDelegate {
    
    // 포그라운드에서도 앱에 알림이 오게 설정하는 법! / 친구랑 1:1 채팅 / 다른 단톡방, 다른 캔톡방
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
            
        // 특정 화면, 특정 조건에서만 포그라운드 알림 받기,
        // 특정 화면에서는 알림 안받기
        completionHandler([.sound, .badge, .banner, .list])
    }
    
    // 특정 알림 클릭하면 특정 화면으로 이동
    // (로컬)알림 갯수 제한 : 64개 제한 (identifier)
    // 카톡 : 포그라운드로 앱을 켜는 순간, 등록되어 있던 모든 알림들이 제거됨
    // - A, B, C / 
    // 잔디 : 포그라운드로 앱을 켜도 알림이 다 사라지지는 않음
}

