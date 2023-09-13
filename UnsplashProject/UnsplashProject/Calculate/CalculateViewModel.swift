//
//  CalculateViewModel.swift
//  UnsplashProject
//
//  Created by 황재하 on 9/13/23.
//

import Foundation

 
class CalculateViewModel{
    
    // : CustomOvservable<String?> / 옵셔널값도 받을 수 있도록 함
    var firstNumber: CustomOvservable<String?> = CustomOvservable("10")
    
    var secondNumber: CustomOvservable<String?> = CustomOvservable("20")
    
    var resultText = CustomOvservable("결과는 30입니다.")
    
    var tempText = CustomOvservable("테스트를 위한 텍스트임!")
    
    func format(for number: Int) -> String {
        let numberFormat = NumberFormatter()
        numberFormat.numberStyle = .decimal
        return numberFormat.string(for: number)!
    }
    
    func presentNemberFormat() {
        
        guard let first = firstNumber.value, let firstNemberConvert = Int(first) else {
            resultText.value = "첫 번째 값이 숫자로 변환할 수 없는 문자입니다."
            return
        }
        
        tempText.value = format(for: firstNemberConvert)
    }
    
    func calculate() {
        
        guard let first = firstNumber.value, let firstNemberConvert = Int(first) else {
            resultText.value = "첫 번째 값 오류 발생"
            return
        }
        guard let second = secondNumber.value, let secondNemberConvert = Int(second) else {
            resultText.value = "두 번째 값 오류 발생"
            return
        }
        
        resultText.value = "결과는 \(firstNemberConvert + secondNemberConvert)입니다."
        
    }
    
}
