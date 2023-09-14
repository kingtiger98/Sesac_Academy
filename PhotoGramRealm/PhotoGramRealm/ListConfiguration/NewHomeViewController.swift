//
//  NewHomeViewController.swift
//  PhotoGramRealm
//
//  Created by 황재하 on 9/14/23.
//

import UIKit
import RealmSwift

class NewHomeViewController: BaseViewController{
    
    let realm = try! Realm()
    var tasks : Results<DiaryTable>!
    
    // 1.
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
    
    // 2. 컬렉션뷰 셀 등록, "User"에는 셀에 올 데이터의 타입을 써줌!
    var cellRegistration: UICollectionView.CellRegistration<UICollectionViewListCell, DiaryTable>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tasks = realm.objects(DiaryTable.self)
        print(tasks)
        
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
            content.text = itemIdentifier.diaryTitle
            content.textProperties.color = .brown
            content.secondaryText = "\(itemIdentifier.contents)"
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


extension NewHomeViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        tasks.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let data = tasks[indexPath.row]
        let items = collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: data)
        
        return items
    }
    
    
    
}
