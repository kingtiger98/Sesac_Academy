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
    
    var allinfo = AllData(page: 0, results: [], totalPages: 0, totalResults: 0) //**
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    override func setConfigure() {
        super.setConfigure()
        
        mainView.MovieCollectionView.delegate = self
        mainView.MovieCollectionView.dataSource = self
        
        callRequestMovieData { data in
            self.movieinfo = data
            self.mainView.MovieCollectionView.reloadData()
        }
        
        //**
        callRequestAllData { data in
            print(data)
            self.allinfo = data
            self.mainView.MovieCollectionView.reloadData()
        }
        
        setNavigationItem()
        
    }
    
    override func setConstraints() {
        super.setConstraints()
        
    }

    override func callRequestMovieData(completionHandler: @escaping (MovieData) -> Void) {
        super.callRequestMovieData(completionHandler: completionHandler)
    }
    
    func setNavigationItem() {
        navigationItem.title = "Movies"
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "person.fill"), style: .plain, target: self, action: #selector(profileButtonClicked))
        navigationItem.titleView?.tintColor = .black
        navigationItem.rightBarButtonItem?.tintColor = .black
    }
    
    @objc func profileButtonClicked() {
        navigationController?.pushViewController(ProfileViewController(), animated: true)
    }
    
}

extension MovieViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // return movieinfo.results.count
        return allinfo.results.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let info = allinfo.results[indexPath.row]
        
        guard let item = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCollectionViewCell.identifier, for: indexPath) as? MovieCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let url = "https://image.tmdb.org/t/p/w500\(info.posterPath)"
        item.posterImageView.kf.setImage(with: URL(string: url))
        
        if info.mediaType.rawValue == "tv" {
            item.setTypeConfiguer(type: "TV SERIES", color: UIColor.magenta.cgColor)
        } else {
            item.setTypeConfiguer(type: "MOVIE", color: UIColor.purple.cgColor)
        }
        
        return item
        
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
                
        let item = allinfo.results[indexPath.row]
        
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
