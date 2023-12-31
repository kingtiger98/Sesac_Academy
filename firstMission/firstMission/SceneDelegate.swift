//
//  SceneDelegate.swift
//  firstMission
//
//  Created by 황재하 on 7/18/23.
//

import UIKit

@available (iOS 13.0, *) // iOS 13 이상부터 실행되도록!
class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    @available (iOS 13.0, *) // iOS 13 이상부터 실행되도록!
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let _ = (scene as? UIWindowScene) else { return }
    }

    @available (iOS 13.0, *) // iOS 13 이상부터 실행되도록!
    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    
    @available (iOS 13.0, *) // iOS 13 이상부터 실행되도록!
    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
        
        // active 상태시 출력
        print("sceneDidBecomeActive")
    }

    
    @available (iOS 13.0, *) // iOS 13 이상부터 실행되도록!
    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
        
        // Inactive 상태시 출력
        print("sceneWillResignActive")
    }

    
    @available (iOS 13.0, *) // iOS 13 이상부터 실행되도록!
    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
        
        // Background에서 foreground상태로 오면 출력
        print(#function)
    }

    
    
    @available (iOS 13.0, *) // iOS 13 이상부터 실행되도록!
    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
        
        // Background 상태시 출력
        print(#function, "영상", "음악")
    }


}

