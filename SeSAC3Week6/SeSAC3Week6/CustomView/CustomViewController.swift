//
//  CustomViewController.swift
//  SeSAC3Week6
//
//  Created by 황재하 on 8/24/23.
//

import UIKit
import SnapKit

class CustomViewController: UIViewController {

    let idTextField = {
        let view = BalckRadiusTextfield()
        view.setupView()
        view.placeholder = "아이디을 입력해주세요"
        return view
    }()
    
    let passwordTextField = {
        let view = BalckRadiusTextfield()
        view.placeholder = "비밀번호를 입력해주세요"
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        view.addSubview(idTextField)
        idTextField.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(300)
            make.height.equalTo(50)
        }
        
        view.addSubview(passwordTextField)
        passwordTextField.snp.makeConstraints { make in
            make.center.equalToSuperview().offset(100)
            make.width.equalTo(300)
            make.height.equalTo(50)
        }
        
        
        
    }
    


}
