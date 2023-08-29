//
//  ActorView.swift
//  TMDBCodeBase
//
//  Created by 황재하 on 8/29/23.
//

import UIKit

class ActorView: BaseView{
    
    var moviedetail = MovieDetail(movieIdContent: 0, movieNameContent: "비었다", movieOverview: "", backgroundPosterContent: "", foregroundPosterContent: "")
        
    let movieNameLable = {
        let view = UILabel()
        view.textColor = .systemGray6
        view.font = .boldSystemFont(ofSize: 20)
        return view
    }()
    
    let backgroundPoster = {
        let view = UIImageView()
        view.backgroundColor = .brown
        return view
    }()
    
    let foregroundPoster = {
        let view = UIImageView()
        view.backgroundColor = .black
        return view
    }()
    
    let movieOverView = {
        let view = UITextView()
        view.backgroundColor = .systemGray6
        view.font = .boldSystemFont(ofSize: 14)
        view.isEditable = false
        return view
    }()
    
    override func setConfigure() {
        super.setConfigure()
        addSubview(backgroundPoster)
        addSubview(foregroundPoster)
        addSubview(movieNameLable)
        addSubview(movieOverView)
    }
    
    override func setConstraints() {
        super.setConstraints()
        
        backgroundPoster.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(self.safeAreaLayoutGuide)
            make.height.equalToSuperview().multipliedBy(0.25)
        }
        
        foregroundPoster.snp.makeConstraints { make in
            make.leading.bottom.equalTo(backgroundPoster).inset(20)
            make.width.equalTo(backgroundPoster).multipliedBy(0.25)
            make.height.equalTo(backgroundPoster).multipliedBy(0.7)
        }
        
        movieNameLable.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(self.safeAreaLayoutGuide).inset(20)
        }
        
        movieOverView.snp.makeConstraints { make in
            make.top.equalTo(backgroundPoster.snp.bottom)
            make.horizontalEdges.equalTo(self.safeAreaLayoutGuide)
            make.height.equalToSuperview().multipliedBy(0.2)
        }
        
    }
    
    // 전달받은 값 셋팅***
    override func setData() {
        super.setData()
        
        movieNameLable.text = moviedetail.movieNameContent
        
        let urlBackgroundPoster = URL(string:"https://www.themoviedb.org/t/p/w500" + moviedetail.backgroundPosterContent!)
        backgroundPoster.kf.setImage(with: urlBackgroundPoster)
        
        let urlForegroundPoster = URL(string:"https://www.themoviedb.org/t/p/w500" + moviedetail.foregroundPosterContent!)
        foregroundPoster.kf.setImage(with: urlForegroundPoster)
        
        movieOverView.text = moviedetail.movieOverview
    }

    
}
