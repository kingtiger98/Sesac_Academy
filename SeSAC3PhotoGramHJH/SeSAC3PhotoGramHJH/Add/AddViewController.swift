//
//  AddViewController.swift
//  SeSAC3PhotoGramHJH
//
//  Created by 황재하 on 8/28/23.
//

import UIKit
import SeSACPhotoFramework

// 1. Protocol 값 전달 _ 실질적으로 DateViewController에 있다고 생각해랑
protocol PassDataDelegate{
    func receiveData(date: Date)
}

// 1. Protocol 값 전달 _ 실질적으로 SearchViewController에 있다고 생각해랑
protocol PassImageDelegate{
    func receiveImage(imageName: String)
}

class AddViewController: BaseViewController {
    
    let mainView = AddView()
    
    // viewDidLoad보다 먼저 호출됨, super 메서드 호출 xxx
    override func loadView() {
        // 뷰 교체
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ClassOpenExample.publicExample()
        ClassPublicExample.publicExample()
        // ClassPublicExample.internalExample()
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(selectImageNotificationObserver), name: .selectImage, object: nil)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print(#function)
        NotificationCenter.default.addObserver(self, selector: #selector(selectImageNotificationObserver), name: .selectImage, object: nil)
        
        sesacShowActivityViewController(image: UIImage(systemName: "star")!, url: "hello", text: "hi")
        
    }
    
    
    // Notification이 중복으로 실해되지 않게 뷰가 사라지면 Notification삭제
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        NotificationCenter.default.removeObserver(self, name: .selectImage, object: nil)
    }
    
    
    
    // 역전달 값 받아서 사용
    @objc func selectImageNotificationObserver(notification: NSNotification) {
        print(#function)
        // print(notification.userInfo?["name"])
        // print(notification.userInfo?["sample"])
        
        if let name = notification.userInfo?["name"] as? String {
            mainView.photoImageView.image = UIImage(systemName: name)
        }
        
    }
    
    
    @objc func searchButtonClicked(){
        
        let word = ["Apple", "Banana", "Cookie", "Cake", "Sky"]
        
        NotificationCenter.default.post(name: NSNotification.Name("RecommandKeyword"), object: nil, userInfo: ["word": word.randomElement()!])
                                        
        navigationController?.pushViewController(SearchViewController(), animated: true)
    }
    
    override func configureView(){
        super.configureView()
        print("Add configureView()")
        
        mainView.searchButton.addTarget(self, action: #selector(searchButtonClicked), for: .touchUpInside)
        mainView.dateButton.addTarget(self, action: #selector(dateButtonClicked), for: .touchUpInside)
        mainView.searchProtocolButton.addTarget(self, action: #selector(searchProtocolButtonClicked), for: .touchUpInside)
        mainView.titleButton.addTarget(self, action: #selector(titleButtonClicked), for: .touchUpInside)
        mainView.contentsButton.addTarget(self, action: #selector(titleButton2Clicked), for: .touchUpInside)

    }
    
    @objc func dateButtonClicked(){
        // 5. Protocol 값 전달
        // 현재 클래스에 delegate 위임하기
        let vc = DateViewController()
        vc.delegate = self
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @objc func searchProtocolButtonClicked() {
        // 5. Protocol 값 전달
        // 현재 클래스에 delegate 위임하기
        let vc = SearchViewController()
        vc.delegate2 = self
        present(vc, animated: true)

    }
    
    @objc func titleButtonClicked() {

        let vc = TitleViewController()
        
        // 3. Closer 값 전달하기
        vc.completionHandler = { title, age, push in
            self.mainView.titleButton.setTitle(title, for: .normal)
            print("completionHandler", age, push)
        }
        
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    @objc func titleButton2Clicked() {

        let vc = ContentViewController()
        
        vc.completionHandler2 = { data in
            self.mainView.contentsButton.setTitle(data, for: .normal)
            print("completionHandler")
        }
        
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    override func setConstraints(){
        super.setConstraints()
        print("Add setConstraints()")
    }
    

}


// 4. Protocol 값 전달
extension AddViewController: PassDataDelegate{
    
    func receiveData(date: Date) {
        mainView.dateButton.setTitle(DateFormatter.convertData(date: date), for: .normal)
    }
    
    
}

// 4. Protocol 값 전달
extension AddViewController: PassImageDelegate{
    
    func receiveImage(imageName: String) {
        mainView.photoImageView.image = UIImage(systemName: "\(imageName)")
    }
    
}
