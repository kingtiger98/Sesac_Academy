//
//  IntroMovieViewController.swift
//  TMDBProject
//
//  Created by 황재하 on 8/27/23.
//

import UIKit
import SnapKit
import Kingfisher

class FirstViewController: UIViewController{
    
    var movieInfo: MovieData = MovieData(totalPages: 0, totalResults: 0, page: 0, results: [])

    let movieImageView1 = {
        let view = UIImageView()
        view.contentMode = .scaleToFill
        return view
    }()
    
    let dismissButton = {
        let btn = UIButton()
        btn.setImage(UIImage(systemName: "xmark"), for: .normal)
        btn.tintColor = .black
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(movieImageView1)
        movieImageView1.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        view.addSubview(dismissButton)
        dismissButton.snp.makeConstraints { make in
            make.leading.top.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
        
        dismissButton.addTarget(self, action:#selector(dismissView) , for: .touchUpInside)
        
        
        TmdbAPIManager.shared.callRequsetCodable(type: .movie) { data in
            self.movieInfo = data
            let url = "https://image.tmdb.org/t/p/w500\(self.movieInfo.results[0].posterPath)"
            self.movieImageView1.kf.setImage(with: URL(string: url))
        }
        
        
        
    }
    
    @objc func dismissView() {
        dismiss(animated: true)
    }
    
}

class SecondViewController: UIViewController{
    
    var movieInfo: MovieData = MovieData(totalPages: 0, totalResults: 0, page: 0, results: [])

    
    let movieImageView2 = {
        let view = UIImageView()
        view.contentMode = .scaleToFill
        return view
    }()
    
    let dismissButton = {
        let btn = UIButton()
        btn.setImage(UIImage(systemName: "xmark"), for: .normal)
        btn.tintColor = .black
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("2222")
        view.backgroundColor = .magenta
        view.addSubview(movieImageView2)

        movieImageView2.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        view.addSubview(dismissButton)
        dismissButton.snp.makeConstraints { make in
            make.leading.top.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
        
        dismissButton.addTarget(self, action:#selector(dismissView) , for: .touchUpInside)

        
        TmdbAPIManager.shared.callRequsetCodable(type: .movie) { data in
            self.movieInfo = data
            let url = "https://image.tmdb.org/t/p/w500\(self.movieInfo.results[1].posterPath)"
            self.movieImageView2.kf.setImage(with: URL(string: url))
        }
    }
    
    @objc func dismissView() {
        dismiss(animated: true)
    }
    
}

class ThirdViewController: UIViewController{
    
    var movieInfo: MovieData = MovieData(totalPages: 0, totalResults: 0, page: 0, results: [])
    
    let movieImageView3 = {
        let view = UIImageView()
        view.contentMode = .scaleToFill
        return view
    }()
    
    let dismissButton = {
        let btn = UIButton()
        btn.setImage(UIImage(systemName: "xmark"), for: .normal)
        btn.tintColor = .black
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("3333")
        view.backgroundColor = .cyan
        view.addSubview(movieImageView3)
        
        movieImageView3.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        view.addSubview(dismissButton)
        dismissButton.snp.makeConstraints { make in
            make.leading.top.equalTo(view.safeAreaLayoutGuide).inset(20)
        }

        dismissButton.addTarget(self, action:#selector(dismissView) , for: .touchUpInside)

        
        TmdbAPIManager.shared.callRequsetCodable(type: .movie) { data in
            self.movieInfo = data
            let url = "https://image.tmdb.org/t/p/w500\(self.movieInfo.results[2].posterPath)"
            self.movieImageView3.kf.setImage(with: URL(string: url))
        }
        
    }
    
    
    @objc func dismissView() {
        dismiss(animated: true)
    }
}



class IntroMovieViewController: UIPageViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource{
    
    // 1.
    var list: [UIViewController] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("인트로")
        UserDefaults.standard.set(true, forKey: "introFirst")
        print(UserDefaults.standard.bool(forKey: "introFirst"))
        
        
       view.backgroundColor = .lightGray
       
       list = [FirstViewController(), SecondViewController(), ThirdViewController()]
        
       delegate = self
       dataSource = self
    
       guard let first = list.first else { return }
       setViewControllers([first], direction: .forward, animated: true)
    }
    
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = list.firstIndex(of: viewController) else { return nil }
        
        let previousIndex = currentIndex - 1
        
        return previousIndex < 0 ? nil : list[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = list.firstIndex(of: viewController) else { return nil }
        
        let nextIndex = currentIndex + 1
        
        return nextIndex > list.count - 1 ? nil : list[nextIndex]
    }
    
    // 2. 페이지 이동 버튼
//    func presentationCount(for pageViewController: UIPageViewController) -> Int {
//        return list.count
//    }
//
//    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
//        guard let first = viewControllers?.first, let index = list.firstIndex(of: first) else { return 0 }
//        return index
//    }

}


