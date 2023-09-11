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
    
    
    func UrlSessionMovieData(completionHandler: @escaping (MovieData?) -> Void ){
        
        guard let url = URL(string: "https://api.themoviedb.org/3/trending/all/day?api_key=Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJjMGI0NTQ2NDIwYzcyNmE4MWQyYjcxMWEwNDhlMTg0NiIsInN1YiI6IjY0ZDZlZGU3ZjQ5NWVlMDI4ZjYzZDNiYyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.BGtl-e-IpDeMJ9JAqP2qK5rmfvOf5gBPOuuYeYfDcbk") else { return }
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                
                if let error {
                    print(error)
                    completionHandler(nil)
                    return
                }
                
                guard let response = response as? HTTPURLResponse,
                      (200...500).contains(response.statusCode) else {
                    print(error) // Alert 또는 Do try Catch 등
                    completionHandler(nil)
                    return
                }
                
                guard let data = data else {
                    completionHandler(nil)
                    return
                }
                
                do {
                    let result = try JSONDecoder().decode(MovieData.self, from: data)
                    print(result)
                    completionHandler(result)
                } catch {
                    print(error) // 디코딩 오류 키
                    completionHandler(nil)
                }
                
            }
            
        }.resume() // 네트워크 통신 시작 신호
    }
    
    
}



