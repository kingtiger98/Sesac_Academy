//
//  DetailViewController.swift
//  OneLineDiary
//
//  Created by 황재하 on 7/31/23.
//

import UIKit

class DetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setBackGroundColor()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func DeleteButtonClicked(_ sender: UIBarButtonItem) {
        
        // push : pop (nav)
        navigationController?.popViewController(animated: true)
    }
    


}
