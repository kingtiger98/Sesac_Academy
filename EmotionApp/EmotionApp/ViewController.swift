//
//  ViewController.swift
//  EmotionApp
//
//  Created by 황재하 on 7/25/23.
//

import UIKit

class ViewController: UIViewController {

    
//    @IBOutlet weak var pinkBtn: UIButton!
//    @IBOutlet weak var orangeBtn: UIButton!
//    @IBOutlet weak var yellowBtn: UIButton!
//    @IBOutlet weak var mintBtn: UIButton!
//    @IBOutlet weak var blueBtn: UIButton!
    
    
    @IBOutlet var emotionButtons: [UIButton]!
    
    var userTappedButton: Emotion = .pink
    
    override func viewDidLoad() {
        super.viewDidLoad()


    }

    
    @IBAction func emotionTapped(_ sender: UIButton) {
        
        guard let tappedEmotion = Emotion(rawValue: sender.tag) else {
            print("오류입니다")
            return
        }
        
        switch tappedEmotion {
        case .pink:
            UserDefaults.standard.set(pinkTotal, forKey: "pinkCount")
            pinkTotal += 1
        case .orange:
            UserDefaults.standard.set(orangeTotal, forKey: "orangeCount")
            orangeTotal += 1
        case .yellow:
            UserDefaults.standard.set(yellowTotal, forKey: "yellowCount")
            yellowTotal += 1
        case .mint:
            UserDefaults.standard.set(mintTotal, forKey: "mintCount")
            mintTotal += 1
        case .blue:
            UserDefaults.standard.set(blueTotal, forKey: "blueCount")
            blueTotal += 1
        }
        
//        // 값 저장 확인
//        print("\(pinkTotal), \(orangeTotal), \(yellowTotal), \(mintTotal), \(blueTotal)")
    }
    
    

    
    
    
}

