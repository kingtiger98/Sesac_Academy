//
//  APIService.swift
//  SeSAC3PhotoGramHJH
//
//  Created by 황재하 on 8/30/23.
//

import Foundation

class APIService {
    
    // 해당 클래스 바깥으로는 사용불가하게함 : 외부에서 초기화를 제한!
    private init() {}
    
    // 싱글톤 패턴은 => 인스턴스 생성을 아래의 shared(하나의 타입프로퍼티)로만 가능해
    static let shared = APIService() // 인스턴스 생성 방지
    
    func callRequest() {
        
        let url = URL(string: "https://apod.nasa.gov/apod/image/2308/M66_JwstTomlinson_3521.jpg")
        
        let request = URLRequest(url: url!)
        
        // 1. 세션의 특성(shared, configuration(default, Ephemeral, Background)) 사용
        // 2. 리소스의 양에 따라 dataTask, download, upload 사용
        // 3. Response를 어떻게 받을까?
        //      ㄴ completionHandler : task가 다 끝나고 실행, 한 번 실행됨, 큰 이미지는 얼마나 다운로드 됐는지 알 수 없다
        //      ㄴ SessionDelegate : 최초응답 / 10% -> 20% 중간 과정 에서 응답을 계속 받을 수 있음 _ 이미지 다운로드 로딩률 같은 것 구현 가능 // shared세션일 떈 사용 못해
        URLSession.shared.dataTask(with: request) { data, response, error in
            print(data)
            
            let value = String(data: data!, encoding: .utf8)
            
            print(value)
            
            print(response)
            print(error)
            
        }.resume() // 네트워크 통신 시작 신호
        
    }
    
    
    
}
