//
//  MovieDetailViewController.swift
//  TMDBProject
//
//  Created by 황재하 on 8/12/23.
//

import UIKit
import Alamofire
import SwiftyJSON
import Kingfisher


struct Actor {
    let original_name: String
    let character: String
    let profile_path: String
}


class MovieDetailViewController: UIViewController {

    var actorInfo: [Actor] = []
    
    var nameContent: String = ""
    var backImageContent: String = ""
    var frontImageContent: String = ""
    var overviewContent: String = ""
    var movieID: String = ""
    
    @IBOutlet var backView: UIView!
    @IBOutlet weak var actorTable: UITableView!
    
    @IBOutlet weak var backImageView: UIImageView!
    @IBOutlet weak var frontImageView: UIImageView!
    @IBOutlet weak var movieNameLabel: UILabel!
    @IBOutlet weak var movieOverview: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: ActorTableViewCell.identifier, bundle: nil)
        actorTable.register(nib, forCellReuseIdentifier: ActorTableViewCell.identifier)
        actorTable.dataSource = self
        actorTable.delegate = self
        actorTable.rowHeight = 120
        
        
        callRequest()
        
        setMovieData()
        configureNavigationBar()
        configureTableView()
        configureLabel()
    }
    

    func callRequest() {
        TmdbCreditAPIManager.shared.callRequest(type: .actor, movieId: movieID) { Actor in
            self.actorInfo.append(Actor)
            self.actorTable.reloadData()
        }
    }
    

}

extension MovieDetailViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return actorInfo.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let row: Actor = actorInfo[indexPath.row]
        
        guard let cell = actorTable.dequeueReusableCell(withIdentifier: ActorTableViewCell.identifier, for: indexPath) as? ActorTableViewCell else {
            return UITableViewCell()
        }
        
        guard let url = URL(string: actorInfo[indexPath.row].profile_path) else {
            return UITableViewCell()
        }
        cell.actorImageView.kf.setImage(with: url)
        cell.configureCell(row: row)
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Cast"
    }
    
}


extension MovieDetailViewController {
    
    // MovieViewController -> MovieDetailViewController 값 전달 함수
    func transferData(row: Movie){
        nameContent = row.title
        backImageContent = row.backdropPath
        frontImageContent = row.posterPath
        overviewContent = row.overview
        movieID = String(describing: row.id)
    }
    
    // 전달 받은 값 셋팅 함수
    func setMovieData() {
        movieNameLabel.text = nameContent
        movieOverview.text = overviewContent
        
        let url1 = "https://image.tmdb.org/t/p/w500\(frontImageContent)"
        let url2 = "https://image.tmdb.org/t/p/w500\(backImageContent)"

            frontImageView.kf.setImage(with: URL(string: url1))
            backImageView.kf.setImage(with: URL(string: url2))
        
    }
    
    func configureNavigationBar() {
        navigationItem.title = "About Movie"
    }
    
    func configureTableView() {
        actorTable.backgroundColor = .white
    }
    
    func configureLabel() {
        movieNameLabel.font = .boldSystemFont(ofSize: 24)
        movieNameLabel.textColor = .white
    }
    
    
    
}
