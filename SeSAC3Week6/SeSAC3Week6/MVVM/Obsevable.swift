//
//  Obsevable.swift
//  SeSAC3Week6
//
//  Created by 황재하 on 9/13/23.
//

import Foundation

class Obsevable<T>{
    
    private var listener: ((T) -> Void)?
    
    var value: T{
        didSet{
            listener?(value)
        }
    }
    
    init(_ value: T) {
        self.value = value
    }
    
    func bind(_ closure: @escaping (T) -> Void){
        closure(value)
        listener = closure
    }
    
    
    
    
    
}




//class Observable<T> {
//
//    private var listener: ((T) -> Void)?
//
//    var value: T{
//        didSet{
//            listener?(value)
//        }
//    }
//
//    init(_ value: T) {
//        self.value = value
//    }
//
//
//    func bind(_ closure: @escaping (T) -> Void){
//        print(#function)
//        // 주어진 closure호출해 value값 전달
//        closure(value)
//        // listener변수에 클로저 할당해 value가 변경될 때마다 클로저가 호출되도록
//        listener = closure
//    }
//
//}
