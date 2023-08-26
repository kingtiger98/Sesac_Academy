//
//  WhiteBoldLabel.swift
//  SeSAC3Week6
//
//  Created by 황재하 on 8/26/23.
//

import UIKit

class WhiteBoldLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setLabel(title: String) -> UILabel {
        let label = UILabel()
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 14)
        label.text = "\(title)"
        
        return label
    }
    
    
}
