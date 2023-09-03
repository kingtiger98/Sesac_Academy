//
//  ViewController.swift
//  PracticeAAPP
//
//  Created by 황재하 on 8/20/23.
//

import UIKit
import Alamofire
import SnapKit

// 1_1. delegate 실질적으로 SecondViewController에 있다고 생각해랑
protocol PassDelegate{
    func newData(text: String)
}

class ViewController: UIViewController {
    
    let nameLabel = {
        let label = UILabel()
        label.text = "이름 : Notification"
        return label
    }()
    
    let moveButton = {
        let button = UIButton()
        button.setTitle("다음 뷰로 : Notification", for: .normal)
        button.backgroundColor = .blue
        return button
    }()
    
    
    let nameLabel2 = {
        let label = UILabel()
        label.text = "이름 : Delegate"
        return label
    }()
    
    let moveButton2 = {
        let button = UIButton()
        button.setTitle("다음 뷰로 : Delegate", for: .normal)
        button.backgroundColor = .blue
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //APIMangerTMDB.shared.requestTrendData(type: .movie) { data in
        //    print(data)
        //}
        
        // 1_1. Notification : 옵저버 등록
        NotificationCenter.default.addObserver(self, selector: #selector(saveButtonNotificationObserver(notification: )), name: Notification.Name("setValue"), object: nil)
        
        view.addSubview(nameLabel)
        view.addSubview(moveButton)
        nameLabel.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(30)
            make.height.equalTo(50)
        }
        moveButton.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(10)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(30)
            make.height.equalTo(50)
        }
        moveButton.addTarget(self, action: #selector(moveButtonClicked), for: .touchUpInside)
        
        
        view.addSubview(nameLabel2)
        view.addSubview(moveButton2)
        nameLabel2.snp.makeConstraints { make in
            make.top.equalTo(moveButton.snp.bottom).offset(50)
            make.horizontalEdges.equalToSuperview().inset(30)
        }
        moveButton2.snp.makeConstraints { make in
            make.top.equalTo(nameLabel2.snp.bottom).offset(20)
            make.horizontalEdges.equalToSuperview().inset(30)
            make.height.equalTo(50)
        }
        
        moveButton2.addTarget(self, action: #selector(moveButton2Clicked), for: .touchUpInside)
    
    }
    
    // 1_2. Notification : Post된 값을 사용할 준비
    @objc func saveButtonNotificationObserver(notification: NSNotification){
        if let name = notification.userInfo?["name"] as? String {
            self.nameLabel.text = name
            print(name)
        }
    }

    @objc func moveButtonClicked(){
        present(SecondViewController(), animated: true)
    }

    @objc func moveButton2Clicked(){
        let vc = SecondViewController()
        // 4. delegate
        vc.delegate = self
        present(vc, animated: true)
    }
    
}

// 1_2. delegate
extension ViewController: PassDelegate{
    func newData(text: String) {
        nameLabel2.text = text
    }
}

