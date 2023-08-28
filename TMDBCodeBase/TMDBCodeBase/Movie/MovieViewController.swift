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
        
        callRequest { data in
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

    override func callRequest(completionHandler: @escaping (MovieData) -> Void) {
        super.callRequest(completionHandler: completionHandler)
    }
    
}



extension MovieViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movieinfo.results.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let item = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCollectionViewCell", for: indexPath) as? MovieCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let url = "https://image.tmdb.org/t/p/w500\(movieinfo.results[indexPath.row].posterPath)"
        item.posterImageView.kf.setImage(with: URL(string: url))
        
        return item
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        transition(ViewController: ActorViewController.self, style: .push)
        
    }
    
    
}
