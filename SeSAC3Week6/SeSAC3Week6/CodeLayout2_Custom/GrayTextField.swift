//
//  GrayTextField.swift
//  SeSAC3Week6
//
//  Created by 황재하 on 8/26/23.
//

import UIKit

class GrayTextField: UITextField{
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setTextfield(placeholderText: String) {
        placeholder = "\(placeholderText)"
        textColor = .white
        backgroundColor = .darkGray
        layer.cornerRadius = 5
        textAlignment = .center
        setPlaceholder(color: UIColor.white)
    }
    
    func setPlaceholder(color: UIColor) {
        guard let string = self.placeholder else {
            return
        }
        attributedPlaceholder = NSAttributedString(string: string, attributes: [.foregroundColor: color])
    }
    
    
}
