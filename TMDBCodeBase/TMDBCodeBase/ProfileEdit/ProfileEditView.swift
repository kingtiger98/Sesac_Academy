//
//  ProfileEditView.swift
//  TMDBCodeBase
//
//  Created by 황재하 on 8/31/23.
//

import UIKit
import TextFieldEffects

class ProfileEditView: BaseView{
    

    let editTextField = {
        let view = HoshiTextField()
        view.backgroundColor = .systemGray6
        view.placeholderColor = .black
        return view
    }()
    
    override func setConfigure() {
        super.setConfigure()
        
        addSubview(editTextField)
        
    }
    
    override func setConstraints() {
        super.setConstraints()
        editTextField.snp.makeConstraints { make in
            make.horizontalEdges.top.equalTo(self.safeAreaLayoutGuide).inset(8)
            make.height.equalTo(50)
            
        }
    }
    
    override func setData() {
        super.setData()
        
        
    }
    
    
    
}







