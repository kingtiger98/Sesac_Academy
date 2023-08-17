//
//  LottoManager.swift
//  SeSAC3Week5
//
//  Created by 황재하 on 8/17/23.
//

import UIKit
import Alamofire

class LottoManager {
    
    // 인스턴스를 타입프로퍼티를 만들어서 효율적으로 사용할게~
    static let shared = LottoManager()
    
    private init() { }
    
    func callLotto(completionHandler: @escaping (Int, Int) -> Void) {
        
        let url = "https://www.dhlottery.co.kr/common.do?method=getLottoNumber&drwNo=1080"
        
        // 통신 _ 응답
        AF.request(url, method: .get).validate()
            .responseDecodable(of: Lotto.self) { response in
                guard let value = response.value else { return }
                print("responseDecodable:", value)
                print(value.bnusNo, value.drwtNo3)
                
                completionHandler(value.bnusNo, value.drwtNo3)
            }
    }
    
}

