

import UIKit

// 오버로딩 : 함수의 이름은 같지만 매개변수나 리턴값이 다름
// 매개변수 X 반환값 X
//func welcome() ->  Void { // () -> ()
//    print("안녕하세요 반갑습니다.")
//}

// 매개변수 O 반환값 X
func welcome(name: String) { // (String) -> ()
    print("안녕하세요 \(name)님, 반갑습니다.")
}

// 매개변수 O 반환값 O
//func wlecome(name: String) -> String { // (String) -> (String)
//    return  "안녕하세요 \(name)님, 반갑습니다."
//}

// 매개변수 X 반환값 O
//func wlecome() -> String { // () -> (String)
//    return "안녕하세요 반갑습니다."
//}

func introduce(message: (String) -> () ) {
    
}

welcome(name: "고래밥 ") // 함수를 실행한 것
welcome

// Function Type : 함수가 가지고 있는 타입. 함수 호출 연산자 없음
/*
 변수/상수나 데이터 구조 내에 자료형을 저장할 수 있다
 함수의 반환값으로 자료형을 사용할 수 있다
 함수의 인자값으로 자료형을 전달할 수 있다
 */


func checkBankInformation(bank: String) -> Bool {
    let bankArray = ["우리", "신한", "국민"]
    return bankArray.contains(bank) ? true : false
}

// 변수나 상수에 함수를 실행해서 반환된 반환값을 대입한 것 (1급 객체의 특성은 아님)
let result = checkBankInformation(bank: "농협")



// 변수나 상수에 함수 그 "자체"를 대입할 수 있다 (1급 객체의 특성)
// 함수만 대입한 것으로, 함수가 실행된 상태는 아님

// (String) -> Bool : Function Type (ec. Tuple)
let checkAccount: (String) -> Bool = checkBankInformation // 함수 이름만 담음

// 함수를 호출하면 실행할 수 있음
checkAccount("카카오뱅크") // 매개변수명은 생략이 됨



// Tupel Example
let tupleExample: (Int, String, Double, Bool) = (1, "재하", 1.5, true)
tupleExample.3



// (String) -> String
func hello(username: String) -> String {
    return "저는 \(username)입니다"
}

func hello(nickname: String) -> String {
    return "저는 \(nickname)라는 닉네임을 갖고 있습니다."
}

// (String, Int) -> String
func hello(username: String, age: Int) -> String {
    return "저는 \(username), \(age)살 입니다."
}

// 오버로딩 특성으로 함수를 구분하기 힘들 때, 타입 어노테이션을 통해서 함수를 구별할 수 있다.
// 하지만 타입 어노테이션만으로 함수를 구별할 수 없는 상황도 있다...
// 함수 표기법을 사용한다면 타입어노테이션을 생략하더라도 함수를 구별할 수 있다!
let example = hello(nickname: )
example("재하")




// 2. 함수의 반환 타입으로 함수를 사용할 수 있다. ***

func currentAccount() -> String { // () -> String
    return "계좌 있다는 얼럿 띄우기"
}

func noCurrentAccount() -> String { // () -> String
    return "계좌 없으니 계좌 생성 화면으로 이동"
}

//func checkBank(bank: String) -> Bool {
//    let bankArray = ["우리", "신한", "국민"]
//    return bankArray.contains(bank) ? true : false
//}

// 가장 왼쪽에 위치한 -> 를 기준으로, 오른쪽에 놓인 모든 타입은 반환값을 의미한다.
func checkBank(bank: String) -> () -> String {
    let bankArray = ["우리", "신한", "국민"]
    return bankArray.contains(bank) ? currentAccount : noCurrentAccount
    // 함수를 호출하는 것은 아니고, 함수를 던져줌!
}

let jack = checkBank(bank: "신한") // 함수 자체만 대입
jack()

checkBank(bank: "신한")()







func plus(a: Int, b: Int) -> Int {
    return a + b
}

func minus(a: Int, b: Int) -> Int {
    return a - b
}

func multiply(a: Int, b: Int) -> Int {
    return a * b
}

func divide(a: Int, b: Int) -> Int {
    return a / b
}

// 리턴값이 함수
func calculate(operand: String) -> (Int, Int) -> Int {
    switch operand {
    case "+":
        return plus
    case "-":
        return minus
    case "*":
        return multiply
    case "/":
        return divide
    default:
        return plus
    }
}

calculate(operand: "+") // 함수가 실행되고 있는 상태는 아니고, 함수만 가져옴
calculate(operand: "+")(3, 4) // 이렇게 가져오고 바로 실행할 수도 있음

// 상수에 함수를 넣어서 사용할 수 있음
let resultCalculate = calculate(operand: "*")
resultCalculate(5, 9)




// 3. 함수의 인자값으로 함수를 사용할 수 있다.
func oddNumber() { // () -> (), () -> Void
    print("홀수")
}

func evenNumber() { // () -> ()
    print("짝수")
}

func setLabel() {
    
}

func setNavigationBar() {
    
}

func resultNumber(number: Int, odd: () -> Void, even: () ->Void) {
    return number.isMultiple(of: 2) ? even() : odd()
}

resultNumber(number: 8, odd: oddNumber, even: evenNumber)

// 의도하지 않은 함수가 들어갈 위험이 있고, 필요 이상의 함수가 자꾸 생성될 수 있음.
resultNumber(number: 8, odd: setLabel, even: setNavigationBar)

resultNumber(number: 8, odd: {
    print("홀수")
}, even: {
    print("짝수")
})

resultNumber(number: <#T##Int#>, odd: <#T##() -> Void#>, even: <#T##() -> Void#>)

