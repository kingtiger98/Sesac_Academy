//
//  WeatherManager.swift
//  SeSAC3Week5
//
//  Created by 황재하 on 8/17/23.
//

import Foundation
import Alamofire
import SwiftyJSON

class WeatherManager {
    
    static let shared = WeatherManager()
    
    
    func callRequestCodable(success: @escaping (WeatherData) -> Void, failure: @escaping () -> Void ) {
        let url = "https://api.openweathermap.org/data/2.5/weather?lat=44.34&lon=10.99&appid=f1664bae469771cd4ab4fd2a8b296358"
        
        AF.request(url, method: .get).validate(statusCode: 200...500)
            .responseDecodable(of: WeatherData.self) { response in
                
                switch response.result {
                case .success(let value):
                    success(value)
                    
                case .failure(let error):
                    print(error)
                    failure()
                
                }
            }
        
    }
    
    
    
    
    func callRequestJSON(completionHandler: @escaping (JSON) -> Void) {
        let url = "https://api.openweathermap.org/data/2.5/weather?lat=44.34&lon=10.99&appid=f1664bae469771cd4ab4fd2a8b296358"
        
        AF.request(url, method: .get).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                print("JSON: \(json)")
                                
                completionHandler(json)
                
            case .failure(let error):
                print(error)
            }
        }
    }
    
}
