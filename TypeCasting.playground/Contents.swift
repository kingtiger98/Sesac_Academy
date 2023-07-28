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


let iphone: Mobile = Apple(name: "iPhone14 Pro Max")


iphone.name






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
