//
//  Observable.swift
//  LottoMVVM
//
//  Created by 황재하 on 9/13/23.
//

import Foundation

class Observable<T> {
    
    // 1. 매개변수 T를 받아 Void를 반환하는 클로저를 저장할 변수 생성
    private var listener: ((T) -> Void)?
   
    // 2. value의 변경사항을 감지하면 listener?(value)가 실행되도록 옵저버 등록
    var value: T{
        didSet{
            listener?(value)
        }
    }
    
    // 0. 생성자 생성
    init(_ value: T) {
        self.value = value
    }

    // 3. 클로저를 인자로 받는 bind 함수,
    func bind(_ closure: @escaping (T) -> Void ) {
        
        print(#function)
        // 주어진 closure호출해 value값 전달, value를 매개변수로 갖는 클로저
        closure(value)
        // listener변수에 클로저 할당해 value가 변경될 때마다 클로저가 호출되도록
        listener = closure
        
    }
    
    
    
    
}

