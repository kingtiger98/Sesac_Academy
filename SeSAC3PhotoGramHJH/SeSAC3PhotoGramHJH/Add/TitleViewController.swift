//
//  TitleViewController.swift
//  SeSAC3PhotoGramHJH
//
//  Created by 황재하 on 8/29/23.
//

import UIKit

class TitleViewController: BaseViewController{
    
    let textField = {
        let view = UITextField()
        view.placeholder = "제목을 입력해주세요"
        return view
    }()
    
    // 1. Closer 값 전달하기
    var completionHandler: ((String, Int, Bool) -> Void)?
    var completionHandler2: ((String) -> Void)?

    
    deinit {
        print("deinit", self)
    }
    
    
    override func configureView() {
        super.configureView()
        
        view.addSubview(textField)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "완료", style: .done, target: self, action: #selector(doneButtonClicked))
    }
    
    @objc func doneButtonClicked() {
        completionHandler?(textField.text!, 90, false)
        
        navigationController?.popViewController(animated: true)
    }
    
    override func setConstraints() {
        super.setConstraints()
        textField.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(10)
            make.height.equalTo(50)
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        // 2. Closer 값 전달하기
        // 옵셔널 타입함수로 옵셔널 체이닝
        completionHandler?(textField.text!, 100, true)

    }
    
}
