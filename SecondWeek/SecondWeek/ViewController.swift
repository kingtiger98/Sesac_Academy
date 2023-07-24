//
//  ViewController.swift
//  SecondWeek
//
//  Created by 황재하 on 7/24/23.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var firstImageView: UIImageView!
    @IBOutlet weak var secondImageView: UIImageView!
    @IBOutlet weak var thirdImageView: UIImageView!
    
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var thirdLabel: UILabel!
    
    @IBOutlet weak var firstButton: UIButton!
    @IBOutlet weak var secondButton: UIButton!
    @IBOutlet weak var thirdButton: UIButton!
    
    let list = ["가사1", "가사2", "가사3"]

    override func viewDidLoad() {
        super.viewDidLoad()

        firstImageView.isUserInteractionEnabled = true
        
        print(firstImageView.isUserInteractionEnabled)
        print(view.isUserInteractionEnabled)
        
    }

    // 버튼에 tag값을 주어 구분함
    @IBAction func playButtonClicked(_ sender: UIButton) {
        print(sender.tag)
        print(list[sender.tag - 1])
    }
    
    
    
    @IBAction func tapGesture1(_ sender: UIGestureRecognizer) {
        print("first")
    }
    
    //
    @IBAction func tapGesture2(_ sender: UIGestureRecognizer) {
        print("second")
        
        // 1. 다시 앨범을 못 봄..
        // firstImageView.isHidden = true
        
        print("제스쳐 전", firstImageView.isHidden)
        
        // 2. 조건문으로 대응
//        if firstImageView.isHidden == true {
//            firstImageView.isHidden = false
//        } else {
//            firstImageView.isHidden = true
//        }
        
        // 3. NOT 연산사 사용
//        firstImageView.isHidden = !firstImageView.isHidden
        
        // 4. 토클 버튼 사용
//        firstImageView.isHidden.toggle()

        // 5. @@@ ? ㅇㅇ : ㄴㄴ 삼항조건연산자
        firstImageView.isHidden = firstImageView.isHidden == true ? false : true
        
        
        
        
        print("제스쳐 후", firstImageView.isHidden)
        
    }
    
    
    
    
    
    
    
}

