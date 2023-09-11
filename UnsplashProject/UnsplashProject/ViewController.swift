//
//  ViewController.swift
//  UnsplashProject
//
//  Created by LOUIE MAC on 2023/09/11.
//

import UIKit

class ViewController: UIViewController{

    @IBOutlet weak var nicknameTextField: UITextField!
    @IBOutlet weak var changeButton: UIButton!
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //nicknameTextField.placeholder = NSLocalizedString("nickname_placeholder", comment: "")
        nicknameTextField.placeholder = "nickname_placeholder".localized
        
        //let value = NSLocalizedString("nickname_result", comment: "")
        //resultLabel.text = String(format: value, "고래밥", "다마고치", "컹")
        resultLabel.text = "age_result".localized(number: 55)
        
        
        let bar = UISearchBar()
        bar.text = "asda"
        bar.placeholder = "asdss"
        // bar.delegate = self
        bar.showsCancelButton = false
        
    }

    
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print(#function)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print(#function)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print(#function)
    }
    

}

