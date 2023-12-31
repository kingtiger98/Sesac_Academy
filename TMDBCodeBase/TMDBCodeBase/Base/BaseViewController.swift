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
    
    //
    func callRequestAllData(completionHandler: @escaping (AllData) -> Void){
        TmdbApiManager.shared.callRequestAllData(type: .all) { data in
            completionHandler(data)
        }
    }
    
    func callRequestMovieData(completionHandler: @escaping (MovieData) -> Void){
        TmdbApiManager.shared.callRequestMovieData(type: .movie) { data in
            completionHandler(data)
        }
    }
    
    func callRequestCastData(movieId: String,completionHandler: @escaping (CastData) -> Void){
        TmdbApiManager.shared.callRequestCastData(type: .actor, movieId: movieId) { data in
            completionHandler(data)
        }
    }
    
    func callURLSessionMovieData(completionHandler: @escaping (MovieData) -> Void){
        TmdbApiManager.shared.UrlSessionMovieData { data in
            completionHandler(data!)
        }
    }
    
    
}

