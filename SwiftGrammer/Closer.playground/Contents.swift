import Foundation
// 함수는 2가지 : 이름o, 이름x
// 이름o => 메서드함수
// 이름x => 익명함수_Closer

// Function Type : () -> Void
func studyiOS() {
    print("주말에도 공부하기")
}

let study: () -> Void = {
    print("주말에도 공부하기")
}

study()

// 클로저 헤더 in 클로저 바디
let studyHarder = { () -> () in
    print("주말에도 공부하기")
}

// 매개변수에 함수를 넣어보기
func  getStudyWithMe(study: () -> () ) {
    print("주말에도 공부하기...")
    study
}

// 코드를 전혀 생략하지 않고, 클로저 구문을 사용한 상태. 함수의 매개변수 내에 클로저가 그대로 들어가 형태
// => 인라인(inline) 클로저
getStudyWithMe(study: { () -> () in
    print("주말에도 공부하기")
})

// 함수 뒤에 클로저가 실행
// => 트레일링(후행) 클로저
getStudyWithMe() { () -> () in
    print("주말에도 공부하기")
}

// (Int) -> String
func example(number: Int) -> String {
    return "\(number)"
}

example(number: Int.random(in: 1...100))

func randomNumber(result: (Int)-> String) {
    result(Int.random(in: 1...100))
}

// 코드를 전혀 생략하지 않고, 클로저 구문을 사용한 상태. 함수의 매개변수 내에 클로저가 그대로 들어가 형태
// => 인라인(inline) 클로저
randomNumber(result: { (number: Int) -> String in
    return "Lucky Number! : \(number)"
})

// 매개변수가 생략되면, 할당되어 있는 내부 상수 $0를 사용할 수 있다.
// 한 줄일 경우 return 생략 가능
randomNumber(result:{
    return "Lucky Number! : \($0)"
})

randomNumber(){
    return "Lucky Number! : \($0)"
}

randomNumber{
    return "Lucky Number! : \($0)"
}

let student = [2.2, 4.5, 3.2, 2.1, 4.4, 2.9]

var newStudent: [Double] = []

for item in student {
    if item >= 4.0 {
        newStudent.append(item)
    }
    print(newStudent)
}

let filterStudent = student.filter{ $0 >= 4.0 }

print(filterStudent)


let number = [Int](1...100)

var newNumber: [Int] = []

for number in number {
    newNumber.append(number * 3)
}

print(newNumber)

// map : 기존 요소를 클로저를 통해 원하는 결과값으로 변경
let mapNumber = number.map{ $0 * 3 }
let mapResult = number.map{ "\($0)번 입니다" }

print(mapNumber)
print(mapResult)


let movieList = [
    "괴물" : "박찬욱",
    "기생충" : "봉준호",
    "옥자" : "봉준호",
    "인셉션" : "크리스토퍼 놀란",
    "인터스텔라" : "크리스토퍼 놀란"
]

// 특정 감독의 영화만 출력
let movieResult1 = movieList.filter{ $0.value == "봉준호" }
print(movieResult1)

// 영화 이름을 배열로 변환
let movieResult2 = movieList.filter{ $0.value == "봉준호" }.map { $0.key }
print(movieResult2)


