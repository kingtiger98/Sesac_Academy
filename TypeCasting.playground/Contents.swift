import UIKit


class Mobile {
    let name: String
    
    init(name: String){
        self.name = name
    }
}


class Google {
    
}

class Apple: Mobile {
    let conference = "WWDC"
}

// 인스턴스 생성시 타입를 명시하면
let iphone: Mobile = Apple(name: "iPhone14 Pro Max")

// Apple클래스로 인스턴스를 생성했지만 Mobile의 프로퍼티들에만 접근이 가능함
iphone.name
//iphone.conference // 접근이 불가능

// 해결방안이 다운캐스팅임 : as!, as?
if let a = iphone as? Apple {
    print(a.conference) // 이젠 Apple 클래스의 프로퍼티에도 접근가능해짐!
} else {
    print("다운캐스팅 실패")
}



// Any: 모든 타입에 대한 인스턴스를 담을 수 있음 VS AnyObject: 클래스의 인스턴스만 담을 수 있음
// 컴파일 시점에서는 어떤 타입인지 확인할 수 없고, 런타임 시점에 타입이 결정
var something: [Any] = ["a", "b", "c", true]

something.append(0)
something.append(false)
something.append("b")
something.append(iphone)

print(something)

let element = something[4]

if let value = element as? Int {
    print(value)
} else {
    print("Int 아님")
}

if let value = element as? String {
    print(value)
} else {
    print("String 아님")
}
