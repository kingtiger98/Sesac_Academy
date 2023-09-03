//
//  APIMangerTMDB.swift
//  PracticeAAPP
//
//  Created by 황재하 on 8/20/23.
//

import UIKit
import Alamofire

class APIMangerTMDB{
    
    static let shared = APIMangerTMDB()
    
    private init() { }
        
     let headers: HTTPHeaders = [
        "accept" : "application/json",
        "Authorization" : APIKEY.TMDBTOKEN.Token
    ]
    
    func requestTrendData(type: EndPoint, completionHandler: @escaping (TrendData) -> Void) {
        
        let url = type.requestURL
        
        AF.request(url, method: .get, headers: headers).validate()
            .responseDecodable(of: TrendData.self) { response in
                switch response.result{
                case .success(let value):
                    print(value)
                    completionHandler(value)
                case .failure(let error):
                    print(error)
                }
            }
        
    }
    
    
}
