//
//  NetworkBasic.swift
//  PunkMVVM
//
//  Created by 황재하 on 9/20/23.
//

import Foundation
import Alamofire

final class NetworkBasic{
    
    static let shared = NetworkBasic()
    
    private init() {}
    
    func request<T: Decodable>(type: T.Type ,api: PunkAPI, completionHandler: @escaping (Result<T, Error>) -> Void){
        
        AF.request(api.endPoint, method: api.method, encoding: URLEncoding(destination: .queryString))
            .responseDecodable(of: T.self) { response in
                switch response.result{
                case .success(let value):
                    print(value)
                    completionHandler(.success(value))
                case .failure(let error):
                    print(error)
                    completionHandler(.failure(error))
                }
            }
        
    }
    
    // requestConvertible Router 사용
    func requestConvertible<T: Decodable>(type: T.Type ,api: Router, completionHandler: @escaping (Result<T, Error>) -> Void){
        
        AF.request(api).responseDecodable(of: T.self) { response in
                switch response.result {
                case .success(let value):
                    completionHandler(.success(value))
                    
                case .failure(let error):
                    completionHandler(.failure(error))
                }
            }
        
    }
    
    
    
    
    
}
