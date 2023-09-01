//
//  HomeViewController.swift
//  SeSAC3PhotoGramHJH
//
//  Created by 황재하 on 8/31/23.
//

import UIKit

// AnyObject*** : 클래스에서만 프로토콜을 정의할 수 있도록 제약
protocol HomeViewProtocol: AnyObject {
    
    func didSelectItemAt(indexPath: IndexPath)

}

class HomeViewController: BaseViewController{
    
    
    override func loadView() {
        
        let mainView = HomeView() // 이제 HomeView 내부의 인스턴스를 가져올 일이 없어서 로드뷰 안에 상수로 인스턴스 선언
        
        mainView.delegate = self // deinit이 호출되지 않는 문제 발생, 주석처리 하면 호출됨, 메모리에 인스턴스가 계속 쌓이는 문제 발생함(메모리 누수 발생)
        
        self.view = mainView
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(self, #function)
        
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
