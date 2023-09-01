//
//  UIVewController+Extension.swift
//  SeSACPhotoFramework
//
//  Created by 황재하 on 8/29/23.
//

import UIKit

extension UIViewController{
    
    public func sesacShowAlert(title: String, message: String, buttonTitle: String, buttonAction: @escaping (UIAlertAction) -> Void ) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancle = UIAlertAction(title: "취소", style: .cancel)
        let ok = UIAlertAction(title: buttonTitle, style: .default, handler: buttonAction)
        alert.addAction(cancle)
        alert.addAction(ok)
        
        present(alert, animated: true)
    }
        
    public func sesacShowActivityViewController(image: UIImage, url: String, text: String) {
        let vc = UIActivityViewController(activityItems: [image, url, text], applicationActivities: nil)
        vc.excludedActivityTypes = [.mail, .airDrop] // 요소 안보이게 할 것들
        
        present(vc, animated: true)
    }
    
}
