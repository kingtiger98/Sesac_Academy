//
//  BestTableViewCell.swift
//  BOOKWARM
//
//  Created by 황재하 on 8/2/23.
//

import UIKit

final class BestTableViewCell: UITableViewCell {

    static let identifier: String = "BestTableViewCell"
    
    @IBOutlet weak var bestMoviePosterImageView: UIImageView!
    @IBOutlet weak var bestMovieNameLabel: UILabel!
    @IBOutlet weak var bestMovieOpenDateLabel: UILabel!
    @IBOutlet weak var bestMovieRateLabel: UILabel!
    
    
    func configureCell(row: Movie) {
        bestMoviePosterImageView.image = UIImage(named: row.title)
        bestMovieNameLabel.text = row.title
        bestMovieOpenDateLabel.text = row.releaseDate
        bestMovieRateLabel.text = "⭐️ " + "\(row.rate)"

        bestMoviePosterImageView.layer.cornerRadius = 5
        bestMovieNameLabel.textColor = .darkGray
        bestMovieOpenDateLabel.textColor = .lightGray
        bestMovieRateLabel.textColor = .darkGray
    }
    
    
}
