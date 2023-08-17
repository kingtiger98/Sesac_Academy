//
//  ViewController.swift
//  SeSAC3Week4
//
//  Created by jack on 2023/08/07.
//

import UIKit
import Alamofire
import SwiftyJSON

struct Movie {
    var title: String
    var release: String
}


class ViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var indicatorView: UIActivityIndicatorView!
    @IBOutlet var movieTableView: UITableView!
    
    var movieList: [Movie] = []
    
    //codable*****
    var result: BoxOffice?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        movieTableView.rowHeight = 60
        movieTableView.delegate = self
        movieTableView.dataSource = self
        
        indicatorView.isHidden = true
        
        // callRequest(date: <#T##String#>)
    }

    func callRequest(date: String) {
        
        indicatorView.startAnimating()
        indicatorView.isHidden = false
        
        let url = "http://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=\(APIKey.boxOfficeKey)&targetDt=\(date)"
        // ****** codable
        AF.request(url, method: .get).validate()
            .responseDecodable(of: BoxOffice.self) { response in
                print(response.value)
                self.result = response.value
            }
        
        
        
        
        
        
        
        
        
//            .responseJSON { response in
//            switch response.result {
//            case .success(let value):
//                let json = JSON(value)
//                print("JSON: \(json)")
//
//                for item in json["boxOfficeResult"]["dailyBoxOfficeList"].arrayValue {
//
//                    let movieNm = item["movieNm"].stringValue
//                    let openDt = item["openDt"].stringValue
//
//                    let data = Movie(title: movieNm, release: openDt)
//                    self.movieList.append(data)
//
//                }
//
//                self.indicatorView.stopAnimating()
//                self.indicatorView.isHidden = true
//                self.movieTableView.reloadData()
//
//            case .failure(let error):
//                print(error)
//            }
//        }
        
    }
    
}

// 로딩 화면
extension ViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        // 20220101 > 1. 8글자, 2. 20233333 올바른 날짜 3. 날짜 범주
        callRequest(date: searchBar.text!)
        
        
        
        
    }
}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return result!.boxOfficeResult.dailyBoxOfficeList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell")!
        cell.textLabel?.text = movieList[indexPath.row].title
        cell.detailTextLabel?.text = movieList[indexPath.row].release
        
        return cell
        
    }
}
