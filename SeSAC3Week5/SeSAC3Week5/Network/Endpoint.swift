//
//  Endpoint.swift
//  SeSAC3Week5
//
//  Created by jack on 2023/08/14.
//

import Foundation
    
// 기억해! : 열거형은 저장프로퍼티를 사용할 수 없어! // 인스턴스를 생성할 수 없기 떄문!
enum Nasa: String, CaseIterable {
    
    // 타입 프로퍼티는 타입프로퍼티끼리 사용가능, 열거형은 저장프로퍼티를 사용할 수 없다!***
    static let baseURL = "https://apod.nasa.gov/apod/image/"
    
    case one = "2308/sombrero_spitzer_3000.jpg"
    case two = "2212/NGC1365-CDK24-CDK17.jpg"
    case three = "2307/M64Hubble.jpg"
    case four = "2306/BeyondEarth_Unknown_3000.jpg"
    case five = "2307/NGC6559_Block_1311.jpg"
    case six = "2304/OlympusMons_MarsExpress_6000.jpg"
    case seven = "2305/pia23122c-16.jpg"
    case eight = "2308/SunMonster_Wenz_960.jpg"
    case nine = "2307/AldrinVisor_Apollo11_4096.jpg"
    
    // test: 인스턴스 연산 프로퍼티 > 값을 저장하고 있지는 않고, 값을 사용할 수 있는 통로로서의 역할만 담당
    // var test: URL {
    //     return URL(string: "http://www.naver.com")!
    // }
    
    // 타입 프로퍼티인 baseURL을 사용했기 떄문에 연산 프로퍼티 역시 타입 프로퍼티로 선언 해야함 : 타입 맞춰주세용~
    static var photo: URL {
        return URL(string: baseURL + self.allCases.randomElement()!.rawValue)!
    }
    
    // baseURL이 Nasa의 속성임을 명시해주면 인스턴스 프로퍼티로도 사용할 수 있긴 함!
    // var photo: URL {
    //     return URL(string: Nasa.baseURL + Nasa.allCases.randomElement()!.rawValue)!
    // }
    
    
    
}
