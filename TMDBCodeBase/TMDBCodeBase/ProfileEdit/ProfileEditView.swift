//
//  ProfileEditView.swift
//  TMDBCodeBase
//
//  Created by 황재하 on 8/31/23.
//

import UIKit
import TextFieldEffects

class ProfileEditView: BaseView{
    
    // 프로
    lazy var doneButton = {
        let button = UIBarButtonItem(title: "완료", style: .plain, target: self, action: #selector(profileValueNotificationObserve))
        button.tintColor = .black
        return button
    }()
    
    @objc func profileValueNotificationObserve(notification: NSNotification) {
        
    }
    
    
    
    let editTextField = {
        let view = HoshiTextField()
        view.backgroundColor = .systemGray6
//        view.font = .boldSystemFont(ofSize: 18)
        view.placeholderColor = .black
//        view.placeholder = "이름"
        return view
    }()
    
    override func setConfigure() {
        super.setConfigure()
        
        addSubview(editTextField)
        
    }
    
    override func setConstraints() {
        super.setConstraints()
        editTextField.snp.makeConstraints { make in
            make.horizontalEdges.top.equalTo(self.safeAreaLayoutGuide).inset(8)
            make.height.equalTo(50)
            
        }
    }
    
    override func setData() {
        super.setData()
        
        
    }
    
    
    
}







