//
//  TmdbApiManager.swift
//  TMDBCodeBase
//
//  Created by 황재하 on 8/28/23.
//

import UIKit
import Alamofire

class TmdbApiManager{
    
    static let shared = TmdbApiManager()
    
    private init() { }
    
    let headers: HTTPHeaders = [
      "accept": "application/json",
      "Authorization": APIKey.TMDBToken
    ]
    
    //
    func callRequestAllData(type: EndPoint, completionHandler: @escaping (AllData) -> Void){
        
        let url = type.requestURL
        
        AF.request(url, method: .get, headers: headers).validate()
            .responseDecodable(of: AllData.self) { response in
                switch response.result {
                case .success(let value):
                    //print(value)
                    completionHandler(value)
                case .failure(let error):
                    print(error)
                }
            }
    }
    
    func callRequestMovieData(type: EndPoint, completionHandler: @escaping (MovieData) -> Void ){
        
        let url = type.requestURL
        
        AF.request(url, method: .get, headers: headers).validate()
            .responseDecodable(of: MovieData.self) { response in
                switch response.result {
                case .success(let value):
                    //print(value)
                    completionHandler(value)
                case .failure(let error):
                    print(error)
                }
            }
    }
    
    
    
    func callRequestCastData(type: EndPoint, movieId: String, completionHandler: @escaping (CastData) -> Void){
        
        let url = type.requestURL + movieId + "/credits?language=ko-KR"
        
        AF.request(url, method: .get, headers: headers).validate()
            .responseDecodable(of: CastData.self) { response in
                switch response.result {
                case .success(let value):
                    completionHandler(value)
                case .failure(let error):
                    print(error)
                }
            }
    }
    
    
}
