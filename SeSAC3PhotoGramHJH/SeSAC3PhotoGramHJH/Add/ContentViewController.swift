//
//  TitleViewController.swift
//  SeSAC3PhotoGramHJH
//
//  Created by 황재하 on 8/29/23.
//

import UIKit

class ContentViewController: BaseViewController{
    
    let textView = {
        let view = UITextView()
        view.backgroundColor = .darkGray
        return view
    }()
    
    // 1. Closer 값 전달하기
    var completionHandler2: ((String) -> Void)?

    override func configureView() {
        super.configureView()
        
        view.addSubview(textView)
    }
    
    override func setConstraints() {
        super.setConstraints()
        textView.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(10)
            make.height.equalTo(300)
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        completionHandler2?(textView.text!)

    }
    
}
