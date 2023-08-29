//
//  BaseView.swift
//  TMDBCodeBase
//
//  Created by 황재하 on 8/28/23.
//

import UIKit

class BaseView: UIView{
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setConfigure()
        setConstraints()
        setData()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setConfigure() {
        
    }
    
    func setConstraints() {
        
    }
    
    func setData(){
        
    }
}
