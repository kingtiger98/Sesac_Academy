//
//  ProfileView.swift
//  TMDBCodeBase
//
//  Created by 황재하 on 8/30/23.
//

import UIKit

class ProfileView: BaseView{
    
    let settingStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 4
        view.alignment = .fill
        view.distribution = .fill
        return view
    }()
    
    let nameTextButton = {
        let view = UIButton()
        view.setTitleColor(UIColor.black, for: .normal)
        view.contentHorizontalAlignment = .left
        view.setTitle("이름", for: .normal)
        return view
    }()
    
    let nickNameTextButton = {
        let view = UIButton()
        view.setTitleColor(UIColor.black, for: .normal)
        view.contentHorizontalAlignment = .left
        view.setTitle("사용자 이름        ", for: .normal)
        return view
    }()
    
    let settingStackView2 = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 8
        view.alignment = .leading
        view.distribution = .fill
        return view
    }()
    
    let nameTextLabel = {
        let view = UILabel()
        view.textColor = .lightGray
        view.text = "Hwang"
        return view
    }()
    
    let nickNameTextLabel = {
        let view = UILabel()
        view.textColor = .lightGray
        view.text = "Hwang Hwang"
        return view
    }()
    
    let settingStackView3 = {
        let view = UIStackView()
        view.axis = .horizontal
        view.spacing = 8
        view.alignment = .fill
        view.distribution = .fill
        return view
    }()
    
    override func setConfigure() {
        super.setConfigure()

        settingStackView.addArrangedSubview(nameTextButton)
        settingStackView.addArrangedSubview(nickNameTextButton)
        addSubview(settingStackView)

        settingStackView2.addArrangedSubview(nameTextLabel)
        settingStackView2.addArrangedSubview(nickNameTextLabel)
        addSubview(settingStackView2)
        
        settingStackView3.addArrangedSubview(settingStackView)
        settingStackView3.addArrangedSubview(settingStackView2)
        addSubview(settingStackView3)
        
    }
    

    
    override func setConstraints() {
        super.setConstraints()
        
        settingStackView3.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(self.safeAreaLayoutGuide).inset(12)
            make.height.equalTo(80)
        }
        settingStackView2.snp.makeConstraints { make in
            make.bottom.equalTo(settingStackView3.snp.bottom).offset(-10)
        }

    }
    
}
