//
//  OvservableHwang.swift
//  UnsplashProject
//
//  Created by 황재하 on 9/13/23.
//

import Foundation

class CustomOvservable<T>{
    
    var listener: ((T)->Void)?
    
    var value: T{
        didSet{
            listener?(value)
            print("사용자의 이름이 \(value)으로 변경되었습니다.")
        }
    }
    
    init(_ value: T) {
        self.value = value
    }
    
    func bind(_ sample: @escaping (T) -> Void) {
        print("저는 \(value)입니다.")
        sample(value) // 1_1. 이게 주석되면 어떻게 실행될까?
        listener = sample // 2_1. 이게 주석되면 어떻게 실행될까?
        // 모두 주석 안했을 땐 어떻게 실행될까?
    }
    
    
//    func introduce(_ number: Int, sample: @escaping () -> Void) {
//        print("저는 \(name)이고 행운의 숫자는 \(number)입니다.")
//        sample()
//        luckyNumber = number
//        listener = sample
//    }
}
