//
//  DetailViewController.swift
//  BOOKWARM
//
//  Created by 황재하 on 7/31/23.
//

import UIKit

class DetailViewController: UIViewController {
    
    static let identifier = "DetailViewController"
    
    var nameContents: String = ""
    var dateContents: String = ""
    var overviewContents: String = ""
    
    var timeContents: Int = 0
    var rateContents: Double = 0.0
    
    @IBOutlet weak var mvImageView: UIImageView!
    @IBOutlet weak var mvName: UILabel!
    @IBOutlet weak var mvOpenDateLabel: UILabel!
    @IBOutlet weak var mvRateLabel: UILabel!
    @IBOutlet weak var mvRunningTimeLabel: UILabel!
    @IBOutlet weak var mvOverview: UITextView!

    var disMissButtonHiddenBool: Bool = false
    @IBOutlet weak var disMissButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureSetValue()
        
        disMissButton.tintColor = .black
        disMissButton.setTitle("나가기", for: .normal)
        disMissButton.isHidden = disMissButtonHiddenBool
    }
    
    // present시 상세화면 나가기 버튼
    @IBAction func disMissButtonClicked(_ sender: UIButton) {
        dismiss(animated: true)
        
    }
    
    
    
    
    
    // 빈 방에 값 전달 함수
    func configureDetail(row: Movie) {
        nameContents = row.title
        dateContents = row.releaseDate
        overviewContents = row.overview
        timeContents = row.runtime
        rateContents = row.rate
    }
    
    // 전달 받은 값 아웃렛에 할당
    func configureSetValue() {
        mvImageView.image = UIImage(named: nameContents)
        mvName.text = nameContents
        mvOpenDateLabel.text = "개봉    " + dateContents
        mvRateLabel.text = "평점    " + "\(rateContents)"
        mvRunningTimeLabel.text = "\(timeContents)분"
        mvOverview.text = overviewContents
    }
    

}
