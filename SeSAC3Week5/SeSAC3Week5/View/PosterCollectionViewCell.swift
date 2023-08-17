//
//  PosterCollectionViewCell.swift
//  SeSAC3Week5
//
//  Created by 황재하 on 8/16/23.
//

import UIKit

class PosterCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var posterImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    // 재사용 될 준비를 해주는거야, 이전 흔적을 지워줌
    override func prepareForReuse() {
        super.prepareForReuse()
    
        posterImageView.image = nil
        
    }
    
}
