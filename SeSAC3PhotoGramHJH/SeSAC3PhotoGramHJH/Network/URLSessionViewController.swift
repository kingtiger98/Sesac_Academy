//
//  URLSessionViewController.swift
//  SeSAC3PhotoGramHJH
//
//  Created by 황재하 on 8/30/23.
//

import UIKit

class URLSessionViewController: UIViewController {
    
    var session: URLSession!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "https://apod.nasa.gov/apod/image/2308/M66_JwstTomlinson_3521.jpg")
        
        // 네트워킹 중간 과정에 응답을 받기위해 configuration의 default 사용
        // URLSession.sharde와 같은 구조라고 보면됨 기능은 default 인거고
        session = URLSession(configuration: .default, delegate: self, delegateQueue: .main)
        session.dataTask(with: url!).resume()
    }
    
}

extension URLSessionViewController: URLSessionDataDelegate {
    
    // 서버에서 최초로 응답 받은 경우에 호출(상태코드 처리) _ statusCode : 200번일 때만 처리하게끔 _ 다운받을 이미지의 총 크기를 알 수 있음 ex) 100MB
//    func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive response: URLResponse) async -> URLSession.ResponseDisposition {
//        print("RESPONSE : ", response)
//    }
    
    // 서버에서 데이터 받을 때마다 반복적으로 호출
    func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive data: Data) {
        print("DATA : ", data)

    }
    
    // 서버에서 응답이 완료가 된 이후에 호출
    func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
        print("END")
    }
    
    
    
}
