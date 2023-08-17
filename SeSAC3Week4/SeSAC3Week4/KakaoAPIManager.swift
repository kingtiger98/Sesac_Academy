//
//  KakaoAPIManager.swift
//  SeSAC3Week4
//
//  Created by 황재하 on 8/11/23.
//

import Foundation
import Alamofire
import SwiftyJSON


class KakaoAPIManager {
    
    static let shared = KakaoAPIManager()
    
    private init() { }
    
    let header: HTTPHeaders = ["Authorization": APIKey.kakaoKey]
    
    func callRequest(type: Endpoint, query: String, completionHandler: @escaping (VideoData) -> () ) {
        
        let text = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        let url = type.requestURL + text
        // "https://dapi.kakao.com/v2/search/vclip?query=\(text)&size=10&page=\(page)"
        
        print(url)
        
        AF.request(url, headers: header).validate(statusCode: 200...500)
            .responseDecodable(of: VideoData.self) { response in
                switch response.result{
                case .success(let value):
                    // print(value)
                    completionHandler(value)
                case .failure(let error):
                    print(error)
                }
                
                
            }
        
//        AF.request(url, method: .get, headers: header).validate(statusCode: 200...500).responseJSON { response in
//            switch response.result {
//            case .success(let value):
//                let json = JSON(value)
//                completionHandler(json)
//
//            case .failure(let error):
//                print(error)
//            }
//        }
        
    }
    
}
