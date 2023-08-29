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
        view.backgroundColor = .systemGray6
        return view
    }()
    
    let foregroundPoster = {
        let view = UIImageView()
        view.backgroundColor = .systemGray6
        return view
    }()
    
    let overviewLable = {
        let view = UILabel()
        view.text = "Over View"
        view.textColor = .darkGray
        view.font = .boldSystemFont(ofSize: 18)
        return view
    }()
    
    let movieOverView = {
        let view = UITextView()
        view.backgroundColor = .systemGray6
        view.textColor = .black
        view.font = .boldSystemFont(ofSize: 16)
        view.textContainer.maximumNumberOfLines = 0
        view.textAlignment = .center
        view.isEditable = false
        return view
    }()
    
    let actorLable = {
        let view = UILabel()
        view.text = "Cast"
        view.textColor = .darkGray
        view.font = .boldSystemFont(ofSize: 18)
        return view
    }()

    // 테이블뷰***
    lazy var actorTableView = {
        let view = UITableView()
        view.backgroundColor = .systemGray6
        view.rowHeight = 120
        view.register(ActorTableViewCell.self, forCellReuseIdentifier: ActorTableViewCell.identifier)
        return view
    }()
    
    
    override func setConfigure() {
        super.setConfigure()
        
        self.backgroundColor = .white
        
        addSubview(backgroundPoster)
        addSubview(foregroundPoster)
        addSubview(movieNameLable)
        addSubview(overviewLable)
        addSubview(movieOverView)
        addSubview(actorLable)
        addSubview(actorTableView)
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
            make.horizontalEdges.equalTo(self.safeAreaLayoutGuide).inset(16)
            make.bottom.equalTo(foregroundPoster.snp.top).offset(-8)
        }
        
        overviewLable.snp.makeConstraints { make in
            make.top.equalTo(backgroundPoster.snp.bottom).offset(8)
            make.horizontalEdges.equalTo(self.safeAreaLayoutGuide).inset(12)
        }
        
        movieOverView.snp.makeConstraints { make in
            make.top.equalTo(overviewLable.snp.bottom).offset(8)
            make.horizontalEdges.equalTo(self.safeAreaLayoutGuide)
            make.height.equalToSuperview().multipliedBy(0.12)
        }
        
        actorLable.snp.makeConstraints { make in
            make.top.equalTo(movieOverView.snp.bottom).offset(8)
            make.horizontalEdges.equalTo(self.safeAreaLayoutGuide).inset(12)
        }
        
        actorTableView.snp.makeConstraints { make in
            make.top.equalTo(actorLable.snp.bottom).offset(8)
            make.horizontalEdges.equalTo(self.safeAreaLayoutGuide).inset(4)
            make.bottom.equalTo(self)
        }
        
        
    }
    
    // 전달받은 값 셋팅***
    override func setData() {
        super.setData()
        
        movieNameLable.text = moviedetail.movieNameContent
        
        movieOverView.text = moviedetail.movieOverview
        
        let urlBackgroundPoster = URL(string:"https://www.themoviedb.org/t/p/w500" + moviedetail.backgroundPosterContent!)
        backgroundPoster.kf.setImage(with: urlBackgroundPoster)
        
        let urlForegroundPoster = URL(string:"https://www.themoviedb.org/t/p/w500" + moviedetail.foregroundPosterContent!)
        foregroundPoster.kf.setImage(with: urlForegroundPoster)
        
    }

}
