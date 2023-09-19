//
//  ViewController.swift
//  SeSAC3Week10
//
//  Created by 황재하 on 9/19/23.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        Network.shared.request(type: PhotoResult.self, api: .photo(id: "OH_DTkQabV0")) { response in
            switch response {
            case .success(let value):
                dump(value)
            case .failure(let error):
                print(error.errorDescription!)
            }
        }
        
        
        
    }

    
    
    
    
}


struct Photo: Decodable {
    
    let total: Int
    let total_pages: Int
    let results: [PhotoResult]
    
}

struct PhotoResult: Decodable{
    
    let id: String
    let created_at: String
    let urls: PhotoURL
    
}

struct PhotoURL: Decodable{
    
    let full: String
    let thumb: String
    
}
