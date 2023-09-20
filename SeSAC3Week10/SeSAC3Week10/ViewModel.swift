//
//  ViewModel.swift
//  SeSAC3Week10
//
//  Created by 황재하 on 9/20/23.
//

import Foundation

class Observable<T> {
    
    private var listener: ((T) -> Void)?
    
    var value: T{
        didSet{
            listener?(value)
        }
    }
    
    init(_ value: T) {
        self.value = value
    }
    
    func bind(_ closure: @escaping (T) -> Void){

        closure(value)
        
        listener = closure
    }
    
}

final class ViewModel{
    
    // URL을 넘길지 response를 넘길지는 너의 선택, 활용의 범주에 따라 달라지겠지?
    func request(completionHandler: @escaping (URL)->Void ){
        Network.shared.requestConvertible(type: PhotoResult.self, api: .random) { response in
            switch response {
            case .success(let value):
                dump(value)
                
                completionHandler(URL(string: value.urls.thumb)!)
                // self.imageView.kf.setImage(with: URL(string: value.urls.thumb))
                
            case .failure(let error):
                print("에러 : ", error.errorDescription!)
            }
        }
    }
    
}
