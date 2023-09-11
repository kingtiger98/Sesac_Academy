//
//  HomeViewController.swift
//  SeSAC3PhotoGramHJH
//
//  Created by 황재하 on 8/31/23.
//

import UIKit

// AnyObject*** : 클래스에서만 프로토콜을 정의할 수 있도록 제약
// 1. delegate 프로토콜 값 전달
protocol HomeViewProtocol: AnyObject {
    
    func didSelectItemAt(indexPath: IndexPath)

}



class HomeViewController: BaseViewController{
    
    let mainView = HomeView()
    
    var list: Photo = Photo(total: 0, total_pages: 0, results: [])
    
    override func loadView() {
        
        // let mainView = HomeView() // 이제 HomeView 내부의 인스턴스를 가져올 일이 없어서 로드뷰 안에 상수로 인스턴스 선언
        mainView.delegate = self // deinit이 호출되지 않는 문제 발생, 주석처리 하면 호출됨, 메모리에 인스턴스가 계속 쌓이는 문제 발생함(메모리 누수 발생)
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(self, #function)
        
        mainView.collectionView.delegate = self
        mainView.collectionView.dataSource = self
        
        APIService.shared.callRequest2(query: "sky") { photo in
            guard let photo = photo else {
                print("ALERT ERROR")
                return
            }
            print("API END")
            self.list = photo // 네트워크 전후로 데이터가 변경됨.
            
            self.mainView.collectionView.reloadData()
        }
        
    }
    
    deinit {
        print(self, #function)
    }
    
    override func setConstraints() {
        super.setConstraints()
    }
    
    override func configureView() {
        super.configureView()
    }
    
}


extension HomeViewController: HomeViewProtocol{
    
    func didSelectItemAt(indexPath: IndexPath) {
        print(indexPath)
        navigationController?.popViewController(animated: true)
    }
    
}


extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(#function)
        return list.results.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        print(#function)
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchCollectionViewCell", for: indexPath) as? SearchCollectionViewCell else
        { return UICollectionViewCell() }
        
        cell.imageView.backgroundColor = .systemBlue
        
        // kingfisher 덜어내고 이미지 띄우기 ***
        let thumb = list.results[indexPath.item].urls.thumb
        let url = URL(string: thumb) // 링크를 기반으로 이미지를 보여준다? >> 네트워크 통신임!!!
        
        DispatchQueue.global().async {
            let data = try! Data(contentsOf: url!) // 동기적으로 작동하고 있음 + 비동기 처리가 필요함
            
            DispatchQueue.main.async {
                cell.imageView.image = UIImage(data: data)
            }
        }
 
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(#function)
        
        // 3. delegate 프로토콜 값 전달 _ HomewView에서 사용했던 것
        // delegate?.didSelectItemAt(indexPath: indexPath)
        
    }
 
}
