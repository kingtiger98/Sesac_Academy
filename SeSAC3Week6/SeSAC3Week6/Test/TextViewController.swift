//
//  TextViewController.swift
//  SeSAC3Week6
//
//  Created by 황재하 on 8/22/23.
//

import UIKit
import SnapKit

class TextViewController: UIViewController {

    // 방법1_1 : 함수를 타입메서드로 선언 static
//    func setImageView() -> UIImageView {
//        let view = UIImageView()
//        view.backgroundColor = .cyan
//        view.contentMode = .scaleAspectFill
//
//        return view
//    }
    
    // 방법1_2 : 타입 메서드 바로 사용
    // var photoImageView = setImageView()
    

    // 방법2 : 초기화 시점을 미뤄줌 // 타입메서드 아님
    // lazy var photoImageView = setImageView()
    
    
    // 방법3 : 이름없는 함수{클로저 구문 활용}() _ 제일 좋은 방법인듯!!!***
    let  photoImageView = {
        let view = UIImageView()
        view.backgroundColor = .cyan
        view.contentMode = .scaleAspectFill
        return view
    }()
    
    
    let titleTextField = {
        let view = UITextField()
        view.borderStyle = .none
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 1
        view.placeholder = "제목을 입력해주세요"
        view.textAlignment = .center
        view.font = .boldSystemFont(ofSize: 15)
        return view
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        // view에 객체 추가하기
        //view.addSubview(photoImageView)
        //view.addSubview(titleTextField)
        
        // view에 객체 추가하기 : for
//        for item in [photoImageView, titleTextField]{
//            view.addSubview(item)
//        }
        
        // view에 객체 추가하기 : forEach
        [photoImageView, titleTextField].forEach {
            view.addSubview($0)
        }
        
        setupConstraints()

    }
    
    func setupConstraints() {
        
        photoImageView.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(view).multipliedBy(0.3)
        }
        
        titleTextField.snp.makeConstraints { make in
            make.top.equalTo(photoImageView.snp.bottom).offset(20)
            make.leadingMargin.equalTo(20) // == make.leading.equalTo(view).inset(20)
            
            make.trailingMargin.equalTo(-20)
            make.height.equalTo(50)
        }
        
    }
    

    


}
