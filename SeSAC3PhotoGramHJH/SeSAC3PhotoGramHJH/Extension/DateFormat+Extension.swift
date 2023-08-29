//
//  DateFormat+Extension.swift
//  SeSAC3PhotoGramHJH
//
//  Created by 황재하 on 8/29/23.
//

import UIKit

extension DateFormatter{
    
    static let format = {
        let format = DateFormatter()
        format.dateFormat = "yy년 MM월 dd일"
        return format
    }()
    
    static func today() -> String {
        return format.string(from: Date())
    }
    
    static func convertData(date: Date) -> String {
        return format.string(from: date)
    }
    
    
    
}
