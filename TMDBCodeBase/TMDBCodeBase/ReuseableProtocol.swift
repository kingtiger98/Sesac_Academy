//
//  ReuseableProtocol.swift
//  TMDBCodeBase
//
//  Created by 황재하 on 8/28/23.
//
import UIKit

protocol ReuseableViewProtocol{
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
