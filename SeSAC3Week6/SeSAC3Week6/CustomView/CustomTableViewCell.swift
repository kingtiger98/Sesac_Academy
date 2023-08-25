//
//  CustomTableViewCell.swift
//  SeSAC3Week6
//
//  Created by 황재하 on 8/25/23.
//

import UIKit
import SnapKit

class CustomTableViewCell: UITableViewCell {
    
    let label = {
        let view = UILabel()
        return view
    }()
    
    let button = {
        let view = UIButton()
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
        setConstraints() // addSubView 이후에 Constraints 설정
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        contentView.backgroundColor = .lightGray
        // view.addSubview(label) // 테이블뷰에서는 view에 객체 추가하면 오류나네?***
        contentView.addSubview(label)
        contentView.addSubview(button)
        label.backgroundColor = .yellow
        button.backgroundColor = .green
    }
    
    
    func setConstraints() {
        
        button.snp.makeConstraints { make in
            make.size.equalTo(30)
            make.centerY.trailingMargin.equalTo(contentView)
        }
        
        label.snp.makeConstraints { make in
            make.top.leadingMargin.bottom.equalTo(contentView)
            make.trailing.equalTo(button.snp.leading).inset(30)
        }
        
        
    }
    
    
    
    // Interface Builder
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
