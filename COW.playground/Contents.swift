import UIKit

// COW : Copy On Write

func address(of object: UnsafeRawPointer) -> String {
    let address = Int(bitPattern: object)
    return String(format: "%p", address)
}

// String 자료형은 nickname의 값에 변경이 없어도 메모리 공간을 계속 새로 만듦
var nickname = "SeSAC"
address(of: &nickname)

var newNickname = nickname
address(of: &newNickname)

var newNickname2 = nickname
address(of: &newNickname2)

var newNickname3 = nickname
address(of: &newNickname3)


// Collection Type : Array, Dictionary, Set에 COW가 적용됨
// Array 같은 경우 값이 바뀌지 않는 이상 원본 메모리 공간을 공유하게 됨
// 같은 공간을 세 변수가 나누어 사용하고 있는 것 : 최적화 관리 하는 중! : COW
var array = Array(repeating: "Hwang", count: 100)
address(of: array)

var newArray = array
address(of: newArray)

var newArray2 = array
address(of: newArray2)

// 배열에 일부 값에 변화가 생김 => 메모리 주소 값에 변화가 생김!
newArray[0] = "Hello"
address(of: newArray)

