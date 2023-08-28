//
//  AddView.swift
//  SeSAC3PhotoGramHJH
//
//  Created by 황재하 on 8/28/23.
//

import UIKit

class AddView: BaseView{
    
    let photoImageView = {
        let view = UIImageView()
        view.backgroundColor = .lightGray
        view.contentMode = .scaleAspectFill
        return view
    }()
    
    let searchButton = {
        let view = UIButton()
        view.backgroundColor = .systemGreen
        return view
    }()
    
    override func configureView() {
        super.configureView()
        
        addSubview(photoImageView)
        addSubview(searchButton)
        
    }
    
    override func setConstraints() {
        super.setConstraints()
        
        photoImageView.snp.makeConstraints { make in
            //make.topMargin.leadingMargin.trailingMargin.equalTo(view.safeAreaLayoutGuide).inset(10)
            make.top.horizontalEdges.equalTo(self.safeAreaLayoutGuide).inset(10)
            make.height.equalTo(self).multipliedBy(0.3)
        }
        
        searchButton.snp.makeConstraints { make in
            make.size.equalTo(50)
            make.bottom.trailing.equalTo(photoImageView)
        }
        
    }
    
    
}

