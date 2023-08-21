//
//  TmdbAPIManager.swift
//  TMDBProject
//
//  Created by 황재하 on 8/13/23.
//

import UIKit
import Alamofire
import Kingfisher

class TmdbAPIManager{
    
    static let shared = TmdbAPIManager()
    
    private init() {}
    
    let headers: HTTPHeaders = [
      "accept": "application/json",
      "Authorization": APIKey.TMDBToken
    ]
    
    func callRequsetCodable(type: EndPoint, completionHandler: @escaping (MovieData) -> Void ) {

        let urlTrend =  type.requestURL

        // Codable***
        AF.request(urlTrend, method: .get, headers: headers).validate()
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
    
    
}
