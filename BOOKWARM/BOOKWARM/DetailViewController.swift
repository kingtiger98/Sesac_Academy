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
        mvOpenDateLabel.text = dateContents
        mvRateLabel.text = "\(rateContents)"
        mvRunningTimeLabel.text = "\(timeContents)"
        mvOverview.text = overviewContents
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
