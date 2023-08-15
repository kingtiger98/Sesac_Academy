//
//  TmdbAPIManager.swift
//  TMDBProject
//
//  Created by 황재하 on 8/13/23.
//

import UIKit
import Alamofire
import SwiftyJSON
import Kingfisher

class TmdbAPIManager{
    
    static let shared = TmdbAPIManager()
    
    private init() {}
    
    // Codable***
    var resultMovieInfo: Page?
    
    let headers: HTTPHeaders = [
      "accept": "application/json",
      "Authorization": APIKey.TMDBToken
    ]
    
    func callRequset(type: EndPoint, completionHandler: @escaping (Page) -> () ) {
        // "https://api.themoviedb.org/3/trending/all/day?language=en-US"
        // let urlTrend =  URL.baseURl + "trending/all/day?language=en-US"
        let urlTrend =  type.requestURL

        // Codable***
        AF.request(urlTrend, method: .get, headers: headers).validate()
            .responseDecodable(of: Page.self) { response in

             
                //self.resultMovieInfo = response.value
                //print(response.value)
                
                completionHandler(self.resultMovieInfo!)

            }
        
        
        
//        AF.request(urlTrend, method: .get, headers: headers).validate(statusCode: 200...500).responseJSON { response in
//            switch response.result {
//            case .success(let value):
//                let json = JSON(value)
//
//                print(json)
//
//                let statusCode = response.response?.statusCode ?? 500
//
//                if statusCode == 200 {
//                    for item in json["results"].arrayValue {
//
//                        let id = item["id"].stringValue
//                        let title = item["title"].stringValue
//                        let overview = item["overview"].stringValue
//                        let release_date = item["release_date"].stringValue
//                        let vote_average = item["vote_average"].stringValue
//                        let poster_path = "https://image.tmdb.org/t/p/w500/" + item["poster_path"].stringValue
//                        let backdrop_path = "https://image.tmdb.org/t/p/w500/" + item["backdrop_path"].stringValue
//
//
//                        let data = Movie(id: id, title: title, overview: overview, release_date: release_date, vote_average: vote_average, poster_path: poster_path, backdrop_path: backdrop_path)
//                        completionHandler(data)
//                        //self.movieInfo.append(data)
//                    }
//                } else {
//                    print("문제발생 영화리스트 못가져왔어용")
//                }
//
//                    //self.MovieCollectionView.reloadData()
//
//            case .failure(let error):
//                print("통신 안됐지요")
//                print(error)
//            }
//        }

    }
    
    
}
