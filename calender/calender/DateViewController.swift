//
//  DateViewController.swift
//  calender
//
//  Created by 황재하 on 7/20/23.
//

import UIKit

class DateViewController: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet weak var date100Lbl: UILabel!
    @IBOutlet weak var date200Lbl: UILabel!
    @IBOutlet weak var date300Lbl: UILabel!
    @IBOutlet weak var date400Lbl: UILabel!
    
    @IBOutlet var ddayImages: [UIImageView]!
    @IBOutlet var ddayShadows: [UIView]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        datePickerDs()
        ddayImage()
    
        
    }

    // dday 계산 함수
    @IBAction func datePickerValueChanged(_ sender: UIDatePicker) {
        print(sender.date)
        
        // +N00일 뒤
        let result100 = Calendar.current.date(byAdding: .day, value: +100, to: sender.date)
        let result200 = Calendar.current.date(byAdding: .day, value: +200, to: sender.date)
        let result300 = Calendar.current.date(byAdding: .day, value: +300, to: sender.date)
        let result400 = Calendar.current.date(byAdding: .day, value: +400, to: sender.date)

        // DateFormatter: 1. 시간대 변경, 2. 날짜 포멧 변경
        let dateFormating = DateFormatter()
        dateFormating.dateFormat = "YYYY년 MM월 dd일"
        
        let value100 =  dateFormating.string(from: result100!)
        let value200 =  dateFormating.string(from: result200!)
        let value300 =  dateFormating.string(from: result300!)
        let value400 =  dateFormating.string(from: result400!)
        
        
        date100Lbl.text = value100
        date200Lbl.text = value200
        date300Lbl.text = value300
        date400Lbl.text = value400
    }
    
    // 달력 함수
    func datePickerDs() {
        
        datePicker.tintColor = .brown
        
        if #available(iOS 14.0, *){
            datePicker.preferredDatePickerStyle = .inline
        } else {
            datePicker.preferredDatePickerStyle = .wheels
        }
    }
    
    // dday 이미지 함수
    func ddayImage() {
        
        for image in ddayImages {
                // 이미지 뷰 모서리 둥글게 처리
                image.layer.cornerRadius = 10
                image.clipsToBounds = true // clipsToBounds를 false로 설정

                
            }
        
        for shadow in ddayShadows {
            // 뷰에 그림자 효과 설정
            shadow.layer.shadowColor = UIColor.black.cgColor
            shadow.layer.shadowOpacity = 0.5
            shadow.layer.shadowOffset = CGSize(width: 10, height: 10)
            shadow.layer.shadowRadius = 10
        }
    }
    
    
}
