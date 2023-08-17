//
//  AsyncViewController.swift
//  SeSAC3Week4
//
//  Created by 황재하 on 8/11/23.
//

import UIKit

class AsyncViewController: UIViewController {
    
    @IBOutlet weak var first: UIImageView!
    @IBOutlet weak var second: UIImageView!
    @IBOutlet weak var third: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        first.backgroundColor = .black
        print("1")
        
        DispatchQueue.main.async {
            self.first.layer.cornerRadius = self.first.frame.width / 2
            print("2")

        }
        
        print("3")

        
    }
    
    // 동기 비동기 드간다..
    // sync(동기) : Queue에 들어간 작업이 끝날 때 까지 기다렸다가 다음 작업 할까?
    // async(비동기) : 작업 Queue에 보내놓고 바로 다음 작업을 할까?
    // serial(main) : 큐는 작업분배 하기 귀찮은데 대기열에 있는 작업을 한 쓰레드로 몰아버릴까
    // concurrent(global) : 그래도 큐가 대기열에 있는 작업을 여러 쓰레드에 골고루 분배해줘야지!
    
    // UI Freezing 막아야해 ~
    
    // GCD : Grand Central Dispatch ***
    // ㄴ DispatchQueue
    // ㄴ sync, async
    // ㄴ main(serial), global(concurrent)
    
    @IBAction func buttonClicked(_ sender: UIButton) {
        
        let url = URL(string: "https://api.nasa.gov/assets/img/general/apod.jpg")!
        
        // 작업 단위가 크면(Network 작업들) global에 모두 담음
        DispatchQueue.global().async {
            let data = try! Data(contentsOf: url)
            
            // 작업 중 UI관련 업데이트는 모두 main에 담음
            DispatchQueue.main.async {
                self.first.image = UIImage(data: data)
            }
            
            
        }
        
        
    }
    
    
    
    
    
}
