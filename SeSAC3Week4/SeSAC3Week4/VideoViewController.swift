//
//  VideoViewController.swift
//  SeSAC3Week4
//
//  Created by jack on 2023/08/08.
//

import UIKit
import Alamofire
import SwiftyJSON
import Kingfisher

// https://openapi.naver.com/v1/papago/n2mt


struct Video {
    let author: String
    let date: String
    let time: Int
    let thumbnail: String
    let title: String
    let link: String
    
    var contents: String {
        return "\(author) | \(time)회\n\(date)"
    }
    
}

class VideoViewController: UIViewController {

    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var videoTableView: UITableView!
    
    var videoList: [Video] = []
    
    var videoInfo: VideoData = VideoData(documents: [])
    
    var page = 1
    var isEnd = false //현재 페이지가 마지막 페이지인지 점검하는 프로퍼티
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        videoTableView.delegate = self
        videoTableView.dataSource = self
        videoTableView.prefetchDataSource = self
        videoTableView.rowHeight = 140

        searchBar.delegate = self
    }
 
    func callRequest(query: String, page: Int, completionHandler: @escaping (VideoData) -> Void ) {
        
        KakaoAPIManager.shared.callRequest(type: .video, query: query) { data in
            print(data)
            completionHandler(data)
        }
        
        //KakaoAPIManager.shared.callRequest(type: .video, query: query) { json in
            //print("===========================\(json)")
            
        }
        
    
    }

  
extension VideoViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        page = 1 //새로운 검색어이기 때문에 page를 1로 변경
        videoList.removeAll()
        
        guard let query = searchBar.text else { return }
        
        //callRequest(query: query, page: page)
        callRequest(query: query, page: page) { data in
            self.videoInfo = data
            self.videoTableView.reloadData()
        }
    }
    
}


extension VideoViewController: UITableViewDelegate, UITableViewDataSource, UITableViewDataSourcePrefetching {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videoInfo.documents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "VideoTableViewCell") as? VideoTableViewCell else { return UITableViewCell() }
        
        cell.titleLabel.text = videoInfo.documents[indexPath.row].title
        cell.contentLabel.text = videoInfo.documents[indexPath.row].author
        
        if let url = URL(string: videoInfo.documents[indexPath.row].thumbnail) {
            cell.thumbnailImageView.kf.setImage(with: url)
        }
         
        return cell
    }
    
    //UITableViewDataSourcePrefetching: iOS10이상 사용 가능한 프로토콜, cellForRowAt 메서드가 호출되기 전에 미리 호출됨
    
    //셀이 화면에 보이기 직전에 필요한 리소스를 미리 다운 받는 기능
    //videoList 갯수와 indexPath.row 위치를 비교해 마지막 스크롤 시점을 확인 -> 네트워크 요청 시도
    //page count
    //
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        
        for indexPath in indexPaths {
            if videoList.count - 1 == indexPath.row && page < 15 && isEnd == false {
                page += 1
                // callRequest(query: searchBar.text!, page: page)
                callRequest(query: searchBar.text!, page: page) { data in
                    self.videoInfo = data
                }
            }
        }
    }
    
    //취소 기능: 직접 취소하는 기능을 구현해주어야 함!
    func tableView(_ tableView: UITableView, cancelPrefetchingForRowsAt indexPaths: [IndexPath]) {
        print("====취소: \(indexPaths)")
    }
    
}
