//
//  ViewController.swift
//  TMDBProject
//
//  Created by 황재하 on 8/12/23.
//

import UIKit
import Alamofire
import SwiftyJSON
import Kingfisher

struct Movie {
    let id: String
    let title: String
    let overview: String
    let release_date: String
    let vote_average: String
    let poster_path: String
    let backdrop_path: String
}

class MovieViewController: UIViewController {

    @IBOutlet weak var MovieCollectionView: UICollectionView!
    
    var movieInfo: [Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: MovieCollectionViewCell.identifier, bundle: nil)
        MovieCollectionView.register(nib, forCellWithReuseIdentifier: MovieCollectionViewCell.identifier)
        MovieCollectionView.delegate = self
        MovieCollectionView.dataSource = self
        
        callRequset()
        
        configureNavigationBar()
        configureFlowLayout()
    }


    func callRequset() {
        TmdbAPIManager.shared.callRequset(type: .movie) { Movie in
            self.movieInfo.append(Movie)
            self.MovieCollectionView.reloadData()
        }
    }
        
//     func callRequset() {
//        // "https://api.themoviedb.org/3/trending/all/day?language=en-US"
//        // let urlTrend =  URL.baseURl + "trending/all/day?language=en-US"
//        let urlTrend =  EndPoint.movie.requestURL
//
//        let headers: HTTPHeaders = [
//          "accept": "application/json",
//          "Authorization": APIKey.TMDBToken
//        ]
//
//        AF.request(urlTrend, method: .get, headers: headers).validate().responseJSON { response in
//            switch response.result {
//            case .success(let value):
//                let json = JSON(value)
//
//                // print(json["results"].arrayValue.count)
//
//                for item in json["results"].arrayValue {
//
//                    let id = item["id"].stringValue
//                    let title = item["title"].stringValue
//                    let overview = item["overview"].stringValue
//                    let release_date = item["release_date"].stringValue
//                    let vote_average = item["vote_average"].stringValue
//                    let poster_path = "https://image.tmdb.org/t/p/w500/" + item["poster_path"].stringValue
//                    let backdrop_path = "https://image.tmdb.org/t/p/w500/" + item["backdrop_path"].stringValue
//
//
//                    let data = Movie(id: id, title: title, overview: overview, release_date: release_date, vote_average: vote_average, poster_path: poster_path, backdrop_path: backdrop_path)
//
//                    self.movieInfo.append(data)
//
//                }
//
//                    self.MovieCollectionView.reloadData()
//
//            case .failure(let error):
//                print("통신 안됐지요")
//                print(error)
//            }
//        }
//
//    }
    
    
    
}


extension MovieViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movieInfo.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let row: Movie = movieInfo[indexPath.row]
        
        guard let cell = MovieCollectionView.dequeueReusableCell(withReuseIdentifier: MovieCollectionViewCell.identifier, for: indexPath) as? MovieCollectionViewCell else {
            return UICollectionViewCell()
        }
    
        guard let url = URL(string: row.poster_path) else {
            return UICollectionViewCell()
        }
        cell.movieImageView.kf.setImage(with: url)
        
        cell.configureCell()
        
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let row: Movie = movieInfo[indexPath.row]
        
        guard let detailVC = storyboard?.instantiateViewController(withIdentifier: MovieDetailViewController.identifier) as? MovieDetailViewController else{
            return
        }
        
        // 값 전달
        detailVC.transferData(row: row)
        
        navigationController?.pushViewController(detailVC, animated: true)
        
    }

    
}




extension MovieViewController {
    
    func configureNavigationBar() {
        navigationItem.title = "Movies"
        navigationItem.backButtonTitle = ""
        navigationController?.navigationBar.tintColor = .white
    }
    
    func configureFlowLayout(){
        let layout = UICollectionViewFlowLayout()
        
        let width = UIScreen.main.bounds.width / 3
        
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: width - 12, height: width * 1.5)
        layout.sectionInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        layout.minimumLineSpacing = 8
        layout.minimumInteritemSpacing = 8
        
        MovieCollectionView.collectionViewLayout = layout
    }
    
}
