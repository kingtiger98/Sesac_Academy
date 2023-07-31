//
//  MovieTableViewCell.swift
//  SeSACWeek3
//
//  Created by 황재하 on 7/28/23.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    
    @IBOutlet weak var moviePoster: UIImageView!
    
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieOpenDate: UILabel!
    @IBOutlet weak var movieRunTime: UILabel!
    @IBOutlet weak var movieScore: UILabel!
    @IBOutlet weak var movieInformation: UILabel!
    
    func configureCell(row: Movie) {
        moviePoster.image = UIImage(named: "\(row.title)")
        movieTitle.text = row.title
        movieOpenDate.text = row.releaseDate + "ㅣ"
        movieRunTime.text = "\(row.runtime)" + "분 ㅣ"
        movieScore.text = "\(row.rate)" + "점"
        movieInformation.text = row.overview
        
    }

}




