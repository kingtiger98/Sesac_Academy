//
//  ViewController.swift
//  MediaProject
//
//  Created by 황재하 on 8/19/23.
//

import UIKit
import Alamofire
import Kingfisher
import WebKit

class MediaViewController: UIViewController {
    
    @IBOutlet var MediaBackView: UIView!
    @IBOutlet weak var MediaCollectionView: UICollectionView!
    @IBOutlet weak var movieNameLabel: UILabel!
    @IBOutlet weak var videoWebView: WKWebView!
    
    var smilarList : SimilarData = SimilarData(page: 0, results: [], totalPages: 0, totalResults: 0)
    var videoList : VideoData = VideoData(id: 0, results: [])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureMediaView()
        configureNavigatinController()
        registerMediaCollectionView()
        configureMediaFlowLayout()
        configuerMediaCollection()
        
        
        dispatchGroupSimilarData()

        
    }
    
    func dispatchGroupSimilarData(){
        let groupSimilar = DispatchGroup()
        
        groupSimilar.enter()
        TmdbAPIManager.shared.callRequsetSimilar(type: .similar, movieId: 724209, page: 1) { data in
            print("작업 1 : callRequsetSimilar")
            self.smilarList = data
            groupSimilar.leave()
        }
        
        groupSimilar.enter()
        TmdbAPIManager.shared.callRequestVideo(type: .video, movieId: 724209) { data in
            print("작업 2 : callRequestVideo")
            self.videoList = data
            
            self.configureWebView()
            
            groupSimilar.leave()
        }
        
        
        groupSimilar.notify(queue: .main) {
            print("작업 groupSimilar END")
            
            self.MediaCollectionView.reloadData()
        }
    }
    
 
}

extension MediaViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return smilarList.results.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = MediaCollectionView.dequeueReusableCell(withReuseIdentifier: MediaCollectionViewCell.identifier, for: indexPath) as? MediaCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let row = smilarList.results[indexPath.row]
        
        cell.configureMediaCollectionViewCell(row: row)
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        TmdbAPIManager.shared.callRequestVideo(type: .video, movieId: smilarList.results[indexPath.row].id) { data in
            
            self.movieNameLabel.text = data.results[0].name

            let videoURLString = "https://www.youtube.com/watch?v=\(data.results[0].key)?autoplay=0"
            
            if let videoURL = URL(string: videoURLString) {
                let request = URLRequest(url: videoURL)
                self.videoWebView.load(request)
                
            }
            
        }
        
    }
    
    
    
}

// 메인화면 디자인
extension MediaViewController {
    
    func configureMediaView() {
        MediaBackView.backgroundColor = .black
    }
    
    func configureNavigatinController() {
        navigationItem.title = "Movies"
        
    }
    
    func configureWebView() {
        self.movieNameLabel.text = self.videoList.results[2].name
        
        let videoURLString = "https://www.youtube.com/watch?v=\(self.videoList.results[0].key)?autoplay=0"
        if let videoURL = URL(string: videoURLString) {
            let request = URLRequest(url: videoURL)
            self.videoWebView.load(request)
            
            // 웹뷰 설정: 비디오 자동 재생 비활성화
            self.videoWebView.configuration.allowsInlineMediaPlayback = false
  
        }
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



