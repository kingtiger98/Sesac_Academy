//: [Previous](@previous)

// 프로퍼티
import Foundation
import UIKit

enum DrinkSize {
    case short, tall, geande, venti
}



// 음료 주문: 이름, 가격, 사이즈
class DrinkClass {
    let name: String
    var count: Int
    var size: DrinkSize
    
    init(name: String, count: Int, size: DrinkSize){
        self.name = name
        self.count = count
        self.size = size
    }
}

// 클래스는 상자가 따로 따로 있어서 클래스 정의시에 프로퍼티가 var 라면 인스턴스를 let으로 만들어도 클래스 내부요소의 값에 접근하여 값을 변경 할 수 있는 것입니다.
let drinkClass = DrinkClass(name: "아샷추", count: 3300, size: .venti)
//drinkClass.name = "아샷추를 몰라?"
drinkClass.count = 3300
drinkClass.size = .geande





struct DrinkStruct {
    let name: String
    var count: Int
    var size: DrinkSize
}


// 큰 dirnkStruct 상자안에 DrinkStruct라는 작은 상자가 있다고 생각하면 된다.(큰 상자 하나에 모든게 담겨 있게 된 것)
// 큰 상자인 dirnkStruct가 let이면 dirnkStruct의 모든 프로퍼티들의 값을 변경할 수 없게 된다.
// 하지만 큰 상자인 dirnkStruct를 var로 바꿔주면 작은 상자인 DrinkStruct로 접근할 수 있게 되기 떄문에 작은 상자 안의 let 으로 선언된 프로퍼티 말고는 변경할 수 있게 된다.
let dirnkStruct = DrinkStruct(name: "아아", count: 2200, size: .tall)
//dirnkStruct.name = "아아아"
//dirnkStruct.count = 3300
//dirnkStruct.size = .venti




struct Poster {
    var image: UIImage = UIImage(systemName: "star") ?? UIImage()
}

// 넷플릭스: 영화 타이틀, 러닝타임, 고화질 포스터나 영상..
struct Movie {
    
    // 고정된 값,  인스턴스를 생성하지 않아도 구조체를 통해 바로 값을 사용할 수 있음
    // 호출하는 순간 메모리에 올라가고 앱이 종료될 때 까지 유지됨
    // 타입 프로퍼티: 지연 저장 프로퍼티의 형태로 기본적으로 동작, lazy를 사용하지 않아도 됨
    // ㄴ 인스턴스 프로퍼티와 차이는 초기화를 하지 않아도 사용할 수 있음, static 유무 키워드 차이
    static let best = "이달의 최고 영화" // 저장 프로퍼티이자 타입 프로퍼티임
    
    // 저장 프로퍼티이자 인스턴스 프로퍼티임
    //                 ㄴ 초기화를 통해 사용해야하기 때문!
    let name: String
    let runtime: Int
    
    // 지연 저장 프로퍼티 lazy. 상수는 인스턴스가 생성되기 전에 값을 항상 가지고 있어야 함
    lazy var video: Poster = Poster()

}


let media = Movie(name: "사랑의 불시착", runtime: 130)

// 호출하는 순간 메모리에 올라가고 앱이 종료될 때 까지 유지됨
Movie.best


//: [Next](@next)
