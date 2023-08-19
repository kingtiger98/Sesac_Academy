import UIKit
import Foundation
struct User {

    // static let shared = User()

    let name = "포카칩" // 인스턴스 프로퍼티
    static let originalName = "Hwang" // 타입 프로퍼티

}

// User.shared.name
User.originalName
User.self.originalName
// 메타 타입 그 자체는 User.Type, 메타 타입의 값은 User.self

let user = User()
user.name

// "고래밥" => String
// String =? String.Type

// User() => User
// User -> User.Type
// 메타 타입은 클래스, 구조체 열거형 등의 유형 그 자체를 가르킴

// 즉, 타입의 타입을 메타타입이라고 함***

type(of: user.name)

type(of: user).originalName


let number: Int = 8.self

let result: Int.Type = Int.self

print(result)
