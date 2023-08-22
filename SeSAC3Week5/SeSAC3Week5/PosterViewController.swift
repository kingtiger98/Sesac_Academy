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
    var fourthList: Recommendation = Recommendation(totalResults: 0, page: 0, totalPages: 0, results: [])

    
    override func viewDidLoad() {
        super.viewDidLoad()
                
       // 싱글톤+클로저***
       // LottoManager.shared.callLotto { bonus, number in
       //     print("클로저로 꺼내온 값 : ", bonus, number)
       // }

        configureCollectionView()
        configureCollectionViewLayout()
        
        
//        for item in UIFont.familyNames {
//            print(item)
//            for name in UIFont.fontNames(forFamilyName: item) {
//                print("===\(name)")
//            }
//        }
        
        
        
        
        // DispatchGroup() 세 번째 구현!!!***
        let id = [ 671, 672, 673, 674 ] // 2차원 배열로 개선해봐!

        let group = DispatchGroup()

        for item in id {
            group.enter() // 작업 드가자~ : 작업량 +1
            callRecommendation(id: item) { data in
                if item == 671 {
                    self.firstList = data
                } else if item == 672 {
                    self.secondList = data
                } else if item == 673 {
                    self.thirdList = data
                } else if item == 674 {
                    self.fourthList = data
                }

                group.leave() // 작업 끝이다~ : 작업량 -1
            }
        }

        group.notify(queue: .main) {
            self.posterCollectionView.reloadData()
        }
        
        
    }
    
    
    @IBAction func sendNotification(_ sender: UIButton) {
        
        // 포그라운드에서 알림이 안뜨는게 디폴트! : 앱실행중
        
        // 1. 컨텐츠
        let content = UNMutableNotificationContent()
        content.title = "알림 알림 알림"
        content.body = ["5초 뒤에 알림 받기", "Asd", "Asdf"].randomElement()!
        content.badge = 100 // 뱃지 사라지는 코드는 따로 구현해야해
        
        // 2. 언제 => 알림 보내!
        
        var component = DateComponents()
        component.minute =  5 // 매 시간 5분
        component.hour = 10 // 매일 10시
        //    ㄴ 매일 10시 5분
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: component, repeats: false)
        
        // let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 60, repeats: true)
        // let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false) // repeats을 false하면 60초 아래로 알림오는 것도 가능함
        
        let request = UNNotificationRequest(identifier: "\(Date())", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request) { error in
            print(error)
        }
        
    }
    
    
    
    
    
    // DispatchGroup() 두 번째 구현!!!***
    // group.enter() / group.leave() : 비동기 함수를 비동기 함수로 감싸는 법***
    func dispatchGroupEnterLeave() {

        let group = DispatchGroup()
        
        group.enter() // 1. 나 그룹 들어갈게~, 작업량 +1
        self.callRecommendation(id: 872585) { data in
            // 네트워킹한 데이터 저장~***
            self.firstList = data
            print("===1")
            group.leave() // 2. 나 그룹 떠날게~, 작업량 -1
        }
        
        group.enter() // 1. 나 그룹 들어갈게~, 작업량 +1
        self.callRecommendation(id: 157336) { data in
            // 네트워킹한 데이터 저장~***
            self.secondList = data
            print("===2")
            group.leave() // 2. 나 그룹 떠날게~, 작업량 -1
        }
        
        group.enter() // 1. 나 그룹 들어갈게~, 작업량 +1
        self.callRecommendation(id: 567646) { data in
            // 네트워킹한 데이터 저장~***
            self.thirdList = data
            print("===3")
            group.leave() // 2. 나 그룹 떠날게~, 작업량 -1
        }
        
        group.enter() // 1. 나 그룹 들어갈게~, 작업량 +1
        self.callRecommendation(id: 447365) { data in
            // 네트워킹한 데이터 저장~***
            self.fourthList = data
            print("===4")
            group.leave() // 2. 나 그룹 떠날게~, 작업량 -1
        }
        
        // 작업량이 0이 되는 순간 notify실행!
        group.notify(queue: .main) {
            print("=========END========")
            self.posterCollectionView.reloadData()
        }
    }
    
    // DispatchGroup() 첫 번째 구현! // 개선점 있음
    func dispatchGroupNotify() {
        // DispatchGroup()****
        let group = DispatchGroup()
        
        // 네트워크 통신과 같은 비동기 함수가 => 비동기 함수로 묶이게 되면 다른 스레드에서 일하게 되는 문제 발생
        DispatchQueue.global().async(group: group) {
            self.callRecommendation(id: 671) { data in
                // 네트워킹한 데이터 저장~***
                self.firstList = data
                print("===1")
            }
        }

        DispatchQueue.global().async(group: group) {
            self.callRecommendation(id: 672) { data in
                // 네트워킹한 데이터 저장~***
                self.secondList = data
                print("===2")
            }
        }
        
        DispatchQueue.global().async(group: group) {
            self.callRecommendation(id: 673) { data in
                // 네트워킹한 데이터 저장~***
                self.thirdList = data
                print("===3")
            }
        }
        
        
        DispatchQueue.global().async(group: group) {
            self.callRecommendation(id: 674) { data in
                // 네트워킹한 데이터 저장~***
                self.fourthList = data
                print("===4")
            }
        }
        
        // notify는 동기 함수만 올바르게 처리가 가능함
        // 비동기 함수가 비동기 함수를 감싸면 안댐
        group.notify(queue: .main) {
            print("END")
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
            return fourthList.results.count
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
            let url = "https://image.tmdb.org/t/p/w500\(fourthList.results[indexPath.item].posterPath ?? "")"
            cell.posterImageView.kf.setImage(with: URL(string: url))
        }
        
        cell.posterImageView.backgroundColor = UIColor(red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: 1)
    
        return cell
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if kind == UICollectionView.elementKindSectionHeader {
            
            guard let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderPosterCollectionReusableView.identifier, for: indexPath) as? HeaderPosterCollectionReusableView else { return UICollectionReusableView() }
            
            view.titleLabel.text = "테스트 섹션"
            view.titleLabel.font = UIFont(name: "Yeongdeok-Sea", size: 24) // 커스텀 폰트 적용하기
            
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
        
        // HeaderPosterCollectionReusableView
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




