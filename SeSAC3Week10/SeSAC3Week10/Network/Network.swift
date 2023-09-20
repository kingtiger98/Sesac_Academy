//
//  Network.swift
//  SeSAC3Week10
//
//  Created by 황재하 on 9/19/23.
//

import Foundation
import Alamofire

class Network{
    
    static let shared = Network()
    
    private init() {}
    
    // requestConvertible Router 사용
    func requestConvertible<T: Decodable>(type: T.Type ,api: Router, completionHandler: @escaping (Result<T, SeSACError>) -> Void){
        
        AF.request(api).responseDecodable(of: T.self) { response in
                switch response.result {
                case .success(let value):
                    completionHandler(.success(value))
                    
                case .failure(_):
                    let statusCode = response.response?.statusCode ?? 500
                    guard let error = SeSACError(rawValue: statusCode) else { return }
                    completionHandler(.failure(error))
                }
            }
        
    }
    
    // 제네릭으로 개선해보즈아 ~> , "재하" <- String <- String.Type
    func request<T: Decodable>(type: T.Type ,api: SeSACAPI, completionHandler: @escaping (Result<T, SeSACError>) -> Void){
        
        AF.request(api.endPoint, method: api.method, parameters: api.query, encoding: URLEncoding(destination: .queryString), headers: api.header)
            .responseDecodable(of: T.self) { response in
                switch response.result {
                case .success(let value):
                    completionHandler(.success(value))
                    
                case .failure(_):
                    let statusCode = response.response?.statusCode ?? 500
                    guard let error = SeSACError(rawValue: statusCode) else { return }
                    completionHandler(.failure(error))
                }
            }
    }
    
    
    
    
}

