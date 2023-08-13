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
    
    func callRequest(type: EndPoint, movieId: String, completionHandler: @escaping (Actor) -> () ) {
        
        // URL.baseURl => "https://api.themoviedb.org/3/"
        // let urlCredit =  URL.baseURl + "movie/\(movieID)/credits?language=ko-KR"
        let urlCredit =  EndPoint.actor.requestURL + movieId + "/credits?language=ko-KR"
        


        AF.request(urlCredit, method: .get, headers: headers).validate(statusCode: 200...500).responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                
                // json["cast"].arrayValue
                let statusCode = response.response?.statusCode ?? 500
                if statusCode == 200 {
                    for actor in json["cast"].arrayValue {
                        let original_name = actor["original_name"].stringValue
                        let character = actor["character"].stringValue
                        let profile_path =  "https://image.tmdb.org/t/p/w500/" + actor["profile_path"].stringValue
                        
                        //print(original_name, character, profile_path)
                        
                        let data = Actor(original_name: original_name, character: character, profile_path: profile_path)
                        
                        // self.actorInfo.append(data)
                        completionHandler(data)
                    }
                } else {
                    print("문제발생 영화리스트 못가져왔어용")
                }
                
                // self.actorTable.reloadData()
                
            case .failure(let error):
                print(error)
            }
        }
        
        
    }
    
}
