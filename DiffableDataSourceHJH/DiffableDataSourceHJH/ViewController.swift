//
//  ViewController.swift
//  DiffableDataSourceHJH
//
//  Created by 황재하 on 9/16/23.
//

import UIKit
import SnapKit



//struct Setting: Hashable{
//    var setName: String
//
//    let unique = UUID().uuidString
//}

class ViewController: UIViewController {
    
    enum Section: Int, CaseIterable{
        case all = 1, personal = 2, etc = 3
    }
    
    let allList = [
        Setting(setName: "공지사항", setImage: "", setUIColor: .black),
        Setting(setName: "실험실", setImage: "", setUIColor: .black),
        Setting(setName: "버전정보", setImage: "", setUIColor: .black),
    ]
    
    let personalList = [
        Setting(setName: "개인/보안", setImage: "", setUIColor: .black),
        Setting(setName: "알림", setImage: "", setUIColor: .black),
        Setting(setName: "채팅", setImage: "", setUIColor: .black),
    ]
    
    let etcList = [
        Setting(setName: "고객센터", setImage: "", setUIColor: .black),
        Setting(setName: "도움말", setImage: "", setUIColor: .black),
    ]
    
    
    // 1_1. 컬렉션뷰 생성
    var collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
    
    // 2_1. 컬렉션뷰 셀 등록, "User"에는 셀에 올 데이터의 타입을 써줌!
    //var cellRegistration: UICollectionView.CellRegistration<UICollectionViewListCell, Setting>!
    
    var dataSource: UICollectionViewDiffableDataSource<Section, Setting>!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        configuerDataSource()
        
        var snapshot = NSDiffableDataSourceSnapshot<Section, Setting>()

        snapshot.appendSections(Section.allCases)
        snapshot.appendItems(allList, toSection: Section.all)
        snapshot.appendItems(personalList, toSection: Section.personal)
        snapshot.appendItems(etcList, toSection: Section.etc)


        dataSource.apply(snapshot)
        
    }
    
    // 1_2 :컴포지셔널 레이아웃 사용하기 _ List Configuration
    static func createLayout() -> UICollectionViewLayout {
        
        var configuration = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        configuration.backgroundColor = .black
        
        let layout = UICollectionViewCompositionalLayout.list(using: configuration)
        return layout
    }
    
    func configuerDataSource() {
        // 3. List Cell
        let cellRegistration = UICollectionView.CellRegistration<UICollectionViewListCell, Setting>(handler: { cell, indexPath, itemIdentifier in
            
            // 셀 디자인 및 처리
            var content = UIListContentConfiguration.valueCell()
            content.text = itemIdentifier.setName
            content.textProperties.color = .lightGray
            //content.image = UIImage(systemName: "star.fill")
            //content.imageProperties.tintColor = .brown
            //content.prefersSideBySideTextAndSecondaryText = false
            //content.textToSecondaryTextVerticalPadding = 20
            cell.contentConfiguration = content
            
            var backgroundConfig = UIBackgroundConfiguration.listPlainCell()
            backgroundConfig.backgroundColor = .black
            cell.backgroundConfiguration = backgroundConfig
            
        })
        
        // B. CellForItemAt 기능을 대신함!***
        dataSource = UICollectionViewDiffableDataSource(collectionView: collectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            let cell = collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: itemIdentifier)
            return cell
        })
        
    }
    
}


//extension ViewController: UICollectionViewDataSource{
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return allList.count
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//
//        let cell = collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: allList[indexPath.item])
//        return cell
//
//    }
//
//
//}


