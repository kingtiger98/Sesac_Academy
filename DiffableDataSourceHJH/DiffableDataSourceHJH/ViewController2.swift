//
//  ViewController.swift
//  DiffableDataSourceHJH
//
//  Created by 황재하 on 9/16/23.
//

import UIKit
import SnapKit



struct Setting: Hashable{
    var setName: String
    var setImage: String
    var setUIColor: UIColor = .black
    
    init(setName: String, setImage: String, setUIColor: UIColor) {
        self.setName = setName
        self.setImage = setImage
        self.setUIColor = setUIColor
    }
    
    let unique = UUID().uuidString
}


enum Section2: Int, CaseIterable{
    case first = 1, second = 2
}

class ViewController2: UIViewController {
    
    let list1 = [
        Setting(setName: "방해 금지 모드", setImage: "moon.fill", setUIColor: .purple),
        Setting(setName: "수면", setImage: "bed.double.fill", setUIColor: .orange),
        Setting(setName: "임무", setImage: "doc.fill", setUIColor: .green),
        Setting(setName: "개인시간", setImage: "person.fill", setUIColor: .blue)
    ]
    
    let list2 = [
        Setting(setName: "모든 기기에서 공유", setImage: "", setUIColor: .black)
    ]

    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout())
        
    // 1.
    var dataSource : UICollectionViewDiffableDataSource<Section2, Setting>!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        // 3.
        setDataSource()
        
        // 4.
        var snapShot = NSDiffableDataSourceSnapshot<Section2, Setting>()
        snapShot.appendSections(Section2.allCases)
        snapShot.appendItems(list1, toSection: Section2.first)
        snapShot.appendItems(list2, toSection: Section2.second)
        
        dataSource.apply(snapShot)
        
        
    }

    static func layout() -> UICollectionViewLayout{
        
        var config = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        config.backgroundColor = .cyan
        
        let layout = UICollectionViewCompositionalLayout.list(using: config)
        
        return layout
    }

    // 2
    func setDataSource(){
        
        let cellRegistration = UICollectionView.CellRegistration<UICollectionViewListCell, Setting>(handler: { cell, indexPath, data in
            
            var content = UIListContentConfiguration.valueCell()
            content.text = data.setName
            content.textProperties.color = .white
            
            content.image = UIImage(systemName: data.setImage)
            content.imageProperties.tintColor = data.setUIColor
            
            cell.contentConfiguration = content
            
            var backgroundConfig = UIBackgroundConfiguration.listPlainCell()
            backgroundConfig.backgroundColor = .black
            
            cell.backgroundConfiguration = backgroundConfig
            
        })
        
        
        dataSource = UICollectionViewDiffableDataSource(collectionView: collectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            let cell = collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: itemIdentifier)
            return cell
        })
        
    }
    
}















// DiffableDatasource 사용전
//class ViewController2: UIViewController {

//
//    let list1 = [
//        Setting(setName: "방해 금지 모드"),
//        Setting(setName: "수면"),
//        Setting(setName: "임무"),
//        Setting(setName: "개인시간")
//    ]
//
//    let list2 = [
//        Setting(setName: "모든 기기에서 공유")
//    ]
//
//    // 1_1. 컬렉션뷰 생성
//    var collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
//
//    // 2_1. 컬렉션뷰 셀 등록, "User"에는 셀에 올 데이터의 타입을 써줌!
//    var cellRegistration: UICollectionView.CellRegistration<UICollectionViewListCell, Setting>!
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        view.addSubview(collectionView)
//        collectionView.dataSource = self
//        collectionView.snp.makeConstraints { make in
//            make.edges.equalToSuperview()
//        }
//
//        cellRegistration = UICollectionView.CellRegistration<UICollectionViewListCell, Setting>(handler: { cell, indexPath, itemIdentifier in
//
//            // 셀 디자인 및 처리
//            var content = UIListContentConfiguration.accompaniedSidebarCell()
//
//            content.text = itemIdentifier.setName
//            content.textProperties.color = .white
//
//            content.image = UIImage(systemName: "star.fill")
//            content.imageProperties.tintColor = .brown
//
//            content.secondaryText = "dd"
//            content.secondaryTextProperties.color = .white
//
//            cell.contentConfiguration = content
//
//            var backgroundConfig = UIBackgroundConfiguration.listPlainCell()
//            backgroundConfig.backgroundColor = .darkGray
//            cell.backgroundConfiguration = backgroundConfig
//
//        })
//
//    }
//
//    // 1_2 :컴포지셔널 레이아웃 사용하기 _ List Configuration
//    static func createLayout() -> UICollectionViewLayout {
//
//        var configuration = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
//        configuration.backgroundColor = .black
//
//        let layout = UICollectionViewCompositionalLayout.list(using: configuration)
//        return layout
//    }
//
//}
//
//
//extension ViewController2: UICollectionViewDataSource{
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return list1.count
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//
//        let cell = collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: list1[indexPath.item])
//        return cell
//
//    }
//
//
//}
//
