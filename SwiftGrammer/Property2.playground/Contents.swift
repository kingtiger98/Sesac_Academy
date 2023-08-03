import UIKit

// 프로퍼티
// ㄴ 인스턴스 프로퍼티 (클래스/구조체를 초기화해야 프로퍼티에 접근 가능)
// ㄴ 타입 프로퍼티
// ㄴ 연산 프로퍼티


struct User {
    
    // 선언과 초기화 동시에 or 선언만 하고 인스턴스 생성시 초기화 해도 됨
    var nickname: String // 인스턴스 프로퍼티 + 저장 프로퍼티
    
    // 타입 프로퍼티(Meta Type) + 저장 프로퍼티
    // 사용하게 되는 순간 메모리에 올라감, 앱 종료까지 메모리 유지
    // 지연 저장 프로퍼티(lazy) 처럼 동작
    static var originName: String = "진짜 이름"
    
    // 연산 프로퍼티(Computed Property) + 인스턴스 프로퍼티
    // 값을 초기화하고 저장할 수 있는 공간이 없고, 다른 저장 프로퍼티의 값을 연산해서 간접적으로 값을 제공!
    var userIntroduce: String {
        get {
            return "이 사용자의 닉네임은\(nickname)이고, 진짜 이름은 \(User.originName)입니다."
        }
    }
    
}

// 인스턴스 생성
let user = User(nickname: "고래밥")
let user2 = User(nickname: "Jack")
user2.nickname
let user3 = User(nickname: "Hwang")
user3.nickname

// 인스턴스로 접근 안됨, 구조체 이름으로 접근!
// 인스턴스가 아무리 많더라도 타입프로퍼티 값은 하나
User.originName
User.originName = "이게 나야 나"
User.originName

//
let computedProperty = user3.userIntroduce
print(computedProperty)





// 연산 프로퍼티 사용해보기
struct BMI {
    
    // 저장 프로퍼티(인스턴스 프로퍼티)
    var nickname: String {
        willSet{ // nickname의 값이 변경될 예정이면 실행됨
            print("닉네임이 \(nickname)에서 \(newValue)으로 변경될 예정입니다.")
        }
        didSet{ // nickname의 값이 변경되면 실행됨
            print("닉네임이 \(oldValue)에서 \(nickname)으로 변경되었습니다.")
        }
    }
    
    // 저장 프로퍼티(인스턴스 프로퍼티)
    var weight: Double
    var height: Double
    
    // 연산 프로퍼티(인스턴스 프로퍼티) VS 함수의 반환값
    // 연산 프로퍼티도 static(타입 프로퍼티)처럼 사용할 수 있음,
    // 단 타입은 타입끼리 인스턴스튼 인스턴스 끼리 사용해야함!
    var BMIResult: String {
        get {
            let bmiValue = weight / ( height * height )
            let bmiStatus = bmiValue < 18.5 ? "저체중" : "정상 이상"
            return "\(nickname)님의 BMI지수는 \(bmiValue)로 \(bmiStatus)입니다."
        }
        set {
            nickname = newValue
        }
    }
    
}

var bmi = BMI(nickname: "고래밥", weight: 84, height: 1.8)
print(bmi.BMIResult)

bmi.BMIResult = "칙촉" // set의 newValue에 "칙촉" 들어감
print(bmi.BMIResult)




class FoodRestaurant{
    let name = "잭치킨"
     
    var totalOrderCount = 10
    
    var newOrder: Int {
        get{
           return totalOrderCount * 5000
        }
        set{
            totalOrderCount += newValue
        }
    }
}

let food = FoodRestaurant()

food.newOrder = 30
print(food.newOrder)



class TypeFoodRestaurant {
    
    static let name = "잭치킨"
    
    static var totalOrderCount = 10 {
        willSet{
            print("총 주문 건수가 \(totalOrderCount)에서 \(newValue)로 변경될 예정입니다,")
        }
        didSet {
            print("총 주문 건수가 \(oldValue)에서 \(totalOrderCount)로 변경되었습니다.")
        }
    }
    
    
    static var newOrder: Int {
        get {
            return totalOrderCount * 5000
        }
        set {
            totalOrderCount += newValue
        }
    }
    
}

TypeFoodRestaurant.newOrder
TypeFoodRestaurant.newOrder = 30
TypeFoodRestaurant.newOrder




class Coffee {
    static var name = "아메리카노"
    static var shot = 2
    
    static func plusShot() {
        shot += 1
    }
}


class Latte: Coffee {
    
    override class func plusShot() {
        
    }
    
}




// Enum의 특성 : 컴파일
// 인스턴스 생성 불가능, 초기화 불가능 => 인스턴스 프로퍼티 / 인스턴스 메서스 사용 불가능!
// 다만 타입 프로퍼티는 사용 가능함!
// static let으로 값을 저장하는 것과 case rawValue로 값을 저장하는 것의 차이는?
enum Grade {
    case A, B, C, D, E
    static let introduce = "학점"
    
    var key: String {
        switch self {
        case .A:
            return "에이다!"
        case .B:
            return "비다!"
        case .C:
            return "씨다!"
        case .D:
            return "디다!"
        case .E:
            return "이다!"
        }
    }
}

Grade.A.key


enum Resource: String {
    case save = "저장"
    case add = "추가"
    // case addButton = "추가" <= 열거형은 rawValue가 중복되면 안됨!
    
    static let addIcon = "추가"
    static let addButton = "추가"
}





