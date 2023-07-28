//
//  CustomTableViewCell.swift
//  SeSACWeek3
//
//  Created by 황재하 on 7/28/23.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    
    static let idenrifier = "CustomTableViewCell"
    
    @IBOutlet weak var backView: UIView!
    
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var subLabel: UILabel!
    
    @IBOutlet weak var checkImageView: UIImageView!
    @IBOutlet weak var likeButton: UIButton!

 
    
    // ***
    func configureCell(row: ToDo) {
        mainLabel.text = "\(row.main)"
        subLabel.text = "\(row.sub)"
        
        if row.done == true {
            checkImageView.image = UIImage(systemName: "checkmark.square.fill")
        } else {
            checkImageView.image = UIImage(systemName: "checkmark.square")
        }

        if row.like == true {
            likeButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
        } else {
            likeButton.setImage(UIImage(systemName: "star"), for: .normal)
        }
    }
    
    
    
    
    
}
