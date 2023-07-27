//
//  ExtensionUse.swift
//  SeSACWeek3
//
//  Created by 황재하 on 7/27/23.
//

import UIKit

// UITableViewController를 사용하는 어떤 곳이든 showAlert()를 사용할 수 있게 됨!
extension UITableViewController {
    
    func showAlert() {
        let alert = UIAlertController(title: "경고", message: "경고메세지", preferredStyle: .alert)
        
        let ok = UIAlertAction(title: "확인", style: .default)
        let cancle = UIAlertAction(title: "취소", style: .cancel)
        
        alert.addAction(ok)
        alert.addAction(cancle)
        
        present(alert, animated: true)
    }
    
}


extension UILabel {
    
    func confiureTitleText() {
        self.textColor = .red
        self.font = .boldSystemFont(ofSize: 20)
        self.textAlignment = .center
    }
    
    
    
}
