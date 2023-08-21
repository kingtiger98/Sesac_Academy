//
//  SeSACButton.swift
//  SeSAC3Week5
//
//  Created by 황재하 on 8/21/23.
//

import UIKit

@IBDesignable //*** 오류 나서 안될 수도 있어 _ 실행은 잘 될거야
class SeSACButton: UIButton {
    
    // 연산 프로퍼티
    @IBInspectable //***
    var hwang: CGFloat {
        get { return layer.cornerRadius }
        set { layer.cornerRadius = newValue }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        get { return layer.borderWidth }
        set { layer.borderWidth = newValue }
    }
    
    @IBInspectable var borderColor: UIColor {
        get { return UIColor(cgColor: layer.borderColor!) }
        set { layer.borderColor = newValue.cgColor }
    }
    
    
}
