import UIKit

struct Hwang {
    let age: Int = 26
}

// JaeHa에는 Hwang이라는 타입이 명시되어 있음
let JaeHa: Hwang = Hwang() // Hwang 타입의 인스턴스 생성함

// 함수 Age의 user매개변수에는, Hwang 타입의 전달인자가 들어가야함
func Age(user: Hwang) {
    print(user)
}

// Hwang타입의 인스턴스인 JaeHa 전달
Age(user: JaeHa)


let HwangType: Hwang.Type = Hwang.self


protocol Gemho { }

let dong: Gemho.Protocol = Gemho.self
