//
//  TranslateAPManager.swift
//  SeSAC3Week4
//
//  Created by 황재하 on 8/11/23.
//

import Foundation
import Alamofire
import SwiftyJSON

class PapagoAPIManager {
    static let shared = PapagoAPIManager()
    
    private init() {}
    
    func callRequest(text: String, resultString: @escaping (String) -> Void) {
        let url1 = "https://openapi.naver.com/v1/papago/n2mt" // 언어번역
        let url2 = "https://openapi.naver.com/v1/papago/detectLangs" // 언어감지

        let header: HTTPHeaders = [
            "X-Naver-Client-Id": "BrvOaceJjwKVzsCwhXXj",
            "X-Naver-Client-Secret": "PBkG5c48MF"
        ]
        
        // 언어번역
        let parameter1: Parameters = [
            "source": "ko",
            "target": "en",
            "text": text // originalTextView.text ?? ""
        ]
        
        // 언어감지
        let parameter2: Parameters = [
            "query": text // originalTextView.text ?? ""
        ]
        
        
        // 언어감지
        AF.request(url2, method: .post, parameters: parameter2, headers: header).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                print("JSON1: \(json)")
                
                let data1 = json["langCode"].stringValue
                print("입력된 언어코드는 \(data1)입니다")
                
            case .failure(let error):
                print("erorr: \(error)")
            }
        
        }
        
        // 언어번역
        AF.request(url1, method: .post, parameters: parameter1, headers: header).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                print("JSON2: \(json)")
                
                let data2 = json["message"]["result"]["translatedText"].stringValue
                resultString(data2) //self.translateTextView.text = data2
                
            case .failure(let error):
                print("erorr: \(error)")
            }
        }
        
        
    }
    
}
