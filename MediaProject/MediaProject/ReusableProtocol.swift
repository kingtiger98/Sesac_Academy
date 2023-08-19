//
//  ReusableProtocol.swift
//  MediaProject
//
//  Created by 황재하 on 8/19/23.
//

import UIKit


protocol Reuseable {
    
    static var identifier: String { get }
    
}

extension UIViewController: Reuseable {
    static var identifier: String {
        return String(describing: self)
    }
    
}

extension UICollectionViewCell: Reuseable {
    static var identifier: String {
        return String(describing: self)
    }

}
