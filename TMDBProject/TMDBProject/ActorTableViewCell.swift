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
    
    
    func configureCell(row: Actor) {
        actorImageView.layer.cornerRadius = 5
        actorNameLabel.text = row.original_name
        characterLabel.text = row.character
    }
    
    
    
}
