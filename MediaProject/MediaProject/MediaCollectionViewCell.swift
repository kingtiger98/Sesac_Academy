//
//  MediaCollectionViewCell.swift
//  MediaProject
//
//  Created by 황재하 on 8/19/23.
//

import UIKit
import Alamofire
import Kingfisher

class MediaCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var similarMovieImageView: UIImageView!
    
    func configureMediaCollectionViewCell(row: Similar) {
        backgroundColor = .lightGray
        layer.cornerRadius = 5
        let url = URL(string:"https://www.themoviedb.org/t/p/w500" + row.posterPath)
        similarMovieImageView.kf.setImage(with: url)
        
    }
    

}
