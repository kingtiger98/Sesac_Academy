//: [Previous](@previous)

import Foundation

class User{
    let nickname = "Hwang"
    
    // 초기화 시점 미룸 (nickname을 사용하기 위해서)
    lazy var introduce: () -> String = { [weak self] in
        
        // context, CaptureList
        // self를 붙이면 User가 nil이 되도 nickname값을 캡쳐해서 사용할 수 있고, RC가 + 1이 됨
        return "안녕하세요 \(self?.nickname) \(Int.random(in: 1...100))입니다." // Rc + 1
    }
    
    init() {
        print("User Init")
    }
    
    
    deinit {
        print("User Deinit")
    }
    
}

var user: User? = User()

let result = user?.introduce

print(result!())

user = nil

print(result!())

// 함수, 변수의 생명주기 (스코프)


//: [Next](@next)
