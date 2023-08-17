//
//  PosterViewController.swift
//  SeSAC3Week5
//
//  Created by 황재하 on 8/16/23.
//

import UIKit
import Alamofire
import SwiftyJSON
import Kingfisher

// 프로토콜***
// 선언만 있음 -> 기능은 채택한 녀석이 해야해
protocol CollectionViewAttributeProtocol {
    func configureCollectionView()
    func configureCollectionViewLayout()
}


class PosterViewController: UIViewController {

    @IBOutlet weak var posterCollectionView: UICollectionView!
    
    // 네트워킹한 데이터 저장할 번수
    var firstList: Recommendation = Recommendation(totalResults: 0, page: 0, totalPages: 0, results: [])
    var secondList: Recommendation = Recommendation(totalResults: 0, page: 0, totalPages: 0, results: [])
    var thirdList: Recommendation = Recommendation(totalResults: 0, page: 0, totalPages: 0, results: [])
    var forthList: Recommendation = Recommendation(totalResults: 0, page: 0, totalPages: 0, results: [])

    
    override func viewDidLoad() {
        super.viewDidLoad()
                
       // 싱글톤+클로저***
       // LottoManager.shared.callLotto { bonus, number in
       //     print("클로저로 꺼내온 값 : ", bonus, number)
       // }

        configureCollectionView()
        configureCollectionViewLayout()
        
        callRecommendation(id: 872585) { data in
            // 네트워킹한 데이터 저장~***
            self.firstList = data
            self.posterCollectionView.reloadData()
        }
        
        callRecommendation(id: 157336) { data in
            // 네트워킹한 데이터 저장~***
            self.secondList = data
            self.posterCollectionView.reloadData()
        }
        
        callRecommendation(id: 567646) { data in
            // 네트워킹한 데이터 저장~***
            self.thirdList = data
            self.posterCollectionView.reloadData()
        }
        
        callRecommendation(id: 447365) { data in
            // 네트워킹한 데이터 저장~***
            self.forthList = data
            self.posterCollectionView.reloadData()
        }
        
        
        
    }
    
    
    // 오펜하이머 : 872585, 인터스텔라 : 157336, 극한직업 : 567646, 가오갤 : 447365
    func callRecommendation(id: Int, completionHandler: @escaping (Recommendation) -> Void) {
        let url = "https://api.themoviedb.org/3/movie/\(id)/recommendations?api_key=\(Key.tmdb)&language=ko-KR"
        
        AF.request(url, method: .get).validate(statusCode: 200...500)
            .responseDecodable(of: Recommendation.self) { response in
                
                switch response.result {
                case .success(let value):
                    
                    completionHandler(value)
                    
                    // 네트워킹한 데이터 저장~***
                    // self.list = value
                    // self.posterCollectionView.reloadData()
                    
                case .failure(let error):
                    print("실패!")
                    print(error)
                }
            }
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // 익스텐션 + 클로저***
        // showAlert(title: "테스트 얼럿", message: "테스트입니다.", button: "저장하기") {
        //    print("저장버튼을 클릭했습니다.")
        //    self.posterCollectionView.backgroundColor = .lightGray
        // }
    }
    
}


extension PosterViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        if section == 0 {
            return firstList.results.count
        } else if section == 1 {
            return secondList.results.count
        } else if section == 2{
            return thirdList.results.count
        } else if section == 3{
            return forthList.results.count
        }
        
        return 9
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PosterCollectionViewCell.identifier, for: indexPath) as? PosterCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        if indexPath.section == 0 {
            let url = "https://image.tmdb.org/t/p/w500\(firstList.results[indexPath.item].posterPath ?? "")"
            cell.posterImageView.kf.setImage(with: URL(string: url))
        } else if indexPath.section == 1 {
            let url = "https://image.tmdb.org/t/p/w500\(secondList.results[indexPath.item].posterPath ?? "")"
            cell.posterImageView.kf.setImage(with: URL(string: url))
        } else if indexPath.section == 2 {
            let url = "https://image.tmdb.org/t/p/w500\(thirdList.results[indexPath.item].posterPath ?? "")"
            cell.posterImageView.kf.setImage(with: URL(string: url))
        } else if indexPath.section == 3 {
            let url = "https://image.tmdb.org/t/p/w500\(forthList.results[indexPath.item].posterPath ?? "")"
            cell.posterImageView.kf.setImage(with: URL(string: url))
        }
        
        cell.posterImageView.backgroundColor = UIColor(red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: 1)
    
        return cell
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if kind == UICollectionView.elementKindSectionHeader {
            
            guard let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderPosterCollectionReusableView.identifier, for: indexPath) as? HeaderPosterCollectionReusableView else { return UICollectionReusableView() }
            
            view.titleLabel.text = "테스트 섹션"
            
            return view
            
            
        } else {
            return UICollectionReusableView()
        }
        
    }
    
}


extension PosterViewController : CollectionViewAttributeProtocol {
    
    func configureCollectionView() {
        
        // Protocol as Type
        // delegate는 자료형이 프로토콜이지만 posterCollectionView가 delegate를 채택하고 있기 때문에 클래스인 PosterCollectionView가 들어갈 수 있음***
        posterCollectionView.delegate = self
        posterCollectionView.dataSource = self
        
        posterCollectionView.register(UINib(nibName: PosterCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: PosterCollectionViewCell.identifier)
        posterCollectionView.register(UINib(nibName: HeaderPosterCollectionReusableView.identifier, bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderPosterCollectionReusableView.identifier)
    }
    
    func configureCollectionViewLayout() {
        // FlowLayout잡기
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 100, height: 100)
        layout.minimumLineSpacing = 8
        layout.minimumInteritemSpacing = 8
        layout.scrollDirection = .vertical
        
        // 첫 등장이오
        layout.headerReferenceSize = CGSize(width: 300, height: 50)
        
        posterCollectionView.collectionViewLayout = layout
    }
    
}



//protocol Test{
//    func test()
//}
//
//class A: Test {
//    func test() { }
//}
//
//class B: Test {
//    func test() { }
//}
//
//class C: A { }
//
//let example: Test = B() //
//
//let value: A = C()




