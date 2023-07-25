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
    @IBOutlet weak var pullDownButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()


    }

    
    @IBAction func emotionTapped(_ sender: UIButton) {
        if sender.tag == 1 {
            countTapped[Emotion.pink]! += 1
            print("완전행복지수를 \(countTapped[Emotion.pink]!)회 입력하셨습니다.")
        } else if sender.tag == 2 {
            countTapped[Emotion.orange]! += 1
            print("적당미소지수를 \(countTapped[Emotion.orange]!)회 입력하셨습니다.")
        } else if sender.tag == 3 {
            countTapped[Emotion.yellow]! += 1
            print("그냥저냥지수를 \(countTapped[Emotion.yellow]!)회 입력하셨습니다.")
        } else if sender.tag == 4 {
            countTapped[Emotion.mint]! += 1
            print("좀속상한지수를 \(countTapped[Emotion.mint]!)회 입력하셨습니다.")
        } else if sender.tag == 5 {
            countTapped[Emotion.blue]! += 1
            print("많이슬픈지수를 \(countTapped[Emotion.blue]!)회 입력하셨습니다.")
        }
    }
    
    
    @IBAction func tapCountChageButton(_ sender: UIButton) {
        pullDownButton.showsMenuAsPrimaryAction = true
        
        let ok = UIAction(title: "확인", handler: { _ in print("확인") })
        let cancel = UIAction(title: "취소", attributes: .destructive, handler: { _ in print("취소") })
        let buttonMenu = UIMenu(title: "메뉴 타이틀", children: [ok, cancel])
        pullDownButton.menu = buttonMenu
    }
    
    
    
}

