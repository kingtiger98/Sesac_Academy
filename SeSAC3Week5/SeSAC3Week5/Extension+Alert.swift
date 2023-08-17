//
//  Extension+Alert.swift
//  SeSAC3Week5
//
//  Created by 황재하 on 8/17/23.
//

import UIKit

extension UIViewController {
    
    func showAlert(title: String, message: String, button: String, completionHandler: @escaping () -> Void ) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let button = UIAlertAction(title: title, style: .default) { action in

            completionHandler()
            
        }
        let cancle = UIAlertAction(title: "취소", style: .cancel)
        
        alert.addAction(button)
        alert.addAction(cancle)

        self.present(alert, animated: true)
        
    }
    
}
