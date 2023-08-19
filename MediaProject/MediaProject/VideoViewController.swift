//
//  VideoViewController.swift
//  MediaProject
//
//  Created by 황재하 on 8/19/23.
//

import UIKit

class VideoViewController: UIViewController {

    var nameContent : String = ""
    
    @IBOutlet weak var movieNameLabel: UILabel!
    @IBOutlet weak var videoImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        movieNameLabel.text = nameContent
        
    }
    



}
