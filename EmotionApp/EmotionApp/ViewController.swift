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
    
    @IBOutlet weak var pullDownBtn: UIButton!
    
    var userTappedButton: Emotion = .pink
    
    var standardNum: Int = 1
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pullDownBtnMake()
        configureRightBarButtonItem()

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
    }
    
    @IBAction func emotionTapped(_ sender: UIButton) {
        
        guard let tappedEmotion = Emotion(rawValue: sender.tag) else {
            print("오류입니다")
            return
        }
        
        switch tappedEmotion {
        case .pink:
            // 탭 횟수 저장
            pinkTotal += standardNum
            defaults.set(pinkTotal, forKey: "pinkCount")
        case .orange:
            orangeTotal += standardNum
            defaults.set(pinkTotal, forKey: "orangeCount")
        case .yellow:
            yellowTotal += standardNum
            defaults.set(pinkTotal, forKey: "yellowCount")
        case .mint:
            mintTotal += standardNum
            defaults.set(pinkTotal, forKey: "mintCount")
        case .blue:
            blueTotal += standardNum
            defaults.set(pinkTotal, forKey: "blueCount")
        }
        
        // 값 저장 확인
        print("\(pinkTotal), \(orangeTotal), \(yellowTotal), \(mintTotal), \(blueTotal)")
    }
    

    func pullDownBtnMake() {
        
    }

}

extension ViewController {
    
    func configureRightBarButtonItem() {
        let favorite1 = UIAction(title: "+ 1", image: UIImage(systemName: "heart"), handler: { _ in self.standardNum = 1 })
        let favorite2 = UIAction(title: "+ 5", image: UIImage(systemName: "heart"), handler: { _ in self.standardNum = 5 })
        let favorite3 = UIAction(title: "+ 10", image: UIImage(systemName: "heart"), handler: { _ in self.standardNum = 10 })
        
        let barButton = UIBarButtonItem(
            image: UIImage(systemName: "ellipsis.circle"),
            style: .plain,
            target: self,
            action: nil
        )
        barButton.menu = UIMenu(title: "탭 횟수 조정하기",
                                image: UIImage(systemName: "heart.fill"),
                                identifier: nil,
                                options: .displayInline,
                                children: [favorite1, favorite2, favorite3])
        
        navigationItem.rightBarButtonItem = barButton
    }
    
}
