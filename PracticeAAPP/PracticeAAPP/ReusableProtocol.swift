//
//  ReuseableProtocel.swift
//  PracticeAAPP
//
//  Created by 황재하 on 8/20/23.
//

import Foundation
import UIKit


protocol Reusable {
    static var identifier: String { get }
}

extension UIViewController: Reusable {
    static var identifier: String {
        return String(describing: self)
    }
}

extension UITableViewCell: Reusable {
    static var identifier: String {
        return String(describing: self)
    }
}

extension UICollectionViewCell: Reusable {
    static var identifier: String {
        return String(describing: self)
    }
}


