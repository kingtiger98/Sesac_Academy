//
//  LifeCycleViewController.swift
//  SecondWeek
//
//  Created by 황재하 on 7/25/23.
//

import UIKit

class LifeCycleViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("LifeCycleViewController", #function)

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("LifeCycleViewController", #function)

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("LifeCycleViewController", #function)

    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("LifeCycleViewController", #function)

    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("LifeCycleViewController", #function)

    }

}
