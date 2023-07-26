//
//  ViewController.swift
//  EmotionApp
//
//  Created by 황재하 on 7/25/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var emotionButtons: [UIButton]!
    
    
    var pinkTotal: Int = 0
    var orangeTotal: Int = 0
    var yellowTotal: Int = 0
    var mintTotal: Int = 0
    var blueTotal: Int = 0

    let defaults = UserDefaults.standard
    
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
            pinkTotal = defaults.integer(forKey: UserDefaultKey.pink.rawValue) + standardNum
            defaults.set(pinkTotal, forKey: Emotion.pink.key)
        case .orange:
            orangeTotal = defaults.integer(forKey: UserDefaultKey.orange.rawValue) + standardNum
            defaults.set(orangeTotal, forKey: Emotion.orange.key)
        case .yellow:
            yellowTotal = defaults.integer(forKey: UserDefaultKey.yellow.rawValue) + standardNum
            defaults.set(yellowTotal, forKey: Emotion.yellow.key)
        case .mint:
            mintTotal = defaults.integer(forKey: UserDefaultKey.mint.rawValue) + standardNum
            defaults.set(mintTotal, forKey: Emotion.mint.key)
        case .blue:
            blueTotal = defaults.integer(forKey: UserDefaultKey.blue.rawValue) + standardNum
            defaults.set(blueTotal, forKey: Emotion.blue.key)
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
