//
//  BestTableViewCell.swift
//  BOOKWARM
//
//  Created by 황재하 on 8/2/23.
//

import UIKit

class BestTableViewCell: UITableViewCell {

    static let identifier: String = "BestTableViewCell"
    
    @IBOutlet weak var bestMoviePosterImageView: UIImageView!
    @IBOutlet weak var bestMovieNameLabel: UILabel!
    @IBOutlet weak var bestMovieOpenDateLabel: UILabel!
    @IBOutlet weak var bestMovieRateLabel: UILabel!
    
}
