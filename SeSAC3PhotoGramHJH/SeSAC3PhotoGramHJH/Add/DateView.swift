//
//  DateView.swift
//  SeSAC3PhotoGramHJH
//
//  Created by 황재하 on 8/29/23.
//

import UIKit

class DateView: BaseView{
    
    let picker = {
        let view = UIDatePicker()
        view.datePickerMode = .date
        view.preferredDatePickerStyle = .wheels
        return view
    }()
    
    override func configureView() {
        super.configureView()
        addSubview(picker)
    }
    
    override func setConstraints() {
        super.setConstraints()
        picker.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(self.safeAreaLayoutGuide)
        }
    }
    
}
