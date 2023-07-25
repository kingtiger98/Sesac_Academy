//: [Previous](@previous)

import Foundation

// 1. 미디어 종류 - 영화 / 드라마 / 애니메이션
enum Media: String {
    case movie = "영화", drama = "드라마", animation = "애니메이션"
}

// 컴파일 시점에 enum case들을 확인할 수 있어, 오타나 휴먼에러 등을 방지할 수 있고 미리 오류 인지 기능
// rawValue => 멤버와 값 분리 가능
var media: Media = .movie

if media == Media.movie {
    print("\(media.rawValue)를 선택했습니다.")
} else if media == Media.drama {
    print("\(media.rawValue)를 선택했습니다.")
}else if media == Media.animation {
    print("\(media.rawValue)을 선택했습니다.")
}


// 판단해야할 요소가 모두 충족되어 Default 생략 가능
switch media {
case .movie:
    print("영화를 선택했습니다.")
case .drama:
    print("드라마를 선택했습니다.")
case .animation:
    print("애니메이션을 선택했습니다.")
}



// 2. 성별 - 남성 / 여성
enum Gender: String {
    case man = "남성"
    case woman = "여성"
}

var user: Gender = .man

if user == Gender.man {
    print("\(user.rawValue)을 선택했습니다.")
} else if user == Gender.woman {
    print("\(user.rawValue)을 선택했습니다.")
}


// CaseIterable: 열거형의 멩버들을 순회할 수 있는 컬렉션 타입처럼 사용이 가능
enum Words: Int, CaseIterable {
    case newjeans = 100
    case newwords
    case 별다줄
    case 억까
}


let wordList: [Words] = [.newjeans, .newwords, .별다줄, .억까]
print(wordList)
print(wordList[0])

let newWorldList = Words.allCases
print(newWorldList)



print(Words.newjeans.rawValue)
print(Words.newwords.rawValue)
print(Words.별다줄.rawValue)
print(Words.억까.rawValue)


Words(rawValue: 100)


//: [Next](@next)
