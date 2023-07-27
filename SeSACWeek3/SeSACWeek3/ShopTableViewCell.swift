//
//  ShopTableViewCell.swift
//  SeSACWeek3
//
//  Created by 황재하 on 7/27/23.
//

import UIKit

class ShopTableViewCell: UITableViewCell {

    
    @IBOutlet weak var checkButton: UIButton!
    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var shoppingList: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)


    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 3, left: 3, bottom: 3, right: 3))
        contentView.backgroundColor = .systemGroupedBackground
        contentView.layer.cornerRadius = 10
    }

}
