//
//  RealmNewCollectionVIewController.swift
//  PhotoGramRealm
//
//  Created by 황재하 on 9/14/23.
//

import UIKit
import SnapKit
import RealmSwift

class RealmNewCollectionVIewController: BaseViewController{
    
    let realm = try! Realm()
    
    // realm 담을 빈그릇 변수 선언
    var list: Results<ToDoTable>!
    
    // 1.
    var collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout())
    
    var cellRegisteration: UICollectionView.CellRegistration<UICollectionViewListCell, ToDoTable>!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // realm 데이터 빈그릇에 담기
        list = realm.objects(ToDoTable.self)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        // 4. itemIdentifier = list[indexPath.item]
        cellRegisteration = UICollectionView.CellRegistration(handler: { cell, indexPath, itemIdentifier in
            
            var content = UIListContentConfiguration.valueCell()
            content.image = itemIdentifier.favorite ? UIImage(systemName: "star.fill") : UIImage(systemName: "star")
            content.text = itemIdentifier.title
            content.secondaryText = "\(itemIdentifier.detail.count)개의 세부 할 일"
            cell.contentConfiguration = content
            
        })
        
        
    }
    
    // 2.
    static func layout() -> UICollectionViewLayout {
        // 2_1.
        let configuration = UICollectionLayoutListConfiguration(appearance: .grouped)
        // 2_2.
        let layout = UICollectionViewCompositionalLayout.list(using: configuration)
        
        return layout
        
    }
    
}

extension RealmNewCollectionVIewController: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // 3.
        let data = list[indexPath.item]
        let cell = collectionView.dequeueConfiguredReusableCell(using: cellRegisteration, for: indexPath, item: data)
        
        return cell
        
    }
    
    
}
