//
//  ViewController.swift
//  OneLineDiary
//
//  Created by 황재하 on 7/31/23.
//

import UIKit

class AddViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setBackGroundColor()
        
        title = "추가 화면"
        
        // 코드로 모달창 닫기 버튼 추가
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .plain, target: self, action: #selector(closeButtonClicked))
        navigationItem.leftBarButtonItem?.tintColor = .white // 순서 주의 : 버튼아이템 만들고 색상 지정해줘야 저장됨!
        
    }

    // 코드로 모달창 닫기 버튼 추가
    @objc
    func closeButtonClicked(){
        
        // Present : Dismiss
        // Push : Pop
        // 짝 맞춰주기 주의할 것!
        dismiss(animated: true)
        
    }
    
    

}

