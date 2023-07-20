//
//  DetailViewController.swift
//  firstMission
//
//  Created by 황재하 on 7/19/23.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var newButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // 버튼에서 Configuration 활용하기
        var config = UIButton.Configuration.filled()
        config.title = "SeSAC 영등포캠퍼스"
        config.subtitle = "로그인 없이 둘러보기"
        config.image = UIImage(systemName: "star")
        config.cornerStyle = .capsule
        config.baseForegroundColor = .black
        config.baseBackgroundColor = .yellow
        config.imagePadding = 8
        config.imagePlacement = .trailing
        config.titleAlignment = .trailing
        
        newButton.configuration = config

        
        
    }
    
    // 하나의 액션함수에 2개의 버튼 연결
    // 갹채가 달라도 똑같은 기능을 구현할 때 Any 사용! // 제스쳐까지 연결 하기 위해 Any로
    // Any사용 단점 : 버튼 안의 글자의 정확한 속성을 가져오지 못함
    @IBAction func keyboardDismissBtn(_ sender: Any) {
        view.endEditing(true)
        
    }
    

    
}
