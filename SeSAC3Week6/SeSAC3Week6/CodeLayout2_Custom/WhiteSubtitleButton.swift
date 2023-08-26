//
//  WhiteSubtitleButton.swift
//  SeSAC3Week6
//
//  Created by 황재하 on 8/26/23.
//

import UIKit

class WhiteSubtitleButton: UIButton{
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setButton(imageName: String ,subTitle: String) -> UIButton{
        var configuration = UIButton.Configuration.plain()
        configuration.image = UIImage(named: "\(imageName)")
        configuration.imagePlacement = .top
        configuration.imagePadding = 8
        configuration.subtitle = "\(subTitle)"
        
        let button = UIButton(configuration: configuration)
        button.tintColor = .white
        
        return button
    }
    
}
