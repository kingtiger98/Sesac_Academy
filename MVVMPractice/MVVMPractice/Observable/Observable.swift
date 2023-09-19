//
//  Observable.swift
//  MVVMPractice
//
//  Created by 황재하 on 9/18/23.
//

import Foundation


class Observable<T>{
    
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
