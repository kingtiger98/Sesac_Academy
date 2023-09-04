//
//  kakaoAPIManager.swift
//  BOOKWARM
//
//  Created by 황재하 on 9/4/23.
//

import UIKit
import Alamofire

class kakaoAPIManager{
    
    static let shared = kakaoAPIManager()
    
    private init() {}
    
    let headers: HTTPHeaders = [
        "Authorization" : "KakaoAK 7a71cd816c94ec531a086cfae68fc921"
    ]

    
    func callKakaoRequset(query: String, completionHandler: @escaping (Welcome) -> Void){
        
        let parameters: Parameters = [
            "query" : "\(query)"
        ]
        
        let url = "https://dapi.kakao.com/v3/search/book?target=title"
        
        AF.request(url, method: .get, parameters: parameters, headers: headers)
            .responseDecodable(of: Welcome.self) { response in
                switch response.result{
                case .success(let value):
                    print("===성공===")
                    completionHandler(value)
                case .failure(let error):
                    print("===실패===\n", error)
                }
            }
    }
    
    
}


//AF.request(url, method: .get, parameters: parameters, headers: headers)
//    .responseJSON { response in
//        switch response.result{
//        case .success(let value):
//            print("===성공===", value)
//        case .failure(let error):
//            print("===실패===", error)
//        }
//    }
