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
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Movie.identifier) as? MovieTableViewCell else {
            return UITableViewCell()
        }
        
        let row = movieInfo.movie[indexPath.row]
        
        cell.configureCell(row: row)
//        cell.moviePoster.image = UIImage(named: "\(row.title)")
//        cell.movieTitle.text = row.title
//        cell.movieOpenDate.text = row.releaseDate + "ㅣ"
//        cell.movieRunTime.text = "\(row.runtime)" + "분 ㅣ"
//        cell.movieScore.text = "\(row.rate)" + "점"
//        cell.movieInformation.text = row.overview

        
        return cell
    }
    
    

}
