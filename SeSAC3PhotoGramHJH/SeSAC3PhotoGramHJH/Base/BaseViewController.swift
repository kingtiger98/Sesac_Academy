//
//  BaseViewController.swift
//  SeSAC3PhotoGramHJH
//
//  Created by 황재하 on 8/28/23.
//

import UIKit
import SnapKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        setConstraints()
    }
    

    func configureView(){ // addSubView
        view.backgroundColor = .white
        print("Base configureView")
        
    }
    
    func setConstraints(){ // 제약조건
        print("Base setConstraints")
    }

}
