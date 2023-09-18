//
//  Netflix2ViewModel.swift
//  SeSAC3Week6
//
//  Created by 황재하 on 9/13/23.
//

import Foundation

class Netflix2ViewModel{
    
    var id = Obsevable("")
    var pw = Obsevable("")
    var nickname = Obsevable("")
    var location = Obsevable("")
    var code = Obsevable("")
    
    var isValid = Obsevable(false)
    
    var errormsg = Obsevable(" 회원가입 정보를 입력해주세요")
    
    
    func checkValid(){
        if id.value.contains("@") && (pw.value.count >= 6 && pw.value.count <= 10)
            && nickname.value.count > 1 && location.value.count > 3 && isSixDigitNumber(code.value){
            isValid.value = true
        } else {
            isValid.value = false
        }
    }
    
    
    
    func isSixDigitNumber(_ text: String) -> Bool {
        // 문자열의 길이가 6이고, 숫자로만 구성되어 있는지 확인
        if text.count == 6 && text.rangeOfCharacter(from: CharacterSet.decimalDigits.inverted) == nil {
            return true
        }
        return false
    }
    
    
    func idError(){
                
        if !id.value.contains("@"){
            errormsg.value = " 이메일 주소에 @가 포함되지 않았어요!"
        } else {
            errormsg.value = " 이메일이 정상적으로 입력되었습니다!"
        }
        
    }
    
    func pwError(){
        if pw.value.count >= 6 && pw.value.count <= 10 {
            errormsg.value = " 비밀번호가 정상적으로 입력되었습니다!"
        } else {
            errormsg.value = " 비밀번호는 6자리 이상 10자리 이하여야 합니다!"
        }
    }
    
    func nicknameError(){
        if nickname.value.count >= 1 {
            errormsg.value = " 닉네임이 정상적으로 입력되었습니다!"
        } else {
            errormsg.value = "닉네임은 1글자 이상이어야 합니다!"
        }
    }
    
    func locationError(){
        if location.value.count >= 3 {
            errormsg.value = " 위치가 정상적으로 입력되었습니다!"
        } else {
            errormsg.value = "위치는 3글자 이상이어야 합니다!"
        }
    }
    
    func codeError(){
        if isSixDigitNumber(code.value) {
            errormsg.value = " 추천코드가 정상적으로 입력되었습니다!"
        } else {
            errormsg.value = "추천코드는 숫자 6자리이어야 합니다!"
        }
    }
    
    

    

    

    
    
    
    func signIn(_ completionHandler: @escaping () -> Void ){
        
        UserDefaults.standard.set(id.value, forKey: "userID")
        UserDefaults.standard.set(pw.value, forKey: "userPW")

        print("UserDefaults 저장됨")
        completionHandler()
        
    }
    
    

}
