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

class MovieDetailViewController: UIViewController {

    struct Actor {
        let original_name: String
        let character: String
        let profile_path: String
    }
    
    var actorInfo: [Actor] = []
    
    var nameContent: String = ""
    var backImageContent: String = ""
    var frontImageContent: String = ""
    var overviewContent: String = ""
    var movieID: String = ""
    
    @IBOutlet weak var actorTable: UITableView!
    
    @IBOutlet weak var backImageView: UIImageView!
    @IBOutlet weak var frontImageView: UIImageView!
    @IBOutlet weak var movieNameLabel: UILabel!
    @IBOutlet weak var movieOverview: UITextView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "ActorTableViewCell", bundle: nil)
        actorTable.register(nib, forCellReuseIdentifier: "ActorTableViewCell")
        actorTable.dataSource = self
        actorTable.delegate = self
        actorTable.rowHeight = 120
        
        
        callRequest()
        
        setMovieData()
        configureNavigationBar()
        configureLabel()
    }
    
    
    func callRequest() {
        
        let urlCredit =  "https://api.themoviedb.org/3/movie/\(movieID)/credits?language=ko-KR"
        
        let headers: HTTPHeaders = [
          "accept": "application/json",
          "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJjMGI0NTQ2NDIwYzcyNmE4MWQyYjcxMWEwNDhlMTg0NiIsInN1YiI6IjY0ZDZlZGU3ZjQ5NWVlMDI4ZjYzZDNiYyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.BGtl-e-IpDeMJ9JAqP2qK5rmfvOf5gBPOuuYeYfDcbk"
        ]

        AF.request(urlCredit, method: .get, headers: headers).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                
                // json["cast"].arrayValue

                for actor in json["cast"].arrayValue {
                    let original_name = actor["original_name"].stringValue
                    let character = actor["character"].stringValue
                    let profile_path =  "https://image.tmdb.org/t/p/w500/" + actor["profile_path"].stringValue
                    
                    print(original_name, character, profile_path)
                    
                    let data = Actor(original_name: original_name, character: character, profile_path: profile_path)
                    
                    self.actorInfo.append(data)
                }
                
                self.actorTable.reloadData()
                
                
            case .failure(let error):
                print(error)
            }
        }
        
        
    }
    
    

}

extension MovieDetailViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return actorInfo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = actorTable.dequeueReusableCell(withIdentifier: "ActorTableViewCell", for: indexPath) as? ActorTableViewCell else {
            return UITableViewCell()
        }
        
        if let url = URL(string: actorInfo[indexPath.row].profile_path) {
            cell.actorImageView.kf.setImage(with: url)
            cell.actorImageView.layer.cornerRadius = 5
        }
        
        cell.actorNameLabel.text = actorInfo[indexPath.row].original_name
        cell.characterLabel.text = actorInfo[indexPath.row].character
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Cast"
    }
    
    
    
    
}


extension MovieDetailViewController {
    
    func setMovieData() {
        movieNameLabel.text = nameContent
        movieOverview.text = overviewContent
        
        if let url1 = URL(string: frontImageContent), let url2 = URL(string: backImageContent) {
            frontImageView.kf.setImage(with: url1)
            backImageView.kf.setImage(with: url2)
        }
    }
    
    
    func configureNavigationBar() {
        navigationItem.title = "About Movie"

    }
    
    func configureLabel() {
        movieNameLabel.font = .boldSystemFont(ofSize: 24)
        movieNameLabel.textColor = .white
    }
    
    
    
}
