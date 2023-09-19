//
//  ViewController.swift
//  MVVMPractice
//
//  Created by 황재하 on 9/18/23.
//

import UIKit
import SnapKit


class RandomViewController: UIViewController {

    let viewModel = RandomModelView()
    
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: creatLayout())
    
    // var cellRegistration : UICollectionView.CellRegistration<UICollectionViewListCell, PhotoResult>!
    
    var dataSource : UICollectionViewDiffableDataSource<Int, PhotoResult>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.fetchRandomPT()
        
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        

        configureDataSource()
        
        viewModel.list.bind { _ in
            self.updataSnapShot()
        }
        
    }

    
    static func creatLayout() -> UICollectionViewLayout{
        
        var configuration = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        configuration.backgroundColor = .brown
        configuration.showsSeparators = false
        
        let layout = UICollectionViewCompositionalLayout.list(using: configuration)
    
        return layout
    }

    
    
    func configureDataSource() {
        
        let cellRegistration = UICollectionView.CellRegistration<UICollectionViewListCell, PhotoResult>(handler: { cell, indexPath, itemIdentifier in
            
            var content = UIListContentConfiguration.valueCell()
            
            content.text = "\(itemIdentifier.likes)"
            
            // 중요하당
            DispatchQueue.global().async {
                let url = URL(string: itemIdentifier.urls.thumb)!
                let data = try? Data(contentsOf: url)
                
                DispatchQueue.main.async {
                    content.image = UIImage(data: data!)
                    cell.contentConfiguration = content // ***
                }
            }
            
            
        })
        
        
        dataSource = UICollectionViewDiffableDataSource(collectionView: collectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            let cell = self.collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: itemIdentifier)
            
            return cell
        })
        
    }
    
    
    func updataSnapShot(){
        var snapshot = NSDiffableDataSourceSnapshot<Int, PhotoResult>()
        snapshot.appendSections([0])
        snapshot.appendItems(viewModel.list.value.results!)
        dataSource.apply(snapshot)
    }
    
    
}

