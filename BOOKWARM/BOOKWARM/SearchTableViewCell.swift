//
//  SearchTableViewCell.swift
//  BOOKWARM
//
//  Created by 황재하 on 9/4/23.
//

import UIKit
import SnapKit

final class SearchTableViewCell: UITableViewCell{
    
    let bookImage = {
        let view = UIImageView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    let bookTitleLabel = {
        let label = UILabel()
        label.text = "소나기"
        label.textColor = .black
        return label
    }()
    
    let bookAuthorLabel = {
        let label = UILabel()
        label.text = "황순원"
        label.textColor = .black
        return label
    }()
    
    let bookPriceLabel = {
        let label = UILabel()
        label.text = "4,500원"
        label.textColor = .black
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .white
        setConfigure()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
    func setConfigure(){
        contentView.addSubview(bookImage)
        contentView.addSubview(bookTitleLabel)
        contentView.addSubview(bookAuthorLabel)
        contentView.addSubview(bookPriceLabel)
    }
    
    func setConstraints(){
        
        bookImage.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(12)
            make.width.equalToSuperview().multipliedBy(0.23)
            make.height.equalToSuperview().multipliedBy(0.8)
        }
        
        bookTitleLabel.snp.makeConstraints { make in
            make.leading.equalTo(bookImage.snp.trailing).offset(20)
            make.top.trailing.equalToSuperview().inset(20)
        }
        
        bookAuthorLabel.snp.makeConstraints { make in
            make.leading.equalTo(bookImage.snp.trailing).offset(20)
            make.trailing.equalToSuperview()
            make.top.equalTo(bookTitleLabel.snp.bottom)
        }
        
        bookPriceLabel.snp.makeConstraints { make in
            make.leading.equalTo(bookImage.snp.trailing).offset(20)
            make.trailing.equalToSuperview()
            make.top.equalTo(bookAuthorLabel.snp.bottom)
        }

    }
    
}
