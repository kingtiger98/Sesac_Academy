//
//  FirstGrammer.swift
//  SeSAC3Week4
//
//  Created by 황재하 on 8/10/23.
//

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





// Function Type : 함수가 가지고 있는 타입. 함수 호출 연산자 없음
/*
 변수/상수나 데이터 구조 내에 자료형을 저장할 수 있다
 함수의 반환값으로 자료형을 사용할 수 있다
 함수의 인자값으로 자료형을 전달할 수 있다
 */
