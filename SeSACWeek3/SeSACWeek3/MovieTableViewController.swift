//
//  MovieTableViewController.swift
//  SeSACWeek3
//
//  Created by 황재하 on 7/28/23.
//

import UIKit

class MovieTableViewController: UITableViewController {

    let movieInfo = MovieInfo()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return movieInfo.movie.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "movieTableViewCell") as? MovieTableViewCell else {
            return UITableViewCell()
        }
        
        cell.moviePoster.image = UIImage(named: "\(movieInfo.movie[indexPath.row].title)")
        cell.movieTitle.text = movieInfo.movie[indexPath.row].title
        cell.movieOpenDate.text = movieInfo.movie[indexPath.row].releaseDate + "ㅣ"
        cell.movieRunTime.text = "\(movieInfo.movie[indexPath.row].runtime)" + "분 ㅣ"
        cell.movieScore.text = "\(movieInfo.movie[indexPath.row].rate)" + "점"
        cell.movieInformation.text = movieInfo.movie[indexPath.row].overview

        
        return cell
    }
    
    

}
