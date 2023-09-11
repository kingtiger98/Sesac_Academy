//
//  MovieView.swift
//  TMDBCodeBase
//
//  Created by 황재하 on 8/28/23.
//

import UIKit

class MovieView: BaseView{
      
    // 컬렉션뷰***
    lazy var MovieCollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: MovieCollectionViewFlowLayout())
        view.register(MovieCollectionViewCell.self, forCellWithReuseIdentifier: MovieCollectionViewCell.identifier)
        view.collectionViewLayout = MovieCollectionViewFlowLayout()
        return view
    }()
    
    private func MovieCollectionViewFlowLayout() -> UICollectionViewFlowLayout{
        let layout = UICollectionViewFlowLayout()
        let width = UIScreen.main.bounds.width / 2 - 12
        let spacing: CGFloat = 8
        
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: width, height: width * 1.5)
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        
        return layout
    }
    
    
    override func setConfigure() {
        addSubview(MovieCollectionView)
    }
    
    override func setConstraints() {
        MovieCollectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    
}
