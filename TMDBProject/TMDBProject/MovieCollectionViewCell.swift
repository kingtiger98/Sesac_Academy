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
    

    func configureCell(){
        backgroundColor = .none
        layer.masksToBounds = true
        layer.cornerRadius = 5.0
    }
    
    

}
