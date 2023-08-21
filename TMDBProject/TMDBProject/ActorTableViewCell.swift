//
//  ActorTableViewCell.swift
//  TMDBProject
//
//  Created by 황재하 on 8/13/23.
//

import UIKit

class ActorTableViewCell: UITableViewCell {
    
    @IBOutlet weak var actorImageView: UIImageView!
    @IBOutlet weak var actorNameLabel: UILabel!
    @IBOutlet weak var characterLabel: UILabel!
    
    
    func configureCell(row: Cast) {
        actorImageView.layer.cornerRadius = 5
        actorNameLabel.text = row.originalName
        characterLabel.text = row.character
    }
    
    
    
}
