//
//  SearchView.swift
//  SeSAC3PhotoGramHJH
//
//  Created by 황재하 on 8/28/23.
//

import UIKit


class SearchView: BaseView {
    
    let serchBar = {
        let view = UISearchBar()
        view.placeholder = "검색어를 입력해주세요"
        return view
    }()
    
    
    // ***
    lazy var collectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout())
        view.register(SearchCollectionViewCell.self, forCellWithReuseIdentifier: "SearchCollectionViewCell")
        view.collectionViewLayout = collectionViewLayout()
        return view
    }()
    
    
    // 접근제어자 private : 너는 밖으로 나오지 마! _ 호출할 일이 없는 함수니깐~
    //    ㄴ 컴파일 최적화에 좋다
    private func collectionViewLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 8
        layout.minimumInteritemSpacing = 8
        let size = UIScreen.main.bounds.width - 40
        layout.itemSize = CGSize(width: size / 4 , height: size / 4)
        return layout
    }
    
    
    
    override func configureView() {
        addSubview(serchBar)
        addSubview(collectionView)

    }
    
    override func setConstraints() {
        
        serchBar.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(self.safeAreaLayoutGuide)
        }
        
        collectionView.snp.makeConstraints { make in
            make.horizontalEdges.bottom.equalToSuperview()
            make.top.equalTo(serchBar.snp.bottom)
        }
        
    }
    
}
