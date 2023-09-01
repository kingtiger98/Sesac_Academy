//
//  profileTableViewCell.swift
//  TMDBCodeBase
//
//  Created by 황재하 on 8/31/23.
//

import UIKit

class ProfileTableViewCell: BaseTableViewCell{
    
    let firstLabel1 = {
        let label = UILabel()
        label.text = "이름"
        label.textColor = .black
        return label
    }()
    
    let firstLabel2 = {
        let label = UILabel()
        label.text = "Hwnag"
        label.textColor = .lightGray
        return label
    }()
        
    override func setConfigure() {
        super.setConfigure()
        addSubview(firstLabel1)
        addSubview(firstLabel2)
    }
    
    override func setConstraint() {
        super.setConstraint()
        
        firstLabel1.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.3)
            make.leading.verticalEdges.equalToSuperview().inset(8)
        }
        
        firstLabel2.snp.makeConstraints { make in
            make.verticalEdges.trailing.equalToSuperview()
            make.leading.equalTo(firstLabel1.snp.trailing)
        }
        
    }
    
}
