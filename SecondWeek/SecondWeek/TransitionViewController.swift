//
//  TransitionViewController.swift
//  SecondWeek
//
//  Created by 황재하 on 7/24/23.
//

import UIKit

class TransitionViewController: UIViewController {

    
    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var userTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    // 홈으로 돌아오는 버튼은 unWindToHome로 명명함
    // 다른 화면에서 TransitionViewController로 이동
    @IBAction func unWindToHome(_ sender: UIStoryboardSegue) {
        
    }


}
