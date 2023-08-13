//
//  MovieTableViewCell.swift
//  TMDBProject
//
//  Created by 황재하 on 8/12/23.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    
    
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieNameLabel: UILabel!
    @IBOutlet weak var movieOverviewLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
