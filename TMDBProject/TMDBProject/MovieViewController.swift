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


//struct Movie {
//    let id: String
//    let title: String
//    let overview: String
//    let release_date: String
//    let vote_average: String
//    let poster_path: String
//    let backdrop_path: String
//}


class MovieViewController: UIViewController {
    
    @IBOutlet weak var MovieCollectionView: UICollectionView!
    @IBOutlet var backView: UIView!
    
    // Codable***
    var movieInfo: MovieData = MovieData(totalPages: 0, totalResults: 0, page: 0, results: [] )
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: MovieCollectionViewCell.identifier, bundle: nil)
        MovieCollectionView.register(nib, forCellWithReuseIdentifier: MovieCollectionViewCell.identifier)
        MovieCollectionView.delegate = self
        MovieCollectionView.dataSource = self
        
        configureNavigationBar()
        configureCollectionView()
        configureFlowLayout()
        
        callRequset { data in
            self.movieInfo = data
            self.MovieCollectionView.reloadData()
        }
        
    }
    
    func callRequset(completHandler: @escaping (MovieData) -> Void) {
        
        TmdbAPIManager.shared.callRequsetCodable(type: .movie) { response in
            
            // Codable
            print(self.movieInfo.results.count)
            completHandler(response)
        }
        
    }
    
}



extension MovieViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // return movieInfo.count
        
        return movieInfo.results.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        
        
        guard let cell = MovieCollectionView.dequeueReusableCell(withReuseIdentifier: MovieCollectionViewCell.identifier, for: indexPath) as? MovieCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        // Codable***
        
        let url = "https://image.tmdb.org/t/p/w500\(movieInfo.results[indexPath.row].posterPath)"
        cell.movieImageView.kf.setImage(with: URL(string: url))
        
        cell.configureCell()
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let row: Movie = movieInfo.results[indexPath.row]
        
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
        navigationController?.navigationBar.tintColor = .black
        
    }
    
    func configureCollectionView() {
        
        MovieCollectionView.backgroundColor = .white
        backView.backgroundColor = .white
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
