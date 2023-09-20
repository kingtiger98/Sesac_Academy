//
//  ViewController.swift
//  PunkMVVM
//
//  Created by 황재하 on 9/20/23.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    let viewModel = ViewModel()
    
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
    
    var dataSourece: UICollectionViewDiffableDataSource<Int, String>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        NetworkBasic.shared.request(type: Beer.self, api: .Beers) { _ in
//
//        }
        
//        NetworkBasic.shared.requestConvertible(type: Beer.self, api: .Beers) { data in
//            print(data)
//        }
        
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        viewModel.request()
        
    }

    static func createLayout() -> UICollectionViewLayout{
        
        var configuration = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        configuration.backgroundColor = .brown
        configuration.showsSeparators = false
        
        let layout = UICollectionViewCompositionalLayout.list(using: configuration)
        
        return layout
        
    }
    

}

