//
//  ViewController.swift
//  enumPractice
//
//  Created by 황재하 on 7/26/23.
//

import UIKit


enum UserDefaultKeys: String {
    case id = "Id"
    case password = "Password"
    case nickname = "Nickname"
    
    // 컴퓨티드 프로퍼티
    var tag: Int {
        switch self{ // self는 UserDefaultKeys임
        case .id:
            return 0
        case .password:
            return 1
        case .nickname:
            return 2
        }
    }
    
}


class ViewController: UIViewController {
    
    let infodefault = UserDefaults.standard
    
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var nicknameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // 열거형 컴퓨티드 프로퍼티 사용
        idTextField.tag = UserDefaultKeys.id.tag
        passwordField.tag = UserDefaultKeys.password.tag
        nicknameTextField.tag = UserDefaultKeys.nickname.tag
        
        print(UserDefaultKeys.id.rawValue)
        print(UserDefaultKeys.password.rawValue)
        print(UserDefaultKeys.nickname.rawValue)

        print(UserDefaultKeys.id.tag)
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        print(UserDefaultKeys.id.rawValue)
        print(UserDefaultKeys.password.rawValue)
        print(UserDefaultKeys.nickname.rawValue)
        
        idTextField.text = infodefault.string(forKey: UserDefaultKeys.id.rawValue)
        passwordField.text = infodefault.string(forKey: UserDefaultKeys.password.rawValue)
        nicknameTextField.text = infodefault.string(forKey: UserDefaultKeys.nickname.rawValue)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        print(UserDefaultKeys.id.rawValue)
        print(UserDefaultKeys.password.rawValue)
        print(UserDefaultKeys.nickname.rawValue)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        print(UserDefaultKeys.id.rawValue)
        print(UserDefaultKeys.password.rawValue)
        print(UserDefaultKeys.nickname.rawValue)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print(UserDefaultKeys.id.rawValue)
        print(UserDefaultKeys.password.rawValue)
        print(UserDefaultKeys.nickname.rawValue)
    }
    
    
    
    @IBAction func saveButton(_ sender: UIButton) {

        infodefault.set(idTextField.text, forKey: UserDefaultKeys.id.rawValue)
        infodefault.set(passwordField.text, forKey: UserDefaultKeys.password.rawValue)
        infodefault.set(nicknameTextField.text, forKey: UserDefaultKeys.nickname.rawValue)
        
        
//        print(infodefault.string(forKey: "Id"))
//        print(infodefault.string(forKey: "Password"))
//        print(infodefault.string(forKey: "Nickname"))

    }
    
    
    
    

}

