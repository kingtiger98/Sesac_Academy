//
//  CalculateViewController.swift
//  UnsplashProject
//
//  Created by 황재하 on 9/13/23.
//

import UIKit

class CalculateViewController: UIViewController{
    
    @IBOutlet var firstTextField: UITextField!
    @IBOutlet var secondTextField: UITextField!
    
    @IBOutlet var resultLabel: UILabel!
    @IBOutlet weak var templeLabel: UILabel!
    
    let viewModel = CalculateViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        firstTextField.addTarget(self, action: #selector(firstTextFieldChanged), for: .editingChanged)
        secondTextField.addTarget(self, action: #selector(secondTextFieldChanged), for: .editingChanged)
        
        // viewModel의 데이터를 뷰에 전달
        viewModel.firstNumber.bind { number in
            self.firstTextField.text = number
        }
        
        viewModel.secondNumber.bind { number in
            self.secondTextField.text = number
        }
        
        viewModel.resultText.bind { text in
            self.resultLabel.text = text

        }
        
        viewModel.tempText.bind { text in
            self.templeLabel.text = text
        }
        
    }
    
    // 사용자가 입력한 데이터를 viewModel에 전달
    @objc func firstTextFieldChanged(){
        viewModel.firstNumber.value = firstTextField.text
        viewModel.calculate()
        viewModel.presentNemberFormat()
    }
    
    // 사용자가 입력한 데이터를 viewModel에 전달
    @objc func secondTextFieldChanged(){
        viewModel.secondNumber.value = secondTextField.text
        viewModel.calculate()
    }
     
}

//let person = CustomOvservable("새싹이")
//
//person.value = "재하야"
//person.value = "패지포마"
//
//// 1_2. 이게 주석되면 어떻게 실행될까?
//person.bind { value in
//    self.resultLabel.text = value
//    self.view.backgroundColor = [UIColor.orange, UIColor.darkGray, UIColor.magenta].randomElement()
//}
//
//// 2_2. 이게 주석되면 어떻게 실행될까?
//DispatchQueue.main.asyncAfter(deadline: .now() + 1 ){
//    person.value = "바나나"
//    print("======1초뒤======")
//}
//
//DispatchQueue.main.asyncAfter(deadline: .now() + 2 ){
//    person.value = "키위"
//    print("======1초뒤======")
//}
//
//firstTextField.text = "\(viewModel.firstNumber.value)"
//secondTextField.text = "\(viewModel.secondNumber.value)"
