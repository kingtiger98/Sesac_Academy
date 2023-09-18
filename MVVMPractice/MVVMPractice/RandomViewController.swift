//
//  ViewController.swift
//  MVVMPractice
//
//  Created by 황재하 on 9/18/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        APIService.shared.searchPhoto(query: "random") { data in
            print(data)
        }
        
    }


}

