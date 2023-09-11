//
//  ResuableProtocol.swift
//  ShoppingListHJH
//
//  Created by 황재하 on 9/8/23.
//

import UIKit

// 각 뷰의 identifier를 실수없게 얻기위해 프토콜을 사용
protocol ReuseableViewProtocol{
    // identifier를 호출하면 ReuseableViewProtocol를 채택한 클래스의 클래스명을 문자열로 가져옴
    static var identifier: String { get }
}

extension UIViewController{
    static var identifier: String {
        return String(describing: self)
    }
}

extension UICollectionViewCell {
    static var identifier: String {
        return String(describing: self)
    }
}

extension UITableViewCell{
    static var identifier: String {
        return String(describing: self)
    }
}

