//
//  TmdbAPIManager.swift
//  MediaProject
//
//  Created by 황재하 on 8/19/23.
//

import UIKit
import Alamofire
import Kingfisher



class TmdbAPIManager{
    
    static let shared = TmdbAPIManager()
    
    private init() { }
    
    let header: HTTPHeaders = [
        "accept": "application/json",
        "Authorization": APIKey.tmdbToken.key
    ]
    
    func callRequestTrend(type: EndPoint, complitionHandler: @escaping (MovieData) -> Void ) {
         
        let url = type.requestURL
        
        AF.request(url, method: .get, headers: header).validate()
            .responseDecodable(of: MovieData.self) { response in
                switch response.result {
                case .success(let value):
                    print("성공 ===== ", value)
                    complitionHandler(value)
                case .failure(let error):
                    print("실패 ===== ", error)
                }
            }

    }
    
    
    
    func callRequsetSimilar(type: EndPoint, movieId: Int, completionHandler: @escaping (SimilarData) -> Void ) {
        
        let url = type.requestURL + "\(movieId)/similar?language=ko-KR"
        
        AF.request(url, method: .get, headers: header).validate()
            .responseDecodable(of: SimilarData.self) { response in
                switch response.result {
                case .success(let value):
                    completionHandler(value)
                    print(value)
                case .failure(let error):
                    print(error)
                }
            }
        
    }
    
    func callRequestVideo(type: EndPoint, movieId: Int, completionHandler: @escaping (VideoData) -> Void ) {
        
        let url = type.requestURL + "\(movieId)/videos?language=ko-KR"
        
        AF.request(url, method: .get, headers: header).validate()
            .responseDecodable(of: VideoData.self) { response in
                switch response.result {
                case .success(let value):
                    completionHandler(value)
                    print(value)
                case .failure(let error):
                    print(error)
                }
            }
        
    }
    
    
}
