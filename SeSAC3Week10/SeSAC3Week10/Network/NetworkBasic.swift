//
//  NetworkBasic.swift
//  SeSAC3Week10
//
//  Created by 황재하 on 9/19/23.
//

import Foundation
import Alamofire

enum SeSACError: Int, Error, LocalizedError {
    
    case Unauthorized = 401
    case permissionDenied = 403
    case inValidServer = 500
    case missingParameter = 400
    
    var key: String{
        switch self {
        case .Unauthorized:
            return "인증 정보가 없습니다"
        case .permissionDenied:
            return "권한이 없습니다"
        case .inValidServer:
            return "서버 점검 중입니다"
        case .missingParameter:
            return "검색어를 입력해주세요"
        }
    }
    
}



// final 키워드 : 상속 불가하게 함 <= 컴파일 시점에서 기능개선, 유지보수에도 좋다, dispathch?
final class NetworkBasic{
    
    static let shared = NetworkBasic()
    
    let key = SeSACAPI.key
    
    private init() {}
    
    // func request(query: String, completionHandler: @escaping (Photo?, Error?) -> Void){
    
    // Result 타입으로 대웅하기***
    func request(api: SeSACAPI, query: String, completionHandler: @escaping (Result<Photo, SeSACError>) -> Void){
        
        // let api = SeSACAPI.search(query: query)
        
        // let url = "https://api.unsplash.com/search/photo"
        // let header: HTTPHeaders = [ "Authorization" : "Client-ID \(key)" ]
        // let query: Parameters = [ "query" : query ]
        
        // query로 보낼때 encoding: URLEncoding(destination: .queryString) 사용! _ post http body
        AF.request(api.endPoint, method: api.method, parameters: api.query, encoding: URLEncoding(destination: .queryString), headers: api.header)
            .responseDecodable(of: Photo.self) { response in
                switch response.result {
                case .success(let value):
                    completionHandler(.success(value))
                    
                    // 오류처리 ***
                case .failure(_):
                    let statusCode = response.response?.statusCode ?? 500
                    guard let error = SeSACError(rawValue: statusCode) else { return }
                    completionHandler(.failure(error))
                }
            }
        
    }
    
    func random(api: SeSACAPI ,completionHandler: @escaping (Result<PhotoResult, SeSACError>) -> Void){ // func request(query: String){
        
        // let api = SeSACAPI.random
        
        // let url = "https://api.unsplash.com/photos/random"
        // let header: HTTPHeaders = [ "Authorization" : "Client-ID \(key)" ]
        
        AF.request(api.endPoint, method: api.method, headers: api.header)
            .responseDecodable(of: PhotoResult.self) { response in
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
    
    
    func detailPhoto(api: SeSACAPI, id: String, completionHandler: @escaping (Result<PhotoResult, SeSACError>) -> Void ){
        
        // let api = SeSACAPI.photo(id: id)
        
        // let url = "https://api.unsplash.com/photos/\(id)"
        // let header: HTTPHeaders = [ "Authorization" : "Client-ID \(key)" ]
        
        AF.request(api.endPoint, method: api.method, headers: api.header)
            .responseDecodable(of: PhotoResult.self) { response in
                switch response.result {
                case .success(let value):
                    completionHandler(.success(value))
                case .failure(_):
                    let statusCode = response.response?.statusCode ?? 500
                    guard let error = SeSACError(rawValue: statusCode) else { return }
                    completionHandler(.failure(error))                }
            }
        
    }
    
    
    
    
    
}
