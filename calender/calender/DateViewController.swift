//
//  DateViewController.swift
//  calender
//
//  Created by 황재하 on 7/20/23.
//

import UIKit

class DateViewController: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var background100Img: UIImageView!
    @IBOutlet weak var date100Lbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        datePickerDs()
        testViewProperty()
        
    }
    



    @IBAction func datePickerValueChanged(_ sender: UIDatePicker) {
        print(sender.date)
        
        // +100일 뒤
        let result = Calendar.current.date(byAdding: .day, value: +100, to: sender.date)

        // DateFormatter: 1. 시간대 변경, 2. 날짜 포멧 변경
        let dateFormating = DateFormatter()
        dateFormating.dateFormat = "MM월 dd일, YYYY년"
        let value =  dateFormating.string(from: result!)
        print(value)
        
        date100Lbl.text = value
        
        
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
    
    func testViewProperty() {
        
        background100Img.layer.cornerRadius = 20
        background100Img.backgroundColor = .brown
        background100Img.layer.shadowColor = UIColor.black.cgColor
        background100Img.layer.shadowOffset = .zero
        background100Img.layer.shadowRadius = 10
        background100Img.layer.shadowOpacity = 0.5
        background100Img.clipsToBounds = false
        
        // Label은 Clip to Bounds 체크해야 cornerRadius 적용됨
        date100Lbl.clipsToBounds = true
        date100Lbl.layer.cornerRadius = 20
        date100Lbl.backgroundColor = .brown
    }
    
    
}
