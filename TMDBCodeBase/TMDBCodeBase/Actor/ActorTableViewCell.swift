//
//  ActorTableViewCell.swift
//  TMDBCodeBase
//
//  Created by 황재하 on 8/29/23.
//

import UIKit

class ActorTableViewCell: BaseTableViewCell{
    
    let actorImageView = {
        let view = UIImageView()
        view.backgroundColor = .lightGray
        view.contentMode = .scaleToFill
        return view
    }()
    
    let nameStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 0
        view.alignment = .fill
        view.distribution = .fill
        return view
    }()
    
    let actorName = {
        let view = UILabel()
        view.text = "진짜이름"
        view.textColor = .darkGray
        return view
    }()
    
    let characterName = {
        let view = UILabel()
        view.text = "배역이름"
        view.textColor = .lightGray
        return view
    }()
    
    override func setConfigure() {
        super.setConfigure()
        contentView.backgroundColor = .systemGray6
        contentView.addSubview(actorImageView)
        nameStackView.addArrangedSubview(actorName)
        nameStackView.addArrangedSubview(characterName)
        contentView.addSubview(nameStackView)
    }
    
    override func setConstraint() {
        super.setConstraint()
        
        actorImageView.snp.makeConstraints { make in
            make.leading.verticalEdges.equalTo(contentView).inset(4)
            make.width.equalTo(contentView).multipliedBy(0.22)
        }
        
        nameStackView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(actorImageView.snp.trailing).offset(8)
            make.trailing.equalTo(contentView).inset(8)
            make.verticalEdges.equalTo(contentView).inset(30)
        }

    }
    
    func ConfigureActorTableViewCell(row: Cast){
        actorName.text = row.originalName
        characterName.text = row.character
        
        let url = URL(string: "https://www.themoviedb.org/t/p/w500" + (row.profilePath ?? ""))
        actorImageView.kf.setImage(with: url)
    }
    
    
}
