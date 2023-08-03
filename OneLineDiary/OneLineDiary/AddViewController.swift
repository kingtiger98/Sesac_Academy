//
//  ViewController.swift
//  OneLineDiary
//
//  Created by 황재하 on 7/31/23.
//

import UIKit


enum TransitionType: String {
    case add = "추가 화면"
    case edit = "수정 화면"
}



// 1. UITextViewDelegate
// 2. contentsTextView.delegate = self
// 3. 필요한 메서드 호출해서 구현

class AddViewController: UIViewController, UITextViewDelegate {
    
    @IBOutlet weak var contentsTextView: UITextView!
    
    var contentsText: String = ""
    
    var type: TransitionType = .add

    //placerholer
    let placeholderText = "내용을 입력해주세요"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 연결
        contentsTextView.delegate = self
        

        setBackGroundColor()
        contentsTextView.text = contentsText
        title = type.rawValue


        switch type {
        case .add:
            // 코드로 모달창 닫기 버튼 추가
            navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .plain, target: self, action: #selector(closeButtonClicked))
            navigationItem.leftBarButtonItem?.tintColor = .white // 순서 주의 : 버튼아이템 만들고 색상 지정해줘야 저장됨!

            contentsTextView.text = placeholderText
            contentsTextView.textColor = .darkGray
            
        case .edit:
            print("")
        }
    
    }

    
    func textViewDidChange(_ textView: UITextView) {
        print(textView.text.count)
        title = "\(textView.text.count) 글자 수"
    }
    
    // 편집이 시작될 때, 커서가 시작될 때
    // 플레이스 홀더와 텍스트뷰 글자가 같다면 clear, color
    func textViewDidBeginEditing(_ textView: UITextView) {
        print(#function)
        if textView.text == placeholderText {
            textView.text = nil
            textView.textColor = .black
        }
        
    }
    
    // 편집이 끝날 때(커서가 없어지는 순간)
    func textViewDidEndEditing(_ textView: UITextView) {
        print(#function)
        if textView.text.isEmpty {
            textView.text = placeholderText
            textView.textColor = .lightGray
        }
    }
    
    
    // 코드로 모달창 닫기 버튼 추가
    @objc func closeButtonClicked(){
        
        // Present : Dismiss
        dismiss(animated: true)
        
    }
    
    
    
    
    

}

