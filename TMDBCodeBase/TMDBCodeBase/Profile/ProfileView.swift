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
    
    let testlabel = {
        let view = UILabel()
        view.text = "떠주세요"
        view.textColor = .white
        view.backgroundColor = .blue
        return view
    }()
    
    deinit {
        
    }
    
    override func setConfigure() {
        super.setConfigure()
        addSubview(profileTableView)
        
        // test
        addSubview(testlabel)
    }
    
    override func setConstraints() {
        super.setConstraints()
        
        profileTableView.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
        
        // test
        testlabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.size.equalTo(200)
        }

    }
    
}
