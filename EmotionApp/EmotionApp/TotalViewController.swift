//
//  TotalViewController.swift
//  EmotionApp
//
//  Created by 황재하 on 7/26/23.
//

import UIKit

class TotalViewController: UIViewController {

    let defaults = UserDefaults.standard
        
    @IBOutlet weak var pinkResultLabel: UILabel!
    @IBOutlet weak var orangeResultLabel: UILabel!
    @IBOutlet weak var yellowResultLabel: UILabel!
    @IBOutlet weak var mintResultLabel: UILabel!
    @IBOutlet weak var blueResultLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        configureResultLabels()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        updateTotal()

    }
    
    func updateTotal() {
        let pinkResult = defaults.integer(forKey: Emotion.pink.key)
        let orangeResult = defaults.integer(forKey: Emotion.orange.key)
        let yellowResult = defaults.integer(forKey: Emotion.yellow.key)
        let mintResult = defaults.integer(forKey: Emotion.mint.key)
        let blueResult = defaults.integer(forKey: Emotion.blue.key)
     
        pinkResultLabel.text = "\(pinkResult)점"
        orangeResultLabel.text = "\(orangeResult)점"
        yellowResultLabel.text = "\(yellowResult)점"
        mintResultLabel.text = "\(mintResult)점"
        blueResultLabel.text = "\(blueResult)점"
    }
    
    func configureResultLabels() {
        pinkResultLabel.text = "0점"
        orangeResultLabel.text = "0점"
        yellowResultLabel.text = "0점"
        mintResultLabel.text = "0점"
        blueResultLabel.text = "0점"
    }

}
