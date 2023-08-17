//
//  ReusableProtocol.swift
//  SeSAC3Week5
//
//  Created by 황재하 on 8/17/23.
//

import UIKit

protocol ReuseableViewProtocol {
    static var identifier: String { get }
}


extension UIViewController { // extension UIViewController: ReuseableViewProtocol {
    static var identifier: String {
        return String(describing: self)
    }
}


extension UITableViewCell { // extension UITableViewCell: ReuseableViewProtocol
    static var identifier: String {
        return String(describing: self)
    }
}

extension UICollectionViewCell {
    static var identifier: String {
        return String(describing: self)
    }
}

extension UICollectionView {
    static var identifier: String {
        return String(describing: self)
    }
}

