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
    
    let typeLabel = {
        let label = UILabel()
        label.backgroundColor = .systemGray6
        label.textColor = .darkGray
        label.text = "장르"
        return label
    }()
     
    override func setConfigure() {
        contentView.addSubview(posterImageView)
        contentView.addSubview(typeLabel)
    }
    
    override func setConstraints() {
        posterImageView.snp.makeConstraints { make in
            make.horizontalEdges.top.equalToSuperview()
            make.bottom.equalTo(typeLabel.snp.top)
        }
        typeLabel.snp.makeConstraints { make in
            make.horizontalEdges.bottom.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.1)
        }
    }
    
    func setTypeConfiguer(type: String, color: CGColor){
        typeLabel.text = " \(type)"
        typeLabel.textColor = .purple
        typeLabel.layer.borderColor = color
        typeLabel.layer.borderWidth = 2
        typeLabel.layer.cornerRadius = 5
        typeLabel.clipsToBounds = true
        posterImageView.layer.borderColor = color
        posterImageView.layer.borderWidth = 1
    }
    

    
}
