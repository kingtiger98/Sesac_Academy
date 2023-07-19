//
//  BoardViewController.swift
//  firstMission
//
//  Created by 황재하 on 7/19/23.
//

import UIKit

class boardViewController: UIViewController {
    
    
    @IBOutlet weak var topTfd: UITextField!
    @IBOutlet weak var bottomLbl: UILabel!
    
    // label 세 개 한 번에 연결
    @IBOutlet var testLabel: [UILabel]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        for item in testLabel {
            item.textColor = .red
            item.font = .boldSystemFont(ofSize: 15)
        }
        
        textDs()
        lblDs()
        
    }
    
    @IBAction func tapGestureTapped(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    @IBAction func resultBtn(_ sender: UIButton) {
        bottomLbl.text = topTfd.text
        topTfd.text = ""
    }
    
    func textDs(){
        topTfd.placeholder = "내용을 입력해주세요"
        topTfd.textColor = .blue
        topTfd.keyboardType = .emailAddress
        topTfd.borderStyle = .line
    }
    
    func lblDs(){
        bottomLbl.textAlignment = .center
        bottomLbl.text = "안녕하세요"
        bottomLbl.font = .boldSystemFont(ofSize: 20)
        bottomLbl.textColor = .blue
        bottomLbl.numberOfLines = 0
    }
    
    
    
}
