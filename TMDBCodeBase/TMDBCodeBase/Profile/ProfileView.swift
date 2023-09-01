//
//  ProfileView.swift
//  TMDBCodeBase
//
//  Created by 황재하 on 8/30/23.
//

import UIKit

class ProfileView: BaseView{
    
    let profileTableView = {
        let view = UITableView()
        view.register(ProfileTableViewCell.self, forCellReuseIdentifier: "ProfileTableViewCell")
        view.rowHeight = 50
        return view
    }()
    
    
    
    
    deinit {
        
        
        
    }
    
    
    
    override func setConfigure() {
        super.setConfigure()
        addSubview(profileTableView)
        
    }
    
    override func setConstraints() {
        super.setConstraints()
        
        profileTableView.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }

    }
    
}
