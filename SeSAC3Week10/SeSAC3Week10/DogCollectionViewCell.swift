//
//  DogCollectionViewCell.swift
//  SeSAC3Week10
//
//  Created by 황재하 on 9/24/23.
//

import UIKit

class DogCollectionViewCell: UICollectionViewCell{
    
    let imageView = UIImageView()
    let label = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(){
        contentView.addSubview(imageView)
        contentView.addSubview(label)

        imageView.backgroundColor = .lightGray
        imageView.layer.cornerRadius = 8
        imageView.snp.makeConstraints { make in
            make.edges.equalTo(contentView)
        }
        
        label.snp.makeConstraints { make in
            make.center.equalTo(contentView)
        }

        
    }
    
    
}
