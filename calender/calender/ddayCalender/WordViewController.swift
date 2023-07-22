//
//  WordViewController.swift
//  calender
//
//  Created by 황재하 on 7/21/23.
//

import UIKit

class WordViewController: UIViewController {

    @IBOutlet weak var wordTextField: UITextField!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var wordFirstButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        wordTextField.text = randomWord()
//        wordFirstButton.isHidden = true
         
    }
    
    @IBAction func didTapButton(_ sender: UIButton) {
        // 버튼 스타일 Plain일 땐 titleLabel로 버튼의 이름 접근해야함
//        print(sender.titleLabel?.text)
//        wordTextField.text = sender.titleLabel?.text!
        
        // 버튼 Style을 Default로 해야 currentTitle 사용가능
        print(sender.currentTitle!)
        wordTextField.text = sender.titleLabel?.text!
    }
    
    @IBAction func textKeyboardTapped(_ sender: UITextField) {
        print("DidEndOnExit")
//        if wordTextField.text == "별다줄" {
//            resultLabel.text = "별다줄은 뜻은 별거 다 줄인다 입니다."
//        } else if wordTextField.text == "뉴진스" {
//            resultLabel.text = "뉴진스의 뜻은..."
//        }  else {
//            resultLabel.text = "찾는 결과가 없습니다."
//        }
        
        switch wordTextField.text {
        case "뉴진스":
            resultLabel.text = "뉴진스의 뜻은..."
        case "알잘딱깔센":
            resultLabel.text = "알잘딱깔센의 뜻은..."
        case "별다줄":
            resultLabel.text = "별다줄은 뜻은 별거 다 줄인다 입니다."
        default:
            resultLabel.text = "찾는 결과가 없습니다."
        }
    }
    
    @discardableResult // 함수의 리턴값을 버릴 수 있게 하는 기능
    func randomWord() -> String {
        let random = ["고래밥", "칙촉", "카스타드", "메로나", "월드콘"]
        let resultWord = random.randomElement()!
        print(resultWord)
        
        return resultWord
    }
    
}
