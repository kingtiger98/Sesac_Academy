import UIKit

// Any : 모든 타입에 대해 대응 가능 (구조체, 열거형, 클래스, 클로저 등) => 런타입
// Anyobject : 모든 클래스 타입의 인스턴스만 담을 수 있음_타입의 제한 => 클래스 제약 설정 가능 : Typealias
// ex. Void도 typealias

func welcome() -> Void {
    
}

// typealias man = false

let name = "고래밥"
let age = 10
let gender = false
let birth = Date()

let arrayList: [Any] = [name, age, gender, birth]


let view = UIViewController()

let arrayList2: [AnyObject] = [view]


// 런타임 시점에 타입이 결정되기 떄문에, 런타임 오류가 발생할 수 있어 사용에 주의가 필요함!! => 타입 캐스팅
// arrayList[1] + 1


protocol Sample: AnyObject {
    func example()
}

class UserClass: Sample{
    func example() {
        <#code#>
    }
}

//struct UserStruct: Sample {
//
//}



