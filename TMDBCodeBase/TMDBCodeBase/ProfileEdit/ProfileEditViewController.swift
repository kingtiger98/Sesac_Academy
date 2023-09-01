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
        super.viewDidLoad()
        setData()
        
        NotificationCenter.default.post(name: <#T##NSNotification.Name#>, object: <#T##Any?#>, userInfo: <#T##[AnyHashable : Any]?#>)
        
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
