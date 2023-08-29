//
//  BaseTableViewCell.swift
//  TMDBCodeBase
//
//  Created by 황재하 on 8/29/23.
//

import UIKit

class BaseTableViewCell: UITableViewCell{
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setConfigure()
        setConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setConfigure() {
        
    }
    
    func setConstraint() {
        
    }
    
}
