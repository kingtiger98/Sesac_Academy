//
//  LoginViewController.swift
//  firstMission
//
//  Created by 황재하 on 7/19/23.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var emailPhoneText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var nicknameText: UITextField!
    @IBOutlet weak var locationText: UITextField!
    @IBOutlet weak var recomendCodeText: UITextField!
    @IBOutlet weak var signInBtn: UIButton!
    
    @IBOutlet weak var switchBtn: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // 회원가입 버튼 함수
        signBtnDs()
        
        // 텍스트 필드 디자인 변경 함수들
        placeholderColor(color: .gray)
        textColor(color: .white)
        backgroundColor(color: .darkGray)
        textAlign(align: .center)
        textBorder()
        
        // 이메일주소 키보드타입 지정
        emailPhoneText.keyboardType = .emailAddress
        
        // 비밀번호 가리기
        passwordText.isSecureTextEntry = true
        
        // 스위치 버튼
        switchDs()
        
    }
    
    // 키보드 내리기
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    // 회원가입 버튼
    @IBAction func signInBtn(_ sender: UIButton) {
        guard let nickname = nicknameText.text else { return }
        if nickname == "" {
            failNickname()
        } else {
            successNickname(name: nickname)
        }
    }
    
    // 닉네임 설정 성공
    func successNickname(name: String) {
        let alert = UIAlertController(title: "닉네임 설정 완료" , message: "당신의 이름은 \(name)입니다.", preferredStyle: .alert)
        
        let cancle = UIAlertAction(title: "취소", style: .cancel)
        let okay = UIAlertAction(title: "확인", style: .default)
        
        alert.addAction(cancle)
        alert.addAction(okay)
        
        present(alert, animated: true)
        nicknameText.text = ""
    }
    
    // 닉네임 설정 실패
    func failNickname() {
        let alert = UIAlertController(title: "닉네임 설정 실패", message: "이름을 다시 입력하세요", preferredStyle: .alert)
        
        let cancle = UIAlertAction(title: "취소", style: .cancel)
        let okay = UIAlertAction(title: "확인", style: .default)
        
        alert.addAction(cancle)
        alert.addAction(okay)
        
        present(alert, animated: true)
        nicknameText.text = ""
    }

    // 회원가입 버튼 디자인
    func signBtnDs() {
        signInBtn.layer.cornerRadius = 5
        signInBtn.setTitle("회원가입", for: .normal)
        signInBtn.setTitleColor(UIColor.black, for: .normal)
        signInBtn.backgroundColor = UIColor.white
    }
    
    // 텍스트필드 placeholder색 변경
    func placeholderColor(color: UIColor) {
        emailPhoneText.attributedPlaceholder = NSAttributedString(string: "이메일 주소 또는 전화번호", attributes: [NSAttributedString.Key.foregroundColor : color])
        
        passwordText.attributedPlaceholder = NSAttributedString(string: "비밀번호", attributes: [NSAttributedString.Key.foregroundColor : color])
        
        nicknameText.attributedPlaceholder = NSAttributedString(string: "닉네임", attributes: [NSAttributedString.Key.foregroundColor : color])
        
        locationText.attributedPlaceholder = NSAttributedString(string: "위치", attributes: [NSAttributedString.Key.foregroundColor : color])
        
        recomendCodeText.attributedPlaceholder = NSAttributedString(string: "추천 코드 입력", attributes: [NSAttributedString.Key.foregroundColor : color])
    }
    
    // 텍스트필드 텍스트색 변경
    func textColor(color: UIColor) {
        emailPhoneText.textColor = color
        passwordText.textColor = color
        nicknameText.textColor = color
        locationText.textColor = color
        recomendCodeText.textColor = color
    }
    
    // 텍스트필드 배경색 변경
    func backgroundColor(color: UIColor) {
        emailPhoneText.backgroundColor = color
        passwordText.backgroundColor = color
        nicknameText.backgroundColor = color
        locationText.backgroundColor = color
        recomendCodeText.backgroundColor = color
    }
    
    // 텍스트필드 텍스트 정렬 방식 변경
    func textAlign(align: NSTextAlignment) {
        emailPhoneText.textAlignment = align
        passwordText.textAlignment = align
        nicknameText.textAlignment = align
        locationText.textAlignment = align
        recomendCodeText.textAlignment = align
    }
    
    // 텍스트필드 borderStyle 변경
    func textBorder() {
//        emailPhoneText.borderStyle = .none
    }

    // 스위치 버튼 디자인
    func switchDs() {
        // 스위치 꺼져있는 상태로 시작
        switchBtn.setOn(false, animated: true)
        // 켜졌을 때 배경 색
        switchBtn.onTintColor = .red
        // 꺼졌을 때 배경 색
        switchBtn.thumbTintColor = .darkGray
    }
    
}
