//
//  SecondViewController.swift
//  PracticeAAPP
//
//  Created by 황재하 on 9/2/23.
//

import UIKit
import SnapKit

class SecondViewController: UIViewController {

    // 2. delegate
    var delegate: PassDelegate?
    
    
    // 1. Closure
    var completionHandler: ((_ data: String) -> Void)?
    
    
    let newNameField = {
        let textField = UITextField()
        textField.placeholder = "새로운 이름을 입력하세요!"
        return textField
    }()
    
    let doneButton = {
        let button = UIButton()
        button.setTitle("Notification : 확인", for: .normal)
        button.backgroundColor = .blue
        return button
    }()
    
    let doneButton2 = {
        let button = UIButton()
        button.setTitle("delegate : 확인", for: .normal)
        button.backgroundColor = .blue
        return button
    }()
    
    let doneButton3 = {
        let button = UIButton()
        button.setTitle("closure : 확인", for: .normal)
        button.backgroundColor = .blue
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        view.addSubview(newNameField)
        view.addSubview(doneButton)

        newNameField.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(20)
                make.height.equalTo(50)
            }
        
        doneButton.snp.makeConstraints { make in
            make.top.equalTo(newNameField.snp.bottom).offset(8)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.height.equalTo(50)
        }
        
        // 2_2. Notification
        doneButton.addTarget(self, action: #selector(doneButton1Clicked(notification: )), for: .touchUpInside)
        
        
        
        
        
        
        view.addSubview(doneButton2)
        doneButton2.snp.makeConstraints { make in
            make.top.equalTo(doneButton.snp.bottom).offset(8)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.height.equalTo(50)
        }
        
        doneButton2.addTarget(self, action: #selector(doneButton2Clicked), for: .touchUpInside)
        
        
        
        
        
        
        view.addSubview(doneButton3)
        doneButton3.snp.makeConstraints { make in
            make.top.equalTo(doneButton2.snp.bottom).offset(8)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.height.equalTo(50)
        }
        
        doneButton3.addTarget(self, action: #selector(doneButton3Clicked), for: .touchUpInside)
        
    }
    // 2_1. Notification : Post
    @objc func doneButton1Clicked(notification: NSNotification){
        
        NotificationCenter.default.post(name: Notification.Name("setValue"), object: nil, userInfo: ["name": newNameField.text!])
        
        dismiss(animated: true)
    }

    
    // 3. delegate
    @objc func doneButton2Clicked(){
        
        print(newNameField.text!)
        delegate?.newData(text: newNameField.text!)
        
        dismiss(animated: true)
    }
    
    // 2. Closure
    @objc func doneButton3Clicked(){
        
        print(newNameField.text!)
        
        completionHandler?(newNameField.text!)
        
        dismiss(animated: true)
    }

    
}
