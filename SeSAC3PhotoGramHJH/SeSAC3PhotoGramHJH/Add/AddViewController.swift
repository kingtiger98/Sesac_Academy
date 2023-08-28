//
//  AddViewController.swift
//  SeSAC3PhotoGramHJH
//
//  Created by 황재하 on 8/28/23.
//

import UIKit
import SnapKit

class AddViewController: BaseViewController {
    
    let mainView = AddView()
    
    // viewDidLoad보다 먼저 호출됨, super 메서드 호출 xxx
    override func loadView() {
        // 뷰 교체
        self.view = mainView
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(selectImageNotificationObserver), name: NSNotification.Name("SelectImage"), object: nil)
        
    }
    
    // 역전달 값 받아서 사용
    @objc func selectImageNotificationObserver(notification: NSNotification) {
        print("selectImageNotificationObserver")
        // print(notification.userInfo?["name"])
        // print(notification.userInfo?["sample"])
        
        if let name = notification.userInfo?["name"] as? String {
            mainView.photoImageView.image = UIImage(systemName: name)
        }
        
    }
    
    
    @objc func searchButtonClicked(){
        
        let word = ["Apple", "Banana", "Cookie", "Cake", "Sky"]
        
        NotificationCenter.default.post(name: NSNotification.Name("RecommandKeyword"), object: nil, userInfo: ["word": word.randomElement()!])
                                        
        present(SearchViewController(), animated: true)
    }
    
    override func configureView(){
        super.configureView()
        print("Add configureView()")
        
        mainView.searchButton.addTarget(self, action: #selector(searchButtonClicked), for: .touchUpInside)
    }
    
    override func setConstraints(){
        super.setConstraints()
        print("Add setConstraints()")
    }
    

}
