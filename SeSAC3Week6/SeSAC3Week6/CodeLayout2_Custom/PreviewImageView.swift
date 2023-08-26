//
//  PreviewImageView.swift
//  SeSAC3Week6
//
//  Created by 황재하 on 8/26/23.
//

import UIKit

class PreviewImageView: UIImageView{
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setImage()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setImage(){
        contentMode = .scaleToFill
        layer.borderColor = UIColor.darkGray.cgColor
        layer.borderWidth = 2
        clipsToBounds = true
        }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        // print("layoutSubviews", frame.width, frame)
        layer.cornerRadius = frame.width / 2 // 이미지 뷰 원형으로 만들기
    }
    
}
