//
//  ProfileEditViewController.swift
//  TMDBCodeBase
//
//  Created by 황재하 on 8/30/23.
//

import UIKit

class ProfileEditViewController: BaseViewController{
    
    let mainView = ProfileEditView()
    
    var receviedContents = ""
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        print(#function)
        super.viewDidLoad()
        setData()
        
        // 2_1 : Notification을 통한 값 역 전달하기
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "완료", style: .plain, target: self, action: #selector(profileValueNotificationPost(notification:)))
        
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print(#function)
    }
    
    // 2_2 : post _ Notification 뿌리기
    @objc func profileValueNotificationPost(notification: NSNotification) {
        guard let text = mainView.editTextField.text else { return }
        NotificationCenter.default.post(name: Notification.Name("setValue"), object: nil, userInfo: ["profileValue": text])
        print(text)
        
        navigationController?.popViewController(animated: true)
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // 텍스트필드에 커서바로 할당 _ 키보드 올라옴
        mainView.editTextField.becomeFirstResponder()
    }
    
    override func setConfigure() {
        super.setConfigure()
        
    
    }
    
    override func setConstraints() {
        super.setConstraints()
        
        
    }
    
    func setData() {
        mainView.editTextField.placeholder = receviedContents
        navigationItem.title = receviedContents
    }
    
}



        
