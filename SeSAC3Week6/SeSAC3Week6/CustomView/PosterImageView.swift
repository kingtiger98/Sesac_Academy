//
//  File.swift
//  SeSAC3Week6
//
//  Created by 황재하 on 8/25/23.
//

import UIKit

class PosterImageView: UIImageView {
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configureView() {
        print(frame.width, frame)
        backgroundColor = .yellow
        layer.borderColor = UIColor.black.cgColor
        layer.borderWidth = 2
        clipsToBounds = true
    }
    
    //
    override func layoutSubviews() {
        super.layoutSubviews()
        print("layoutSubviews", frame.width, frame)
        layer.cornerRadius = frame.width / 2 // 이미지 뷰 원형으로 만들기
    }
    
}



