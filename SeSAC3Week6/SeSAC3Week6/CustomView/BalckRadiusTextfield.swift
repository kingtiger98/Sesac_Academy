//
//  BalckRadiusTextfield.swift
//  SeSAC3Week6
//
//  Created by 황재하 on 8/24/23.
//

import UIKit

class BalckRadiusTextfield: UITextField {
    
    // 코드베이스용
    // Interface Builder를 사용하지 않고, UIView를 상속 받은 Custom Class를 코드로 구성할 때 사용되는 초기화 구문
    override init(frame: CGRect) { // UIView에 만들어져 있는 initializer
        super.init(frame: frame)
        setupView()
    }
    
    // 스토리보드용
    // NSCoding이라는 프로토콜에서 생성한 생성자입니다.
    // XIB -> NIB 변환 과정에서 객체 생성 시 필요한 init 구문 (storyboard)
    // Interface Builder에서 생성된 뷰들이 초기화될 때 실행되는 구문!
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // 코드베이스용, 스토리보드용 둘 다 사용해야함!
    
    func setupView() {
        borderStyle = .none
        layer.borderColor = UIColor.black.cgColor
        layer.borderWidth = 1
        layer.cornerRadius = 8
        textColor = .black
        textAlignment = .center
        font = .boldSystemFont(ofSize: 15)
    }
    
    
}


protocol ExampleProtocol {
    init(name: String)
}

class Mobile: ExampleProtocol {
    
    // required : 프로토콜에서 생성한 생성자라는 뜻
    // required Initializer
    required init(name: String) {

    }
    
    
    
    
}
