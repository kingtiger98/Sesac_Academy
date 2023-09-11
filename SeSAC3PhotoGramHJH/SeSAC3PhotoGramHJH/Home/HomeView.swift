//
//  HomeView.swift
//  SeSAC3PhotoGramHJH
//
//  Created by 황재하 on 8/31/23.
//

import UIKit

class HomeView: BaseView{
    
    // weak*** : deinit{} 이 실행되게 함 왜지?? _ 강한 순환참조가 걸려있어서 그래~
    // ㄴ weak 키워드는 클래스에서만 사용 됨
    // 2. delegate 프로토콜 값 전달
    weak var delegate: HomeViewProtocol?
    
    // ***
    lazy var collectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout())
        view.register(SearchCollectionViewCell.self, forCellWithReuseIdentifier: "SearchCollectionViewCell")
        // view.dataSource = self
        // view.delegate = self
        view.collectionViewLayout = collectionViewLayout()
        return view
    }()
    
    // 접근제어자 private : 너는 밖으로 나오지 마! _ 호출할 일이 없는 함수니깐~
    //    ㄴ 컴파일 최적화에 좋다
    private func collectionViewLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 8
        layout.minimumInteritemSpacing = 8
        layout.sectionInset = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
        let size = UIScreen.main.bounds.width - 40
        layout.itemSize = CGSize(width: size / 4 , height: size / 4)
        return layout
    }
    
    override func configureView() {
        super.configureView()
        
        addSubview(collectionView)
        
    }
    
    override func setConstraints() {
        super.setConstraints()
        
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
    }
    
}


//extension HomeView: UICollectionViewDelegate, UICollectionViewDataSource{
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 100
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchCollectionViewCell", for: indexPath) as? SearchCollectionViewCell else
//        { return UICollectionViewCell() }
//
//        cell.imageView.backgroundColor = .systemBlue
//        return cell
//    }
//
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//
//        print(#function)
//
//        // 3. delegate 프로토콜 값 전달 _ HomewView에서 사용했던 것
//         delegate?.didSelectItemAt(indexPath: indexPath)
//
//    }
//
//}
