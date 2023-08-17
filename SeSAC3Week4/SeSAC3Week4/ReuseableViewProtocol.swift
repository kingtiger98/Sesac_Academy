//
//  ReuseableViewProtocol.swift
//  SeSAC3Week4
//
//  Created by 황재하 on 8/11/23.
//

import Foundation
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
