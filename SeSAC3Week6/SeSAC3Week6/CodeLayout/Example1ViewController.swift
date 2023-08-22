//
//  Example1ViewController.swift
//  SeSAC3Week6
//
//  Created by 황재하 on 8/22/23.
//

import UIKit
import SnapKit

class Example1ViewController: UIViewController {

    let grayView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    let titleTextfield = {
        let view = UITextField()
        view.placeholder = "제목을 입력해주세요"
        view.textAlignment = .center
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.black.cgColor
        return view
    }()
    
    let dateTextfield = {
        let view = UITextField()
        view.placeholder = "날짜를 입력해주세요"
        view.textAlignment = .center
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.black.cgColor
        return view
    }()
    
    let contentTextField = {
        let view = UITextField()
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.black.cgColor
        return view
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        [grayView, titleTextfield, dateTextfield, contentTextField].forEach {
            view.addSubview($0)
        }
        
        setConfigureAutoLayout()

    }

    
    func setConfigureAutoLayout() {
        grayView.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(view).inset(20)
            make.height.equalTo(view).multipliedBy(0.3)
            
        }
        
        titleTextfield.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(grayView)
            make.top.equalTo(grayView.snp_bottomMargin).offset(30)
            make.height.equalTo(view).multipliedBy(0.07)
        }
        
        dateTextfield.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(grayView)
            make.top.equalTo(titleTextfield.snp_bottomMargin).offset(30)
            make.height.equalTo(view).multipliedBy(0.07)
        }
        
        contentTextField.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(grayView)
            make.top.equalTo(dateTextfield.snp_bottomMargin).offset(30)
            make.height.equalTo(view).multipliedBy(0.43)

        }
    }
    
}
