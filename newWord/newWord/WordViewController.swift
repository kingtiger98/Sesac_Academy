//
//  ViewController.swift
//  newWord
//
//  Created by 황재하 on 7/20/23.
//

import UIKit

let words = ["번달번줌", "만반잘부", "별다줄", "알잘딱깔센", "억까"]

let wordDictionary: [String: String] = ["번달번줌": "번호달라고 하면 번호 줌?",
                                         "만반잘부": "만나서 반가워 잘 부탁해",
                                         "별다줄": "별걸 다 줄이네",
                                         "알잘딱깔센": "알아서 잘 딱 깔끔하게 센스있게",
                                         "억까": "억지로 까기"]


class WordViewController: UIViewController {

    
    @IBOutlet weak var newWordTextField: UITextField!
    @IBOutlet var newWorldButtonList: [UIButton]!
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        newWordTextFieldDesign()
        newWordListDesign()
        newWordListWordSet()

                
    }

    // 돋보기 버튼
    @IBAction func newWordSearchButton(_ sender: UIButton) {
        
        guard let textCount = newWordTextField.text?.count else { return }
        
        if textCount <= 1 {
            wordAlert()
        } else {
            resultLabel.text = newWordMean(newWord: userInputText())
        }
    }
    
    
    // 텍스트필드 엔터 버튼
    @IBAction func textFieldEnterButton(_ sender: Any) {
        guard let textCount = newWordTextField.text?.count else { return }
        
        if textCount <= 1 {
            wordAlert()
        } else {
            resultLabel.text = newWordMean(newWord: userInputText())
        }    }
    
    // 추천 신조어 버튼
    @IBAction func newWordButtonTapped(_ sender: UIButton) {
        guard let tappedButtonTitle = sender.titleLabel?.text else { return }
        newWordTextField.text = tappedButtonTitle
    }
    
    // 사용자가 입력한 신조어 저장
    func userInputText() -> String {
        guard let userTyppingText = newWordTextField.text else {
            print("사용자가 입력한 신조어가 없습니다.")
            return "사용자가 입력한 신조어가 없습니다."
        }
        return userTyppingText
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
    
    // 신조어 제안 버튼, 신조어 할당 => 버튼의 tag값과 배열의 인덱스 사용해 수정
    func newWordListWordSet() {
        
        let wordShuffled: [String] = words.shuffled()

        for word in 0...newWorldButtonList.count - 1 {
            
            switch newWorldButtonList[word].tag {
            case 1:
                newWorldButtonList[word].setTitle(wordShuffled[word], for: .normal)
            case 2:
                newWorldButtonList[word].setTitle(wordShuffled[word], for: .normal)
            case 3:
                newWorldButtonList[word].setTitle(wordShuffled[word], for: .normal)
            case 4:
                newWorldButtonList[word].setTitle(wordShuffled[word], for: .normal)
            default:
                print("tag가 잘못됨")
            }
        }
        
    }
    
    // 신조어 설명 함수
    func newWordMean(newWord: String) -> String {
        
        guard let newWordMean = wordDictionary[newWord] else {
            print("사용자가 입력한 신조어가 없습니다.")
            return "사용자가 입력한 신조어가 없습니다."
        }
                
        return newWordMean
    }
    
    func wordAlert() {
        
        let alter = UIAlertController(title: "잘못된 입력입니다.", message: "한 글자 이상 입력해주세요!", preferredStyle: .alert)
        
        let okay = UIAlertAction(title: "확인", style: .default)
        
        alter.addAction(okay)
        
        present(alter, animated: true)
        
        resultLabel.text = "신조어를 검색해주세요!"
        
    }
    
    
    // 키보드 내리기
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

