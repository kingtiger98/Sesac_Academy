//
//  ActorViewController.swift
//  TMDBCodeBase
//
//  Created by 황재하 on 8/28/23.
//

import UIKit

class ActorViewController: BaseViewController {

    lazy var mainView = ActorView()

    override func loadView() {
        self.view = mainView
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.setData()
        
    }

}
