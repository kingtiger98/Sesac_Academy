//
//  ViewController.swift
//  TMDBCodeBase
//
//  Created by 황재하 on 8/28/23.
//

import UIKit
import Alamofire
import SnapKit
import Kingfisher

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setConfigure()
        setConstraints()
    }

    func setConfigure() {
        view.backgroundColor = .white
    }
    
    func setConstraints() {
        
    }
    
    func callRequest(completionHandler: @escaping (MovieData) -> Void){
        TmdbApiManager.shared.callRequest(type: .movie) { data in
            completionHandler(data)
        }
    }
    
    
}

