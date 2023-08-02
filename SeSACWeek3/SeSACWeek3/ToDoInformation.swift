//
//  ToDoInformation.swift
//  SeSACWeek3
//
//  Created by 황재하 on 7/28/23.
//

import UIKit

// 식판 반납틀
struct ToDoInformation {
    
    // 타입 메서드는 인스턴스 생성과 상관없이 언제든지 사용가능!
    static func randomBackgorundColor() -> UIColor {
        
        let red = CGFloat.random(in: 0...1)
        let green = CGFloat.random(in: 0...1)
        let blue = CGFloat.random(in: 0...1)
        
        return UIColor(red: red, green: green, blue: blue, alpha: 1)
    }

    // 인스턴스 프로퍼티
    var list = [ToDo(main: "잠자기", sub: "23.07.03", like: false, done: true, color: randomBackgorundColor()),
                ToDo(main: "영화보기", sub: "23.07.30", like: true, done: true, color: randomBackgorundColor()),
                ToDo(main: "장보기", sub: "23.08.13", like: false, done: false, color: randomBackgorundColor())]
    
}
