//
//  PapagoViewController.swift
//  SeSAC3Week4
//
//  Created by 황재하 on 8/10/23.
//

import UIKit
import Alamofire
import SwiftyJSON
import Kingfisher

class PapagoViewController: UIViewController {

    
    @IBOutlet var requestButton: UIButton!
    @IBOutlet var originalTextView: UITextView!
    @IBOutlet var translateTextView: UITextView!
    
    
    //let helper = UserDefaultsHelper()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // ****
        originalTextView.text = UserDefaultsHelper.standard.nickname // 아래줄과 똑같은 기능
        // originalTextView.text = helper.nickname // 아래줄과 똑같은 기능
        originalTextView.text = UserDefaults.standard.string(forKey: "nickname")

        
        UserDefaultsHelper.standard.nickname = "칙촉" // 아래줄과 똑같은 기능
        // helper.nickname = "칙촉" // 아래줄과 똑같은 기능
        UserDefaults.standard.set("고래밥", forKey: "nickname")
        
        UserDefaults.standard.integer(forKey: "age")
        // ****
        
        
        
        originalTextView.text = ""
        translateTextView.text = ""
        
        originalTextView.backgroundColor = .lightGray
        translateTextView.backgroundColor = .lightGray
        
        translateTextView.isEditable = false
        
        requestButton.setTitle("번역하기", for: .normal)
        requestButton.backgroundColor = .yellow
        requestButton.tintColor = .black
    }
    
    // SwiftyJSON, Alamofire
    @IBAction func requsetButtonClicked(_ sender: UIButton){
        
        PapagoAPIManager.shared.callRequest(text: originalTextView.text ?? "") { result in
            self.translateTextView.text = result
        }

        
    }
    
    


}
