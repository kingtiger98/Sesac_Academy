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
        
        // MovieViewController에서 전달받은 값 ActorViewController에 셋팅해주는 함수 호출 해야대! ****
        mainView.setData()
        
    }

}
