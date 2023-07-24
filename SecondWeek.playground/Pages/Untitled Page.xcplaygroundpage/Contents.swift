var nickname: String?
var age: Int?

nickname = "고래밥"

print(nickname!)


// 1. 강제 해제 연산자
if nickname!.count >= 3 {
    print("\(nickname!)입니다")
} else {
    print("세 글자 이상 작성해주세요")
}


// 2. 조건문으로 nil 판단
if nickname != nil {
    print("\(nickname!)입니다")
}


// 3. 옵셔널 바인딩
if let nickname = nickname { // nickname이 nil이 아니면 언래핑 되어 상수에 담깁니다.
    print("\(nickname)입니다")
} else {
    print("nil입니다")
}

if let value = nickname, let age = age{
    print("\(value), \(age)입니다")
} else {
    print("nil입니다")
}


func testOptionalBinding() {
    // swift5.7에서 업데이트된 if let shorthand 기능!
    if let nickname {
        print("\(nickname)")
    }
    
    // { } 바깥에서도 상수를 사용할 수 있음
    guard let name = nickname else{
        print("nil입니다.")
        return // Early Exit : 오류 상황시 함수를 종료시키기 위해 사용
    }
    print(name)
    
}



func searchWord() {
    
    let example: String? = "abc"
        
    // 1.
    if example != nil {
        
    }
    
    
    // 2.
    if let example {
        print(example.uppercased())
    }
    
    
    // 3.
    guard let example = example else {
        print("문제 발생")
        return
    }
    print(example.uppercased())
    
    print(example)
    

}


