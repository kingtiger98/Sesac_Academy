//
//  BaseView.swift
//  ShoppingListHJH
//
//  Created by 황재하 on 9/8/23.
//

import UIKit
import SnapKit
import Kingfisher
import RealmSwift

class BaseView: UIView{
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {}
    
    func setConstraints() {}
    
}
