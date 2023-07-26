//
//  TotalViewController.swift
//  EmotionApp
//
//  Created by 황재하 on 7/26/23.
//

import UIKit

class TotalViewController: UIViewController {

    @IBOutlet var totalCountLabel: [UILabel]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateTotal()

        
    }
    

    @IBAction func updateButton(_ sender: UIButton) {
        
    }
    
    func updateTotal() {
        for emotion in 0...totalCountLabel.count - 1 {
            totalCountLabel[emotion].text = "\(totalCountList[emotion])점"
        }
    }
    
    

}
