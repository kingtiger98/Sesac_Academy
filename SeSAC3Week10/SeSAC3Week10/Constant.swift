//
//  Constant.swift
//  SeSAC3Week10
//
//  Created by 황재하 on 9/22/23.
//

import UIKit


enum Constant{
    
    enum Text{
        static let title = UIColor(named: "title")!
    }
    
    enum Image{
        static let star = UIImage(named: "star")!.withRenderingMode(.alwaysTemplate).withTintColor(Constant.Text.title)
    }
    
    
}
