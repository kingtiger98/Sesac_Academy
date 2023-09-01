//
//  DateViewController.swift
//  SeSAC3PhotoGramHJH
//
//  Created by 황재하 on 8/29/23.
//

import UIKit

class  DateViewController: BaseViewController{
    
    let mainView = DateView()
    
    // 2. Protocol 값 전달
    var delegate: PassDataDelegate?
    
    override func loadView() {
        self.view = mainView
    }
    
    deinit {
        print("deinit", self)
    }
    
    // 3. Protocol 값 전달
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        delegate?.receiveData(date: mainView.picker.date)
    }
    
    
}
