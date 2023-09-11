//
//  String+Extension.swift
//  UnsplashProject
//
//  Created by 황재하 on 9/11/23.
//

import Foundation

extension String{

    var localized: String {
        return  NSLocalizedString(self, comment: "")
    }
    
    func localized(number: Int) -> String {
        return String(format: self.localized, number)
    }
    
}

//nicknameTextField.placeholder = NSLocalizedString("nickname_placeholder", comment: "")
//
//let value = NSLocalizedString("nickname_result", comment: "")
//resultLabel.text = String(format: value, "고래밥", "다마고치", "컹쓰")
