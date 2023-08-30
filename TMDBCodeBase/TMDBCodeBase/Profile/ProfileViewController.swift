//
//  ProfileViewController.swift
//  TMDBCodeBase
//
//  Created by 황재하 on 8/30/23.
//

import UIKit

class ProfileViewController: BaseViewController{
    
    let mainView = ProfileView()
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func setConfigure() {
        super.setConfigure()
        
        setNavigationItem()
        
        mainView.nameTextButton.addTarget(self, action: #selector(nameTextButtonClicked), for: .touchUpInside)
    }
    
    override func setConstraints() {
        super.setConstraints()
    }
    
    func setNavigationItem() {
        navigationItem.title = "Movies"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "완료", style: .plain, target: self, action: #selector(doneButtonClicked))
        navigationItem.titleView?.tintColor = .black
        navigationItem.rightBarButtonItem?.tintColor = .black
    }
    
    @objc func doneButtonClicked() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func nameTextButtonClicked(){
        navigationController?.pushViewController(ProfileEditViewController(), animated: true)
    }
}
