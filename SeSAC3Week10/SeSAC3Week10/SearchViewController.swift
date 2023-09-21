//
//  SearchViewController.swift
//  SeSAC3Week10
//
//  Created by 황재하 on 9/21/23.
//

import UIKit
import SnapKit

class SearchViewController: UIViewController{
    
    let scrollView = UIScrollView()
    let contentView = UIView()
    
    let imageView = UIImageView()
    let label = UILabel()
    let button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureHierarchy()
        configureLayout()
        
        imageView.backgroundColor = .orange
        label.backgroundColor = .magenta
        button.backgroundColor = .systemGreen
        
        imageView.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(contentView).inset(10)
            make.height.equalTo(200)
        }
        
        button.snp.makeConstraints { make in
            make.bottom.horizontalEdges.equalTo(contentView).inset(10)
            make.height.equalTo(80)
        }
        
        label.numberOfLines = 0
        label.text = "adsasdsadfhlghewjadsasdsadfhlghewjfhewjfad\nsasdsadfhlghewjfadsasdsadfhlghewjfadsasdsadfhlghewjfadsasdsadfhlghewjfadsasdsadfhlghewjfadsasdsadfhlghewjfadsasdsadfhlghewjfadsasdsadfhlghewjfadsasdsadfhlghewjfadsasds\n\n\nfhlghewjfadsasdsadfhlghewjfadsasdsadfhlghewjfadsasdsadfhlghewjfadsasdsadfhlghewjfadsasdsadfhlghewjfadsasdsadfhlghewjfadsasdsadfhlghewjfadsasdsadfhlghewjf\n\n\n\nadsasdsadfhlghewjfadsasdsadfhlghewjfadsasdsadfhlghewjfadsasdsadfhlghewjfadsasdsadfhlghewjfadsasdsadfhlghewjfadsasdsadfhlghewjfadsasdsadfhlghewjfadsasdsadfhlghewj\n\n\n\nfadsasdsadfhlghewjfadsasdsadfhlghewjfadsasdsadfhlghewjfadsasdsadfhlghewjfadsasdsadfhlghewjff"
        label.textColor = .white
        label.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(contentView)
            make.top.equalTo(imageView.snp.bottom).offset(50)
            make.bottom.equalTo(button.snp.top).offset(-50)
        }
        
    }
    
    func configureHierarchy(){
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(imageView)
        contentView.addSubview(label)
        contentView.addSubview(button)

    }
    
    func configureLayout(){
        
        scrollView.bounces = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.backgroundColor = .blue
        scrollView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
        contentView.backgroundColor = .white
        contentView.snp.makeConstraints { make in
            make.verticalEdges.equalTo(scrollView)
            make.width.equalTo(scrollView.snp.width)
        }
        
    }
    
}

//class SearchViewController: UIViewController{
//
//    let scrollView = UIScrollView()
//    let stackView = UIStackView()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        view.backgroundColor = .white
//
//        configureHierarchy()
//        configureLayout()
//        configureStackView()
//
//    }
//
//    func configureHierarchy(){
//        view.addSubview(scrollView)
//        scrollView.addSubview(stackView)
//    }
//
//    func configureLayout(){
//
//        scrollView.backgroundColor = .lightGray
//        scrollView.snp.makeConstraints { make in
//            make.top.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
//            make.height.equalTo(70)
//        }
//
//        stackView.backgroundColor = .systemGray6
//        stackView.spacing = 16
//        stackView.snp.makeConstraints { make in
//            make.edges.equalTo(scrollView)
//            make.height.equalTo(scrollView)
//        }
//
//    }
//
//    func configureStackView(){
//
//        for i in 1...5 {
//            let label = UILabel()
//            label.text = "안녕하세요\(i)"
//            label.textColor = .brown
//            label.layer.borderWidth = 1
//            label.layer.borderColor = UIColor.black.cgColor
//            label.layer.cornerRadius = 8
//            label.backgroundColor = .systemGray6
//            stackView.addArrangedSubview(label)
//        }
//
//    }
//
//}
