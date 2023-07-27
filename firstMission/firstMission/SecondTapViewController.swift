//
//  SecondTapViewController.swift
//  firstMission
//
//  Created by 황재하 on 7/27/23.
//

import UIKit

class SecondTapViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    
    // 상수에 반복되는 내용 넣어 사용하면 상자에 덜 왔다갔다 해 더 효율적임, 보기도 좋고!
    let userdefaultss = UserDefaults.standard
    
    // 탭바 컨트롤러 : 탭 클릭 전까지 viewDidLoad는 호출되지 않음
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
 
    // 뷰가 나타날 때 마다 실행됨! 데이터 계속 업데이트 가능함
    override func viewWillAppear(_ animated: Bool) {
        let count = userdefaultss.integer(forKey: "count")
        resultLabel.text = "\(count)"
    }
    
    
    
}
