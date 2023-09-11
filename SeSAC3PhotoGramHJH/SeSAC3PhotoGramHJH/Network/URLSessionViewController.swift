//
//  URLSessionViewController.swift
//  SeSAC3PhotoGramHJH
//
//  Created by 황재하 on 8/30/23.
//

import UIKit

class URLSessionViewController: UIViewController {
    
    var session: URLSession!
    
    // 1. 다운로드 진행률
    var total: Double = 0
    
    // 3_1, 3_3. 다운로드 진행률
    var buffer: Data? {
        didSet {
            let result = Double(buffer?.count ?? 0) / total
            progressLabel.text = "\(result * 100)"
            print(result, total)
        }
    }
    
    let progressLabel = {
        let view = UILabel()
        view.backgroundColor = .black
        view.textColor = .white
        return view
    }()
    
    let iamgeView = {
        let view = UIImageView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // 4. 다운로드 진행률***
        buffer = Data() // buffer?.append(data)가 실행되기 위함
        
        view.addSubview(iamgeView)
        view.addSubview(progressLabel)
        
        progressLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.horizontalEdges.equalToSuperview()
            make.height.equalTo(100)
        }
        
        iamgeView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.size.equalTo(200)
        }

        view.backgroundColor = .white
        
        let url = URL(string: "https://apod.nasa.gov/apod/image/2308/M66_JwstTomlinson_3521.jpg")
        
        // 네트워킹 중간 과정에 응답을 받기위해 configuration의 default 사용
        // URLSession.sharde와 같은 구조라고 보면됨 기능은 default 인거고
        session = URLSession(configuration: .default, delegate: self, delegateQueue: .main)
        session.dataTask(with: url!).resume()
    }
    
    // 카카오톡 사진 다운로드 : 다운로드 중에 다른 채팅방으로 넘어가면? 취소 버튼?
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        // 취소 액션(화면이 사라질 때 등)
        // 리소스 정리, 실행중인 것도 무시
        session.invalidateAndCancel()
        
        // 기다렸다가 리소스 끝나면 정리
        session.finishTasksAndInvalidate()
        
    }
    
}

extension URLSessionViewController: URLSessionDataDelegate {
    
    // 서버에서 최초로 응답 받은 경우에 호출(상태코드 처리) _ statusCode : 200번일 때만 처리하게끔 _ 다운받을 이미지의 총 크기를 알 수 있음 ex) 100MB
    func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive response: URLResponse) async -> URLSession.ResponseDisposition {
        print("RESPONSE : ", response)
        
        if let response = response as? HTTPURLResponse,
           (200...500).contains(response.statusCode) {
            
            // 2. 다운로드 진행률
            total = Double(response.value(forHTTPHeaderField: "Content-Length")!)!
            
            return .allow
        } else {
            return .cancel
        }
        
    }
    
    // 서버에서 데이터 받을 때마다 반복적으로 호출
    func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive data: Data) {
        print("DATA : ", data)
        
        // 3_2. 다운로드 진행률
        buffer?.append(data) // buffer가 nil이면 append 구문 실행 x
    }
    
    // 서버에서 응답이 완료가 된 이후에 호출
    func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
        print("END")
        
        if let error {
            print(error)
        } else {
            
            guard let buffer = buffer else {
                print(error)
                return
            }
            
            // 5. 다운로드 진행률 : 다운완료하면 이미지 표시!
            iamgeView.image = UIImage(data: buffer)
            
        }
        
    }
    
    
    
}
