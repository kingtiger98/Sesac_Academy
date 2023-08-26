//
//  NetflixViewController.swift
//  SeSAC3Week6
//
//  Created by 황재하 on 8/26/23.
//

import UIKit
import SnapKit

class NetflixViewController: UIPageViewController {

    let backgroundPoster = {
        let view = UIImageView()
        view.image = UIImage(named: "왕의남자")
        view.contentMode = .scaleToFill
        return view
    }()
    
    let backgroundShadow = {
        let view = UIImageView()
        view.image = UIImage(named: "background")
        return view
    }()
    
    let logoButton = {
        let view = UIButton()
        view.setImage(UIImage(named: "netflix-2"), for: .normal)
        return view
    }()
    
    let menuStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.spacing = 40
        view.distribution = .fillProportionally
        view.alignment = .leading
        return view
    }()
    
    let menuLabel1 = {
        let view = WhiteBoldLabel()
        return view.setLabel(title: "TV프로그램")
        
    }()
    let menuLabel2 = {
        let view = WhiteBoldLabel()
        return view.setLabel(title: "영화")
        
    }()
    let menuLabel3 = {
        let view = WhiteBoldLabel()
        return view.setLabel(title: "내가 찜한 컨텐츠")
        
    }()
    
    let movieStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.spacing = 0
        view.distribution = .fill
        view.alignment = .center
        return view
    }()
    
    let favoriteButton = {
        let button = WhiteSubtitleButton()
        return button.setButton(imageName: "check", subTitle: "내가 찜한 컨텐츠")
    }()
    let playButton = {
        let button = WhiteSubtitleButton()
        return button.setButton(imageName: "play_normal", subTitle: "영화보기")
    }()
    let informationButton = {
        let button = WhiteSubtitleButton()
        return button.setButton(imageName: "info", subTitle: "정보")
    }()
    
    let previewLabel = {
        let label = WhiteBoldLabel()
        return label.setLabel(title: "미리보기")
    }()
    
    let previewStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.spacing = 8
        view.distribution = .fillEqually
        view.alignment = .center
        return view
    }()
    
    let previewImageView1 = {
        let image = PreviewImageView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        image.setImage()
        image.image = UIImage(named: "택시운전사")
        
        return image
    }()
    
    let previewImageView2 = {
        let image = PreviewImageView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        image.setImage()
        image.image = UIImage(named: "해운대")
        
        return image
    }()
    
    let previewImageView3 = {
        let image = PreviewImageView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        image.setImage()
        image.image = UIImage(named: "태극기휘날리며")
        
        return image
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .black

        view.addSubview(backgroundPoster)
        view.addSubview(backgroundShadow)

        view.addSubview(logoButton)
        menuStackView.addArrangedSubview(menuLabel1)
        menuStackView.addArrangedSubview(menuLabel2)
        menuStackView.addArrangedSubview(menuLabel3)
        view.addSubview(menuStackView)
        
        movieStackView.addArrangedSubview(favoriteButton)
        movieStackView.addArrangedSubview(playButton)
        movieStackView.addArrangedSubview(informationButton)
        view.addSubview(movieStackView)

        view.addSubview(previewLabel)
        
        previewStackView.addArrangedSubview(previewImageView1)
        previewStackView.addArrangedSubview(previewImageView2)
        previewStackView.addArrangedSubview(previewImageView3)
        view.addSubview(previewStackView)
        
        setLayout()
    }
    
    func setLayout(){
        
        backgroundPoster.snp.makeConstraints { make in
            make.horizontalEdges.top.equalToSuperview()
            make.bottom.equalToSuperview().offset(-200)
        }
        
        backgroundShadow.snp.makeConstraints { make in
            make.edges.equalToSuperview()

        }
        
        logoButton.snp.makeConstraints { make in
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(12)
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.size.equalTo(40)
        }
        
        menuStackView.snp.makeConstraints { make in
            make.top.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
            
        }

        movieStackView.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(backgroundPoster)
            make.bottom.equalTo(backgroundPoster)
        }
        
        previewLabel.snp.makeConstraints { make in
            make.top.equalTo(backgroundPoster.snp.bottom).offset(8)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
        }
        
        previewStackView.snp.makeConstraints { make in
            make.top.equalTo(previewLabel.snp.bottom).offset(8)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(8)
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(8)
        }
        
    }


}
