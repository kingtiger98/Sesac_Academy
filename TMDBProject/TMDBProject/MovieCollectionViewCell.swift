//
//  MovieCollectionViewCell.swift
//  TMDBProject
//
//  Created by 황재하 on 8/12/23.
//

import UIKit
import Alamofire
import SwiftyJSON
import Kingfisher

class MovieCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var originalTitleLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    func configureCell(){
        backgroundColor = .lightGray
        layer.masksToBounds = true
        layer.cornerRadius = 5.0
    }
    
    

}
