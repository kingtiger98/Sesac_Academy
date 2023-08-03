//
//  LottoViewController.swift
//  OneLineDiary
//
//  Created by 황재하 on 8/3/23.
//

import UIKit

class LottoViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {


    @IBOutlet weak var numberTextField: UITextField!
    
    let pickerView = UIPickerView()
    
    var list: [Int] = Array(1...100).reversed() //Array(repeating: "A", count: 10)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        numberTextField.inputView = pickerView
        numberTextField.tintColor = .clear
        
        pickerView.delegate = self
        pickerView.dataSource = self
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return list.count
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("select \(row)")
        
        numberTextField.text = "\(list[row])"
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(list[row])"
    }
    
    
}
