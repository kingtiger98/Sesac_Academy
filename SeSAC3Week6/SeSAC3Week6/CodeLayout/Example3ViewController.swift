//
//  Example3ViewController.swift
//  SeSAC3Week6
//
//  Created by 황재하 on 8/23/23.
//

import UIKit
import SnapKit

class Example3ViewController: UIViewController {
    
    let backgroundImageView = {
        let view = UIImageView()
        view.backgroundColor = .blue
        view.image = UIImage(named: "kakaoback")
        return view
    }()
    
    let topView = {
        let view = UIView()
        view.backgroundColor = .none
        return view
    }()
    
    let dateLabel = {
        let view = UILabel()
        view.text = "10월 24일 09시 42분"
        view.textColor = .white
        view.font = .systemFont(ofSize: 14)
        return view
    }()
    
    let locationLabel = {
        let view = UILabel()
        view.text = "위치 : 서울, 신림동"
        view.textColor = .white
        view.font = .systemFont(ofSize: 23)
        return view
    }()
    
    let shareButton = {
        let view = UIButton()
        view.setImage(UIImage(systemName: "square.and.arrow.up"), for: .normal)
        view.tintColor = .white
        return view
    }()
    
    let resetButton = {
        let view = UIButton()
        view.setImage(UIImage(systemName: "arrow.clockwise.heart"), for: .normal)
        view.tintColor = .white
        return view
    }()
    
    let chatView = {
        let view = UIView()
        view.backgroundColor = .none
        
        return view
    }()
    
    let stackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.alignment = .leading
        view.distribution = .fill
        view.spacing = 8
        
        return view
    }()
    
    let chatBox1 = {
        let view = UILabel()
        view.text = "지금은 9도 입니다"
        view.textColor = .black
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        return view
    }
    
    let chatBox2 = {
        let view = UILabel()
        view.text = "78% 만큼 습해요"
        view.textColor = .black
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        return view
    }
    
    let chatBox3 = {
        let view = UILabel()
        view.text = "1m/s의 바람이 불어요"
        view.textColor = .black
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        return view
    }
    
    let chatBox4 = {
        let view = UIImageView()
        view.image = UIImage(named: "kakaoprofile")
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        return view
    }
    
    let chatBox5 = {
        let view = UILabel()
        view.text = "오늘도 행복한 하루 보내세요"
        view.textColor = .black
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        return view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(backgroundImageView)
        view.addSubview(topView)
        view.addSubview(dateLabel)
        view.addSubview(locationLabel)
        view.addSubview(shareButton)
        view.addSubview(resetButton)
        view.addSubview(chatView)
        
        view.addSubview(stackView)
        stackView.addArrangedSubview(chatBox1())
        stackView.addArrangedSubview(chatBox2())
        stackView.addArrangedSubview(chatBox3())
        stackView.addArrangedSubview(chatBox4())
        stackView.addArrangedSubview(chatBox5())
        
        setAutoLayout()

    }
    
    func setAutoLayout(){
        backgroundImageView.snp.makeConstraints { make in
            make.edges.equalTo(view)
        }
        
        topView.snp.makeConstraints { make in
            make.horizontalEdges.top.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.1)
        }
        
        dateLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(12)
            make.horizontalEdges.equalToSuperview().inset(24)
        }
        
        locationLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(40)
            make.leading.equalToSuperview().inset(20)
        }
        
        shareButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(42)
            make.trailing.equalToSuperview().inset(20)
        }
        
        resetButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(42)
            make.trailing.equalToSuperview().inset(60)
        }
        
        chatView.snp.makeConstraints { make in
            make.top.equalTo(topView.snp_bottomMargin).offset(10)
            make.horizontalEdges.bottom.equalToSuperview().inset(20)
        }
        
        stackView.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(chatView)
        }
        
    }
    
    
    
}
