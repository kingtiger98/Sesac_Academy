//
//  TransitionViewController.swift
//  SecondWeek
//
//  Created by 황재하 on 7/24/23.
//

import UIKit
import Kingfisher

class TransitionViewController: UIViewController {

    // 100MB라면..
    // http(apple bolck) => App Transport Security Setting 옵션으로 허용해줘야 사용 가능
    // https사용하는 것 추천
    //
    var url = URL(string: "https://images.mypetlife.co.kr/content/uploads/2022/06/03103925/jc-gellidon-TPZNooS1Meg-unsplash-edited-scaled.jpg")
    
    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var petImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()


        petImageView.kf.setImage(with: url)
        
    }
    
    // 홈으로 돌아오는 버튼은 unWindToHome로 명명함
    // 다른 화면에서 TransitionViewController로 이동
    @IBAction func unWindToHome(_ sender: UIStoryboardSegue) {
        
    }


    @IBAction func segmentValueChanged(_ sender: UISegmentedControl) {
        
        if sender.selectedSegmentIndex == Pet.dog.rawValue {
            url = URL(string: "https://images.mypetlife.co.kr/content/uploads/2022/06/03103925/jc-gellidon-TPZNooS1Meg-unsplash-edited-scaled.jpg")
            petImageView.kf.setImage(with: url)

        } else if sender.selectedSegmentIndex == Pet.cat.rawValue {
            url = URL(string: "https://images.mypetlife.co.kr/content/uploads/2019/08/09153148/cmophoto-net-SFKAoY5scVU-unsplash.jpg")
            petImageView.kf.setImage(with: url)
        } else {
            
        }
        
    }
    
    
}
