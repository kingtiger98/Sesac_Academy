//
//  DetailViewController.swift
//  BOOKWARM
//
//  Created by 황재하 on 7/31/23.
//

import UIKit

class DetailViewController: UIViewController {
    
    var nameContents: String = ""
    var dateContents: String = ""
    var overviewContents: String = ""
    
    var timeContents: Int = 0
    var rateContents: Double = 0.0
    
    @IBOutlet weak var mvImageView: UIImageView!
    @IBOutlet weak var mvName: UILabel!
    @IBOutlet weak var mvOpenDateLabel: UILabel!
    @IBOutlet weak var mvRateLabel: UILabel!
    @IBOutlet weak var mvRunningTimeLabel: UILabel!
    @IBOutlet weak var mvOverview: UITextView!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mvImageView.image = UIImage(named: nameContents)
        mvName.text = nameContents
        mvOpenDateLabel.text = "개봉    " + dateContents
        mvRateLabel.text = "평점    " + "\(rateContents)"
        mvRunningTimeLabel.text = "\(timeContents)분"
        mvOverview.text = overviewContents
        
    }
    



}
