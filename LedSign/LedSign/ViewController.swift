//
//  ViewController.swift
//  LedSign
//
//  Created by 황재하 on 7/24/23.
//

import UIKit

var textColor: UIColor?

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var toggleButton: UISwitch!
    
    @IBOutlet var buttons: [UIButton]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttonDesign()
    }

    
    @IBAction func gestureTapped(_ sender: UITapGestureRecognizer) {
    
        view.endEditing(true)
        
    }
    
    
    @IBAction func textFieldReturnKey(_ sender: UITextField) {
        textField.text = resultLabel.text
        textField.text = ""
    }
    
    
    
    @IBAction func sendingButton(_ sender: UIButton) {
        resultLabel.text = textField.text
        textField.text = ""
    }
    
    
    
    @IBAction func colorChangeButton(_ sender: UIButton) {
        textColor = getRandomColor()
        
        resultLabel.textColor = textColor
        toggleButton.onTintColor = textColor
        buttons[1].tintColor = textColor
        
    }
    
    
    @IBAction func sendToggle(_ sender: UISwitch) {
        
        
        if toggleButton.isOn == true {
            textField.isHidden = false
            
            for num in 0...buttons.count - 1 {
                buttons[num].isHidden = false
            }
            
            toggleButton.thumbTintColor = .white
            toggleButton.layer.opacity = 1

        } else if toggleButton.isOn == false {
            textField.isHidden = true
            
            for num in 0...buttons.count - 1 {
                buttons[num].isHidden = true
            }
            
            toggleButton.thumbTintColor = .darkGray
            toggleButton.layer.opacity = 0.1
            
        }
    }
    
    
    
    // UIColor색상 랜덤 추출 함수
    func getRandomColor() -> UIColor{
        let randomRed: CGFloat = CGFloat(drand48())
        let randomGreen: CGFloat = CGFloat(drand48())
        let randomBlue: CGFloat = CGFloat(drand48())
        
        return UIColor(red: randomRed, green: randomGreen, blue: randomBlue, alpha: 1.0)
        }
    
    
    func textFieldDesign() {
        textField.layer.cornerRadius = 10
        
    }
    

    func buttonDesign() {
        for button in 0...buttons.count - 1 {
            buttons[button].layer.cornerRadius = 5
            buttons[button].layer.borderWidth = 2
            buttons[button].layer.borderColor = UIColor.black.cgColor
        }
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }

}

