//
//  TmdbCreditAPIManager.swift
//  TMDBProject
//
//  Created by 황재하 on 8/13/23.
//

import UIKit
import Alamofire
import SwiftyJSON
import Kingfisher

class TmdbCreditAPIManager{
    
    static let shared = TmdbCreditAPIManager()
    
    private init() {}
    
    let headers: HTTPHeaders = [
      "accept": "application/json",
      "Authorization": APIKey.TMDBToken
    ]
    
    func callRequest(type: EndPoint, movieId: String, completionHandler: @escaping (CastData) -> () ) {
        
        // URL.baseURl => "https://api.themoviedb.org/3/"
        // let urlCredit =  URL.baseURl + "movie/\(movieID)/credits?language=ko-KR"
        let urlCredit =  EndPoint.actor.requestURL + movieId + "/credits?language=ko-KR"

        AF.request(urlCredit, method: .get, headers: headers).validate(statusCode: 200...500)
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
