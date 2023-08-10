//
//  CustomTableViewCell.swift
//  SeSACWeek3
//
//  Created by 황재하 on 7/28/23.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var backView: UIView!
    
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var subLabel: UILabel!
    
    @IBOutlet weak var checkImageView: UIImageView!
    @IBOutlet weak var likeButton: UIButton!

    // 리로드데이터시 실행되지 않음 한 번만 실행됨!
    // 굳이 복잡한 작업들 _ 한 번만 하면 충분한 작업은 여기서 하자!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        mainLabel.font = .boldSystemFont(ofSize: 20)
        mainLabel.textColor = .brown
        
    }
    
    // static func -> override class
    // class가 메서드 앞에 붙어 있으면 타입 메서드구나!
    // override 부모 클래스의 메서드를 자식 클래스가 사용하는 것
//    override class func awakeFromNib() { // 부모의 타입 메서드를 가져와 사용하면 class가 붙는 것이다
//        <#code#>
//    }
    
    
    
    // ***
    func configureCell(row: ToDo) {
        mainLabel.text = "\(row.main)"
        subLabel.text = "\(row.sub)"
        
        backView.backgroundColor = row.color
        
        if row.done == true {
            checkImageView.image = UIImage(systemName: "checkmark.square.fill")
        } else {
            checkImageView.image = UIImage(systemName: "checkmark.square")
        }

        if row.like == true {
            likeButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
        } else {
            likeButton.setImage(UIImage(systemName: "star"), for: .normal)
        }
    }
    
    
    
    
    
}
