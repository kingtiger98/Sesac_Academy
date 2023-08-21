//
//  ReuseableViewProtocol.swift
//  TMDBProject
//
//  Created by 황재하 on 8/13/23.
//

import Foundation
import UIKit

protocol ReuseableViewProtocol{
    static var identifier: String { get }
}

extension UIViewController{
    static var identifier: String {
        return String(describing: self)
    }
}

//extension UICollectionViewCell {
//    static var identifier: String {
//        return String(describing: self)
//    }
//}

extension UICollectionReusableView {
    static var identifier: String {
        return String(describing: self)
    }
}

extension UITableViewCell{
    static var identifier: String {
        return String(describing: self)
    }
}
