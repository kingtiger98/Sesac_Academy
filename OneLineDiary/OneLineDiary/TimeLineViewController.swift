//
//  TimeLineViewController.swift
//  OneLineDiary
//
//  Created by 황재하 on 8/2/23.
//

import UIKit

// 1. 프로토콜(ex. 부하직원) : UICollectionViewDataSource, UICollectionViewDelegate
// 2. 컬렉션뷰와 부하직원을 연결 : delegate = self (타입으로서 프로토콜 사용)
// 3. 컬렉션뷰 아웃렛 선연

// 1.
class TimeLineViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    // 3.
    @IBOutlet weak var todayCollectionView: UICollectionView!
    
    
    @IBOutlet weak var bestCollectionView: UICollectionView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 2.
        todayCollectionView.dataSource = self
        todayCollectionView.delegate = self
        bestCollectionView.dataSource = self
        bestCollectionView.delegate = self
        
        
        
        
        // 컬렉션뷰 셀 등록
        let nib1 = UINib(nibName: "SearchCollectionViewCell", bundle: nil)
        todayCollectionView.register(nib1, forCellWithReuseIdentifier: "SearchCollectionViewCell")

        let nib2 = UINib(nibName: "SearchCollectionViewCell", bundle: nil)
        bestCollectionView.register(nib2, forCellWithReuseIdentifier: "SearchCollectionViewCell")
        
        
        // 컬렉션뷰 디자인
        configureCollectionViewLayout()
        configureBestCollectionViewLayout()
    }
    
    
    //
    func configureCollectionViewLayout() {
        
        let layout = UICollectionViewFlowLayout()
        
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 100, height: 180)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
        
        todayCollectionView.collectionViewLayout = layout

    }
    
    //
    func configureBestCollectionViewLayout() {
        
        let layout = UICollectionViewFlowLayout()
        
        layout.scrollDirection = .horizontal // 스크롤 방향 설정
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width, height: 180) // 아이템의 가로, 세로 크기
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0) // 컬렉션뷰 상하좌우 여백
        layout.minimumLineSpacing = 0 // 섹션 내의 아이템 사이의 간격
        layout.minimumInteritemSpacing = 0 // 섹션 간의 간격
        
        bestCollectionView.collectionViewLayout = layout // 레이아웃 컬렉션 뷰에 적용
        
        // 디바이스 너비 기준으로 페이징 된다는 점~
        bestCollectionView.isPagingEnabled = true
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return collectionView == todayCollectionView ? 6 : 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchCollectionViewCell", for: indexPath) as! SearchCollectionViewCell
        
        if collectionView == todayCollectionView {
            cell.contentsLabel.text = "Today : \(indexPath.item)"
            cell.backgroundColor = .orange
        } else {
            cell.contentsLabel.text = "Best : \(indexPath.item)"
            cell.backgroundColor = [.gray, .purple, .blue].randomElement()
        }
        
        // cell.contentsLabel.text = "\(indexPath.item)"
        // cell.backgroundColor = .gray
        
        return cell
    }
    


    



}
