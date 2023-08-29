//
//  MovieCollectionViewCell.swift
//  TMDBCodeBase
//
//  Created by 황재하 on 8/28/23.
//

import UIKit

class MovieCollectionViewCell: BaseCollectionViewCell {
    
    
    let posterImageView = {
        let view = UIImageView()
        view.backgroundColor = .brown
        view.contentMode = .scaleToFill
        view.layer.cornerRadius = 5
        view.clipsToBounds = true
        return view
    }()
    
    override func setConfigure() {
        contentView.addSubview(posterImageView)
    }
    
    override func setConstraints() {
        posterImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
}
