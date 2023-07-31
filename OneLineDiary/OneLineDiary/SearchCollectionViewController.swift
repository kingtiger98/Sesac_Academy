//
//  SearchCollectionViewController.swift
//  OneLineDiary
//
//  Created by 황재하 on 7/31/23.
//

import UIKit

private let reuseIdentifier = "Cell"

class SearchCollectionViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "SearchCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "SearchCollectionViewCell")
        
        setCollectionViewLayout()
    
    }

    
    // CollectionView 레이이웃 잡아보기 함수 *****
    func setCollectionViewLayout() {
        
        // cell estimated size none으로 인터페이스 빌더에서 설정할 것!
        // 1.
        let layout = UICollectionViewFlowLayout()
        
        let spacing: CGFloat = 20
        // 디바이스 전체 너비
        let width = UIScreen.main.bounds.width - ( spacing * 4 )
        
        // 2.
        layout.itemSize = CGSize(width: width / 3, height: width / 3)
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        
        // 3.
        collectionView.collectionViewLayout = layout
        
    }
    
    

    // 1. 셀 갯수
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    
    // 2. 셀 디자인 및 데이터 처리
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchCollectionViewCell", for: indexPath) as! SearchCollectionViewCell
        
        cell.backgroundColor = .brown
        cell.contentsLabel.text = "\(indexPath.description)"
        
        return cell
    }
    
    
    
}
