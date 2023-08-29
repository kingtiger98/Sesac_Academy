//
//  MovieViewController.swift
//  TMDBCodeBase
//
//  Created by 황재하 on 8/28/23.
//

import UIKit

class MovieViewController: BaseViewController{
    
    let mainView = MovieView()
    
    var movieinfo = MovieData(totalPages: 0, totalResults: 0, page: 0, results: [])
    
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Movies"
        
        callRequestMovieData { data in
            self.movieinfo = data
            self.mainView.MovieCollectionView.reloadData()
        }
        
    }
    
    override func setConfigure() {
        super.setConfigure()
        mainView.MovieCollectionView.delegate = self
        mainView.MovieCollectionView.dataSource = self
    }
    
    override func setConstraints() {
        super.setConstraints()
    }

    override func callRequestMovieData(completionHandler: @escaping (MovieData) -> Void) {
        super.callRequestMovieData(completionHandler: completionHandler)
    }
    
}

extension MovieViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movieinfo.results.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let item = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCollectionViewCell.identifier, for: indexPath) as? MovieCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let url = "https://image.tmdb.org/t/p/w500\(movieinfo.results[indexPath.row].posterPath)"
        item.posterImageView.kf.setImage(with: URL(string: url))
        
        return item
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
                
        let item = movieinfo.results[indexPath.row]
        
        // 값 전달 중요 포인트***
        let vc = ActorViewController()
        vc.mainView.moviedetail.movieNameContent = item.title
        vc.mainView.moviedetail.movieIdContent = item.id
        vc.mainView.moviedetail.backgroundPosterContent = item.backdropPath
        vc.mainView.moviedetail.foregroundPosterContent = item.posterPath
        vc.mainView.moviedetail.movieOverview = item.overview
        
        vc.movieid = item.id
        
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
}
