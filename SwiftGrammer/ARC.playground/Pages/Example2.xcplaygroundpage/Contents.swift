//: [Previous](@previous)

import Foundation


class Guide {
    
    var name: String // 길드 이름
    
    // weak 인스턴스를 참조해도 레퍼런스 카운트(RC)가 증가하지 않음
    // 꼭 var로 사용하고 옵셔널로 사용!
    unowned var owner: User?
    
    init(name: String){
        self.name = name
        print("Guide Init")
    }
    
    deinit {
        print("Guide deinit")
    }
    
}


class User {
    
    var nickname: String
    var guild: Guide?
    
    init(nickname: String) {
        self.nickname = nickname
        print("User Init")
    }
    
    deinit {
        print("User deinit")
    }
    
}

// MRC : 메모리 레퍼런스 카운트를 직접 관리함
// ARC : 컴파일 시점에 결정됨
var nickname: User? = User(nickname: "불주먹황재하") // RC: +1
var guild: Guide? = Guide(name: "SeSAC") // RC: +1

nickname?.guild = guild // RC: +1
guild?.owner = nickname // RC: +1

// weak로 개선하면 아래 같은 귀찮은 코드는 쓰지 않아두 돼
// nickname?.guild = nil
// guild?.owner = nil

nickname = nil // RC: -1
// guild = nil // RC: -1

// RC가 0가 되는 시점에 deinit{} 가 실행된다!

guild?.owner


//: [Next](@next)
