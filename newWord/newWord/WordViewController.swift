//
//  ViewController.swift
//  newWord
//
//  Created by 황재하 on 7/20/23.
//

import UIKit

let words = ["번달번줌", "만반잘부", "별다줄", "알잘딱깔센", "억까"]

class WordViewController: UIViewController {

    
    @IBOutlet weak var newWordTextField: UITextField!
    @IBOutlet var newWorldButtonList: [UIButton]!
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        newWordTextFieldDesign()
        newWordListDesign()
        newWordListWordSet()

        print("안녕안녕")
        
    }

    // 돋보기 버튼
    @IBAction func newWordSearchButton(_ sender: UIButton) {
        resultLabel.text = newWordMean(newWord: newWordTextField.text!)
    }
    
    
    // 텍스트필드 엔터 버튼
    @IBAction func textFieldEnterButton(_ sender: Any) {
        resultLabel.text = newWordMean(newWord: newWordTextField.text!)
    }
    
    // 추천 신조어 버튼
    @IBAction func newWordButtonTapped(_ sender: UIButton) {
        newWordTextField.text = sender.titleLabel?.text!
    }
    
    // 텍스트필드 디자인
    func newWordTextFieldDesign() {
        
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.darkGray, // 원하는 색상으로 변경
            .font: newWordTextField.font! // 텍스트 필드의 폰트와 동일한 폰트 사용
        ]
        
        let attributedPlaceholder = NSAttributedString(string: "신조어를 검색해주세요!", attributes: attributes)

        newWordTextField.attributedPlaceholder = attributedPlaceholder

        newWordTextField.layer.cornerRadius = 0
        newWordTextField.layer.borderColor = UIColor.black.cgColor
        newWordTextField.layer.borderWidth = 3
    }
    
    // 신조어 버튼 디자인
    func newWordListDesign() {
        for box in 0...newWorldButtonList.count - 1 {
            newWorldButtonList[box].layer.cornerRadius = 5
            newWorldButtonList[box].layer.borderWidth = 2
            newWorldButtonList[box].layer.borderColor = UIColor.black.cgColor
        }
    }
    
    // 신조어 제안 버튼, 신조어 할당
    func newWordListWordSet() {
        for word in 0...3 {
            newWorldButtonList[word].setTitle(words[word], for: .normal)
        }
    }
    
    // 신조어 설명 함수
    func newWordMean(newWord: String) -> String {
        var Mean: String?
        
        switch newWord {
        case "번달번줌":
            Mean = "번호달라고 하면 번호줌?"
        case "만반잘부":
            Mean = "만나서 반가워 잘 부탁해!"
        case "별다줄":
            Mean = "별걸 다 줄이네~"
        case "알잘딱깔센":
            Mean = "알아서 잘 딱 깔끔하게 센스있게"
        case "억까":
            Mean = "억지로 까기"
        default:
            Mean = "올바르지 않은 신조어입니다."
        }
        return Mean!
    }
    
    // 키보드 내리기
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

