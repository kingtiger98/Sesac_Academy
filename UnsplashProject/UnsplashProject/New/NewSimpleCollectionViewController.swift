//
//  NewSimpleCollectionViewController.swift
//  UnsplashProject
//
//  Created by 황재하 on 9/14/23.
//

import UIKit
import SnapKit

class NewSimpleCollectionViewController: UIViewController{
    
    let list = [User(name: "Hue", age: 23), User(name: "Jack", age: 23), User(name: "Bran", age: 20), User(name: "Kokojong", age: 20)]
    
    // 1.
    var collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
    // 2.
    var cellRegistration: UICollectionView.CellRegistration<UICollectionViewListCell, User>!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
     
        // 3. List Cell
        //UICollectioView.CellRegistration : iOS 14. 이상, 메서드 대신 제네릭 사용, 셀이 생성될 떄 마다 클로저가 호출
        cellRegistration = UICollectionView.CellRegistration(handler: { cell, indexPath, itemIdentifier in
            
            // 셀 디자인 및 처리
            var content = UIListContentConfiguration.valueCell()
            content.text = itemIdentifier.name
            content.textProperties.color = .brown
            content.secondaryText = "\(itemIdentifier.age)"
            content.image = UIImage(systemName: "star.fill")
            content.imageProperties.tintColor = .brown
            content.prefersSideBySideTextAndSecondaryText = false
            content.textToSecondaryTextVerticalPadding = 20
            cell.contentConfiguration = content
            
            var backgroundConfig = UIBackgroundConfiguration.listPlainCell()
            backgroundConfig.backgroundColor = .white
            backgroundConfig.cornerRadius = 10
            backgroundConfig.strokeWidth = 2
            backgroundConfig.strokeColor = .brown
            cell.backgroundConfiguration = backgroundConfig
                        
        })
        
    }
    
    // 컴포지셔널 레이아웃 사용하기 _ List Configuration
    static func createLayout() -> UICollectionViewLayout {
        
        var configuration = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        configuration.showsSeparators = false
        configuration.backgroundColor = .brown
        
        let layout = UICollectionViewCompositionalLayout.list(using: configuration)
        return layout
    }
    
}


extension NewSimpleCollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: list[indexPath.item])
        
        return cell
        
    }
    
}
