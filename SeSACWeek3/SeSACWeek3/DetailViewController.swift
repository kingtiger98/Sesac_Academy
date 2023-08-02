//
//  DetailViewController.swift
//  SeSACWeek3
//
//  Created by 황재하 on 8/2/23.
//

import UIKit



class DetailViewController: UIViewController {
    
    // 1.
    var data: ToDo?

    override func viewDidLoad() {
        super.viewDidLoad()

        guard let data else { return }
        
        print(data)
        
        
    }
    
    
 
    
    

}
