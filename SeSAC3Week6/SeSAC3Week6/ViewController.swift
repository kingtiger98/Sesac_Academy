//
//  ViewController.swift
//  SeSAC3Week6
//
//  Created by 황재하 on 8/21/23.
//

import UIKit

// 인터페이스로 작업 했을 때 작업순서
// ㄴ 객체 얹고, 레이아웃 잡고, 아웃렛 연결, 속성 조절

// CodeBaseUI***
// 1. 뷰객체 프로퍼티 선언(클래스 인스턴스 생성)
// 2. 명시적으로 루트뷰에 추가 ( + translatesAutoresizingMaskIntoConstraints = false)
// 3. 크기와 위치 정의 : 레이아웃
// 4. 속성 정의
// => Frame 한계 등장, 아이폰 기종이 다양해짐
// => AutoResizingMask, AutoLayout => 스토리보드 대응만 했음
//      ㄴ AutoResizingMask, AutoLayout은 같이 쓸수 없으나 AutoLayout지정하면 AutoResizingMask 자동으로 꺼져서 별다른 조치 없이 사용할 수 있었던 것

// => NSLayoutConstraints => 코드베이스 대응 // AutoResizingMask과 같이 사용 불가능
    // 1. isActive
    // 2. addConstraints

// => NSLayoutAnchor => 코드베이스 대응 // AutoResizingMask과 같이 사용 불가능

class ViewController: UIViewController {

    // 1. 뷰객체 프로퍼티 선언(클래스 인스턴스 생성)
    let emailTextField = UITextField()
    let passwordTextField = UITextField()
    let signButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 2. 명시적으로 루트뷰에 추가
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        
        
        //AutoResizingMask과 NSLayoutConstraints를 같이 사용할 수 없음
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false // AutoResizingMask 꺼줘야함
        
        // 3. 크기와 위치 정의 : 레이아웃
        emailTextField.frame = CGRect(x: 50, y: 80, width: UIScreen.main.bounds.width - 100, height: 50)
        
        // 4. 속성 정의
        emailTextField.backgroundColor = .lightGray
        emailTextField.isSecureTextEntry = true
        emailTextField.keyboardType = .numberPad
        emailTextField.placeholder = "닉네임을 입력해주세요!"
        
        // isActive
//        NSLayoutConstraint(item: passwordTextField, attribute: .leading, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .leading, multiplier: 1, constant: 50).isActive = true
//
//        NSLayoutConstraint(item: passwordTextField, attribute: .trailing, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .trailing, multiplier: 1, constant: -50).isActive = true
//
//        NSLayoutConstraint(item: passwordTextField, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 60).isActive = true
//
//        NSLayoutConstraint(item: passwordTextField, attribute: .top, relatedBy: .equal, toItem: emailTextField, attribute: .bottom, multiplier: 1, constant: 50).isActive = true
        
        // addConstraints
        let leading =  NSLayoutConstraint(item: passwordTextField, attribute: .leading, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .leading, multiplier: 1, constant: 50)
        
        let trailing =  NSLayoutConstraint(item: passwordTextField, attribute: .trailing, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .trailing, multiplier: 1, constant: -50)
        
        let height =  NSLayoutConstraint(item: passwordTextField, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 60)
        
        let top =  NSLayoutConstraint(item: passwordTextField, attribute: .top, relatedBy: .equal, toItem: emailTextField, attribute: .bottom, multiplier: 1, constant: 50)
        
        view.addConstraints([leading, trailing, height, top])
        
        passwordTextField.backgroundColor = .brown
        
        setLayoutAnchor()
        
    }

    // NSLayoutAnchor
    func setLayoutAnchor() {
        
        view.addSubview(signButton)
        signButton.translatesAutoresizingMaskIntoConstraints = false // AutoResizingMask 꺼줘야함

        signButton.setTitle("화면이동", for: .normal)
        signButton.backgroundColor = .blue

        signButton.addTarget(self, action: #selector(signButtonClicked), for: .touchUpInside)

        NSLayoutConstraint.activate([
            signButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: 0),
            signButton.widthAnchor.constraint(equalToConstant: 300),
            signButton.heightAnchor.constraint(equalToConstant: 50),
            signButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
    }
    
    @objc func signButtonClicked() {
        
        let vc = Example3ViewController()
        let nav = UINavigationController(rootViewController: vc)
        
        present(nav, animated: true)
        
    }
    

    
}

