//
//  ViewController.swift
//  MediaProject
//
//  Created by 황재하 on 8/19/23.
//

import UIKit
import Alamofire
import Kingfisher

class MediaViewController: UIViewController {

    @IBOutlet weak var MediaCollectionView: UICollectionView!
    @IBOutlet weak var segmentController: UISegmentedControl!
    @IBOutlet var MediaBackView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureMediaView()
        
        registerMediaCollectionView()
        configureMediaFlowLayout()
        configuerMediaCollection()
        configureSegment()
        
//        TmdbAPIManager.shared.callRequestTrend(type: .Trend) { data in
//            print(data)
//        }
        
        TmdbAPIManager.shared.callRequsetSimilar(type: .similar, movieId: 724209) { data in
            print(data)
        }
        
    }
    
    @IBAction func segmentChangeButtonClick(_ sender: UISegmentedControl) {
        
    }
    
 
}

extension MediaViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = MediaCollectionView.dequeueReusableCell(withReuseIdentifier: MediaCollectionViewCell.identifier, for: indexPath) as? MediaCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.configureMediaCollectionViewCell()
        
        return cell
    }
    
}

// 메인화면 디자인
extension MediaViewController {
    
    func configureMediaView() {
        
        MediaBackView.backgroundColor = .black
        
        
    }
    
}

// 세그먼트 디자인
extension MediaViewController {
    
    func configureSegment() {
        segmentController.selectedSegmentTintColor = .lightGray
        segmentController.backgroundColor = .darkGray
    }
}


// 컬렉션뷰 관련 함수
extension MediaViewController {

    func registerMediaCollectionView() {
        
        MediaCollectionView.dataSource = self
        MediaCollectionView.delegate = self
        
        let nib = UINib(nibName: MediaCollectionViewCell.identifier, bundle: nil)
        MediaCollectionView.register(nib, forCellWithReuseIdentifier: MediaCollectionViewCell.identifier)
    
    }
    
    func configureMediaFlowLayout() {
        
        let layout = UICollectionViewFlowLayout()
        let width = UIScreen.main.bounds.width / 3 - 12
        let spacing: CGFloat = 8
        
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: width, height: width * 1.5)
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        
        MediaCollectionView.collectionViewLayout = layout
        
    }
    
    func configuerMediaCollection(){
        
        MediaCollectionView.backgroundColor = .black
        
        
    }
    
}



