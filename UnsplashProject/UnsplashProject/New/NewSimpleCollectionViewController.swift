//
//  NewSimpleCollectionViewController.swift
//  UnsplashProject
//
//  Created by 황재하 on 9/14/23.
//

import UIKit
import SnapKit

class NewSimpleCollectionViewController: UIViewController{
    
    enum Section: Int, CaseIterable{
        case first = 2000, second = 1
    }
    
    
    let list = [User(name: "jack", age: 23),
                User(name: "Hue", age: 23),
                User(name: "Bran", age: 20),
                User(name: "Kokojong", age: 20)
    ]
    
    let list2 = [User(name: "jack", age: 23),
                 User(name: "Hue", age: 23),
                 User(name: "Bran", age: 20),
                 User(name: "Hwang", age: 20)
    ]
    
    // 1. 컬렉션뷰 생성
    var collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
    
    // 2. 컬렉션뷰 셀 등록, "User"에는 셀에 올 데이터의 타입을 써줌! _ collectionView.register
    // var cellRegistration: UICollectionView.CellRegistration<UICollectionViewListCell, User>!
    
    // A. UICollectionViewDataSource의 numberOfItemsInSection, cellForItemAt기능을 대신할거야!***
    var dataSource: UICollectionViewDiffableDataSource<Section, User>! // <Int, User>
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        // C. NumberOfItemsInSection기능을 대신함!***
        var snapshot = NSDiffableDataSourceSnapshot<Section, User>() // <String, User>
        
        // 섹션 하나만 사용
        //snapshot.appendSections([0])
        //snapshot.appendItems(list)
        
        // 섹션 여러개 사용
        // 오류발생! 여러 섹션에 같은 배열을 적용하면 렌더링이 제대로 안될 수 있어
        snapshot.appendSections(Section.allCases) // 0, 1 이 꼭 순서대로가 아니어도 됨 indexPath의 개념을 버려라 _ 120, 1 이어도 잘 작동함 심지어 문자열이어도 됨 고유하면 됨 그냥, [120, 1]
        snapshot.appendItems(list, toSection: Section.first) // (list, toSection: 120)
        snapshot.appendItems(list2, toSection: Section.second) // (list, toSection: 1)

        dataSource.apply(snapshot)
        
    }
    
    // 컴포지셔널 레이아웃 사용하기 _ List Configuration
    static private func createLayout() -> UICollectionViewLayout {
        
        var configuration = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        configuration.showsSeparators = false
        configuration.backgroundColor = .brown
        
        let layout = UICollectionViewCompositionalLayout.list(using: configuration)
        return layout
    }
    
    private func configuerDataSource() {
        

        // 3. List Cell
        //UICollectioView.CellRegistration : iOS 14. 이상, 메서드 대신 제네릭 사용, 셀이 생성될 떄 마다 클로저가 호출
        //cellForItemAt 기능을 대신함!***
        let cellRegistration = UICollectionView.CellRegistration<UICollectionViewListCell, User>(handler: { cell, indexPath, itemIdentifier in
            
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
            backgroundConfig.strokeWidth = 3
            backgroundConfig.strokeColor = .black
            cell.backgroundConfiguration = backgroundConfig
                        
        })
        
        // B. CellForItemAt 기능을 대신함!***
        dataSource = UICollectionViewDiffableDataSource(collectionView: collectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            let cell = collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: itemIdentifier)
            return cell
        })
    
    }
    
}


//extension NewSimpleCollectionViewController: UICollectionViewDataSource{
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return list.count
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//
//        let cell = collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: list[indexPath.item])
//        return cell
//
//    }
//
//}
