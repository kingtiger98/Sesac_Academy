//
//  LottoAPIManager.swift
//  LottoMVVM
//
//  Created by 황재하 on 9/13/23.
//

import UIKit
import Alamofire

struct Lotto: Codable {
    let totSellamnt: Int
    let returnValue, drwNoDate: String
    let firstWinamnt, drwtNo6, drwtNo4, firstPrzwnerCo: Int
    let drwtNo5, bnusNo, firstAccumamnt, drwNo: Int
    let drwtNo2, drwtNo3, drwtNo1: Int
}

class LottoAPIManager {
    
    // 인스턴스를 타입프로퍼티를 만들어서 효율적으로 사용할게~
    static let shared = LottoAPIManager()
    
    private init() { }
    
    func callLotto(round: Int, completionHandler: @escaping (Lotto) -> Void) {
        
        let url = "https://www.dhlottery.co.kr/common.do?method=getLottoNumber&drwNo=\(round)"
        
        // 통신 _ 응답
        AF.request(url, method: .get).validate().responseDecodable(of: Lotto.self) { response in
            switch response.result{
            case .success(let value):
                completionHandler(value)
            case .failure(let error):
                print(error)
            }
        }
    }
    
}
