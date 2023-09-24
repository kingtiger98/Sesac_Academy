//
//  SearchViewController.swift
//  SeSAC3Week10
//
//  Created by 황재하 on 9/21/23.
//

import UIKit
import SnapKit


class SearchViewController: UIViewController{
    
    let list = Array(0...19)
    let list2 = Array(10...19)


    
    
    
    // 인스턴스 메서드나 인스턴스 프로퍼티는 인스턴스를 생서하는 같은 시점에 사용되어서 configureCollectionLayout()를 사용하면 오류가 발생함
    // 컬렉션뷰와 레이아웃에 대한 호출이 같은 시점에 일어나면 안되서 컬렉션뷰가 생성되는 시점을 좀 미루었음
    // configureCollectionLayout()를 Static 메서드로 만들면 lazy를 안하는 방법도 있음!
    lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: configureCollectionLayout())
    
    var dataSource: UICollectionViewDiffableDataSource<Int, Int>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        configuerCollectionView()

        configureHierarchy()
        configureLayout()
        configureDataSource()
        
    }
    
    func configureDataSource(){
        

        let cellRegisteration = UICollectionView.CellRegistration<SearchCollectionVIewCell ,Int>{ cell, indexPath, itemIdentifier in
            cell.imageView.image = UIImage(systemName: "heart.fill")
            cell.label.text = "\(indexPath.row)"
        }
        
        let cellRegisteration2 = UICollectionView.CellRegistration<DogCollectionViewCell ,Int>{ cell, indexPath, itemIdentifier in
            cell.imageView.image = UIImage(systemName: "star.fill")
            cell.label.text = "\(indexPath.row)"
        }
        
        dataSource = UICollectionViewDiffableDataSource(collectionView: collectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            
            
            if indexPath.section == 0 {
                return collectionView.dequeueConfiguredReusableCell(using: cellRegisteration, for: indexPath, item: itemIdentifier)
            } else {
                return collectionView.dequeueConfiguredReusableCell(using: cellRegisteration2, for: indexPath, item: itemIdentifier)
            }
            
            
        })

        
        var snapShot = NSDiffableDataSourceSnapshot<Int, Int>()
        //snapShot.appendSections([0])
        snapShot.appendSections([0, 1])
        snapShot.appendItems(list, toSection: 0)
        snapShot.appendItems(list2, toSection: 1)
        dataSource.apply(snapShot, animatingDifferences: false)
        //dataSource.apply(snapShot)
    }
    
    func configureHierarchy(){

        view.addSubview(collectionView)
    }
    
    func configureLayout(){

        collectionView.snp.makeConstraints { make in
            make.horizontalEdges.top.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(300)
        }
    }
    
    // 컴포지셔널 레이아웃 : 섹션(그룹(아이템)))
    // static 메서드로 생성하면 컬렉션뷰 lazy로 생성 안해도 됨
    func configureCollectionLayout() -> UICollectionViewLayout{
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/10), heightDimension: .fractionalHeight(1))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(4), heightDimension: .fractionalHeight(1/2))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, repeatingSubitem: item, count: 10)
        group.interItemSpacing = .fixed(8)
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8)
        //section.interGroupSpacing = 8
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        
        return layout
    }





    
    func configuerCollectionView(){
        collectionView.backgroundColor = .white
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isScrollEnabled = true
        collectionView.bounces = false
    }
    
    
    

}

// 기본적인 컬렉션뷰는 이게 편해
//    // static 메서드로 생성하면 컬렉션뷰 lazy로 생성 안해도 됨
//    func configureCollectionLayout() -> UICollectionViewLayout{
//        let layout = UICollectionViewFlowLayout()
//        layout.itemSize = CGSize(width: 50, height: 50)
//        layout.scrollDirection = .vertical
//        layout.sectionInset = UIEdgeInsets(top: <#T##CGFloat#>, left: <#T##CGFloat#>, bottom: <#T##CGFloat#>, right: <#T##CGFloat#>)
//
//        return layout
//    }



// 세로스크롤
//class SearchViewController: UIViewController{
//
//    let scrollView = UIScrollView()
//    let contentView = UIView()
//
//    let imageView = UIImageView()
//    let label = UILabel()
//    let button = UIButton()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        configureHierarchy()
//        configureLayout()
//
//        imageView.backgroundColor = .orange
//        label.backgroundColor = .magenta
//        button.backgroundColor = .systemGreen
//
//        imageView.snp.makeConstraints { make in
//            make.top.horizontalEdges.equalTo(contentView).inset(10)
//            make.height.equalTo(200)
//        }
//
//        button.snp.makeConstraints { make in
//            make.bottom.horizontalEdges.equalTo(contentView).inset(10)
//            make.height.equalTo(80)
//        }
//
//        label.numberOfLines = 0
//        label.text = "adsasdsadfhlghewjadsasdsadfhlghewjfhewjfad\nsasdsadfhlghewjfadsasdsadfhlghewjfadsasdsadfhlghewjfadsasdsadfhlghewjfadsasdsadfhlghewjfadsasdsadfhlghewjfadsasdsadfhlghewjfadsasdsadfhlghewjfadsasdsadfhlghewjfadsasds\n\n\nfhlghewjfadsasdsadfhlghewjfadsasdsadfhlghewjfadsasdsadfhlghewjfadsasdsadfhlghewjfadsasdsadfhlghewjfadsasdsadfhlghewjfadsasdsadfhlghewjfadsasdsadfhlghewjf\n\n\n\nadsasdsadfhlghewjfadsasdsadfhlghewjfadsasdsadfhlghewjfadsasdsadfhlghewjfadsasdsadfhlghewjfadsasdsadfhlghewjfadsasdsadfhlghewjfadsasdsadfhlghewjfadsasdsadfhlghewj\n\n\n\nfadsasdsadfhlghewjfadsasdsadfhlghewjfadsasdsadfhlghewjfadsasdsadfhlghewjfadsasdsadfhlghewjff"
//        label.textColor = .white
//        label.snp.makeConstraints { make in
//            make.horizontalEdges.equalTo(contentView)
//            make.top.equalTo(imageView.snp.bottom).offset(50)
//            make.bottom.equalTo(button.snp.top).offset(-50)
//        }
//
//    }
//
//    func configureHierarchy(){
//
//        view.addSubview(scrollView)
//        scrollView.addSubview(contentView)
//        contentView.addSubview(imageView)
//        contentView.addSubview(label)
//        contentView.addSubview(button)
//
//    }
//
//    func configureLayout(){
//
//        scrollView.bounces = false
//        scrollView.showsVerticalScrollIndicator = false
//        scrollView.backgroundColor = .blue
//        scrollView.snp.makeConstraints { make in
//            make.edges.equalTo(view.safeAreaLayoutGuide)
//        }
//
//        contentView.backgroundColor = .white
//        contentView.snp.makeConstraints { make in
//            make.verticalEdges.equalTo(scrollView)
//            make.width.equalTo(scrollView.snp.width)
//        }
//
//    }
//
//}





// 가로 스크롤
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
