//
//  LoginViewController.swift
//  UnsplashProject
//
//  Created by 황재하 on 9/12/23.
//

import UIKit

class LoginViewController: UIViewController{
    
    @IBOutlet var idTextField: UITextField!
    @IBOutlet var pwTextField: UITextField!
    @IBOutlet var loginButton: UIButton!
    
    var viewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loginButton.addTarget(self, action: #selector(loginButtonClicked), for: .touchUpInside)
        idTextField.addTarget(self, action: #selector(idTextFieldChanged), for: .editingChanged)
        pwTextField.addTarget(self, action: #selector(pwTextFieldChanged), for: .editingChanged)

        
        viewModel.id.bind { text in
            print("ID bind : \(text)")
            self.idTextField.text = text
        }
        
        viewModel.pw.bind { text in
            print("PW bind : \(text)")
            self.pwTextField.text = text
        }
        
        viewModel.isValid.bind { bool in
            self.loginButton.isEnabled = bool
            self.loginButton.backgroundColor = bool ? .green : .lightGray
        }
        
    }
    
    @objc func idTextFieldChanged(){
        viewModel.id.value = idTextField.text!
        viewModel.checkValidation()
    }
    
    @objc func pwTextFieldChanged(){
        viewModel.pw.value = pwTextField.text!
        viewModel.checkValidation()
    }
    
    @objc func loginButtonClicked(){
        
        // 로그인 성공 얼럿 띄우기
        viewModel.signIn {
            
        }
        
    }
    
    
}
