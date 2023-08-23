//
//  Example2ViewController.swift
//  SeSAC3Week6
//
//  Created by 황재하 on 8/23/23.
//

import UIKit
import SnapKit

class Example2ViewController: UIViewController {
    
    let backgroundImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "kakaoback")
        return view
    }()
    
    let closeButton = {
        let view = UIButton()
        view.setImage(UIImage(systemName: "xmark"), for: .normal)
        view.tintColor = .lightGray
        return view
    }()
    
    let giftButton = {
        let view = UIButton()
        view.setImage(UIImage(systemName: "gift"), for: .normal)
        view.tintColor = .lightGray
        return view
    }()
    
    let diceButton = {
        let view = UIButton()
        view.setImage(UIImage(systemName: "dice"), for: .normal)
        view.tintColor = .lightGray
        return view
    }()
    
    let settingButton = {
        let view = UIButton()
        view.setImage(UIImage(systemName: "gearshape"), for: .normal)
        view.tintColor = .lightGray
        return view
    }()
    
    // 채팅, 편집, 스토리 들어갈 뷰
    let setView = {
        let view = UIView()
        view.backgroundColor = .none
        return view
    }()
    
    let chatButton = {
        let view = UIButton()
        view.setImage(UIImage(systemName: "message.fill"), for: .normal)
        view.tintColor = .white
        return view
    }()
    
    let editButton = {
        let view = UIButton()
        view.setImage(UIImage(systemName: "pencil"), for: .normal)
        view.tintColor = .white
        return view
    }()
    
    let storyButton = {
        let view = UIButton()
        view.setImage(UIImage(systemName: "camera.fill"), for: .normal)
        view.tintColor = .white
        return view
    }()
    
    let chatLabel = {
        let view = UILabel()
        view.textColor = .white
        view.font = .systemFont(ofSize: 13)
        view.text = "나와의 채팅"
        return view
    }()
    
    let editLabel = {
        let view = UILabel()
        view.textColor = .white
        view.font = .systemFont(ofSize: 13)
        view.text = "프로필 편집"
        return view
    }()
    
    let storyLabel = {
        let view = UILabel()
        view.textColor = .white
        view.font = .systemFont(ofSize: 13)
        view.text = "카카오스토리"
        return view
    }()
    
    
    // 프사, 닉네임 들어갈 뷰
    let profileView = {
        let view = UIView()
        view.backgroundColor = .none
        return view
    }()
    
    let profileImage = {
        let view = UIImageView()
        view.image = UIImage(named: "kakaoprofile")
        view.clipsToBounds = true
        view.layer.cornerRadius = 35
        return view
    }()
    
    let profileName = {
        let view = UILabel()
        view.text = "Hwang"
        view.textColor = .white
        return view
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(backgroundImageView)
        view.addSubview(closeButton)
        view.addSubview(giftButton)
        view.addSubview(diceButton)
        view.addSubview(settingButton)
        
        view.addSubview(profileView)
        view.addSubview(profileImage)
        view.addSubview(profileName)

        view.addSubview(setView)
        view.addSubview(chatButton)
        view.addSubview(editButton)
        view.addSubview(storyButton)
        
        view.addSubview(chatLabel)
        view.addSubview(editLabel)
        view.addSubview(storyLabel)
        
        configureKakaoUISNP()
        
    }
    
    func configureKakaoUISNP(){
        backgroundImageView.snp.makeConstraints { make in
            make.edges.equalTo(view)
        }
        
        closeButton.snp.makeConstraints { make in
            make.leading.top.equalTo(view).inset(20)
        }
        
        settingButton.snp.makeConstraints { make in
            make.top.trailing.equalTo(view).inset(20)
        }
        
        diceButton.snp.makeConstraints { make in
            make.top.equalTo(view).inset(20)
            make.trailing.equalTo(settingButton.snp_leadingMargin).offset(-20)
        }
        
        giftButton.snp.makeConstraints { make in
            make.top.equalTo(view).inset(20)
            make.trailing.equalTo(diceButton.snp_leadingMargin).offset(-20)
        }
        
        profileView.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(view)
            make.bottom.equalTo(setView.snp_topMargin)
            make.height.equalTo(view).multipliedBy(0.15)
        }
        
        profileImage.snp.makeConstraints { make in
            make.center.equalTo(profileView)
            make.size.equalTo(90)
        }
        
        profileName.snp.makeConstraints { make in
            make.bottom.centerX.equalTo(profileView).inset(-10)
        }
        
        setView.snp.makeConstraints { make in
            make.horizontalEdges.bottom.equalTo(view)
            make.height.equalTo(view).multipliedBy(0.2)
        }
        
        chatButton.snp.makeConstraints { make in
            make.centerY.equalTo(setView)
            make.leading.equalTo(setView).inset(100)
        }
        
        editButton.snp.makeConstraints { make in
            make.center.equalTo(setView)
        }
        
        storyButton.snp.makeConstraints { make in
            make.centerY.equalTo(setView)
            make.trailing.equalTo(setView).inset(100)
        }

        chatLabel.snp.makeConstraints { make in
            make.top.equalTo(chatButton.snp_bottomMargin).offset(20)
            make.centerX.equalTo(chatButton)
        }
        
        editLabel.snp.makeConstraints { make in
            make.top.equalTo(editButton.snp_bottomMargin).offset(20)
            make.centerX.equalTo(editButton)
        }
        
        storyLabel.snp.makeConstraints { make in
            make.top.equalTo(storyButton.snp_bottomMargin).offset(20)
            make.centerX.equalTo(storyButton)
        }
        
    }
    
   

}
