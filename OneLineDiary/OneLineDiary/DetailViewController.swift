//
//  DetailViewController.swift
//  OneLineDiary
//
//  Created by 황재하 on 7/31/23.
//

import UIKit

class DetailViewController: UIViewController {

    // Pass Data 1. 데이터를 받을 공간(프로퍼티) 생성
    var contents: String = "빈 공간"
    
    
    @IBOutlet weak var contentsLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setBackGroundColor()
        
        // Pass Data 3. 전달 받은 값을 뷰에 표현
        print(contents)
        contentsLabel.text = contents
        
    }
    
    @IBAction func DeleteButtonClicked(_ sender: UIBarButtonItem) {
        
        // push : pop (nav)
        navigationController?.popViewController(animated: true)
    }
    


}
