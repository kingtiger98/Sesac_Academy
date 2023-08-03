//
//  BookCollectionViewCell.swift
//  BOOKWARM
//
//  Created by 황재하 on 7/31/23.
//

import UIKit

class BookCollectionViewCell: UICollectionViewCell {

    static let identifier = "BookCollectionViewCell"
    
    @IBOutlet weak var movieNameLabel: UILabel!
    @IBOutlet weak var movieRateLabel: UILabel!
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var likeButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }
    
    func configureCell(row: Movie) {
        movieNameLabel.text = row.title
        movieRateLabel.text = "\(row.rate)"
        movieImageView.image = UIImage(named: "\(row.title)")
        contentView.backgroundColor = row.color
        layer.cornerRadius = 15
    }
    
    
}
