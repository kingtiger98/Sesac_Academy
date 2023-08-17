//
//  UserDefaultsHelper.swift
//  SeSAC3Week4
//
//  Created by 황재하 on 8/11/23.
//

import UIKit



class UserDefaultsHelper { // PropertyWrapper
    
    static let standard = UserDefaultsHelper() // SingleTon_싱글톤 패턴
    
    private init() { } // 접근 제어자(다음주)
    
    let userDefaults = UserDefaults.standard
 
    
    enum Key: String { // 컴파일 최적화
        case nickname, age
    }
    
    var nickname: String {
        get {
            return userDefaults.string(forKey: Key.nickname.rawValue) ?? "대장"
        }
        set {
             userDefaults.set(newValue, forKey: Key.nickname.rawValue)
        }
    }
    
    var age: Int {
        get {
            return userDefaults.integer(forKey: Key.age.rawValue)
        }
        set {
             userDefaults.set(newValue, forKey: Key.nickname.rawValue)
        }
    }
    
    
    
}
