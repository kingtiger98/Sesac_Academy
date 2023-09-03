//
//  ProfileViewController.swift
//  TMDBCodeBase
//
//  Created by 황재하 on 8/30/23.
//

import UIKit


enum Profile: CaseIterable {
    
    case name
    case nickName
    case gender
    
    var key: String {
        switch self {
        case .name:
            return "이름"
        case .nickName:
            return "사용자 이름"
        case .gender:
            return "성별 대명사"
        }
    }
    
    var value: String {
        get {
            switch self {
            case .name:
                return "이름"
            case .nickName:
                return "사용자 이름"
            case .gender:
                return "성별 대명사"
            }
        }
        set(newValue) {
            switch self {
            case .name:
                
                self = .name
            case .nickName:
                self = .nickName
            case .gender:
                self = .gender
            }
        }
    }
}

class ProfileViewController: BaseViewController{
    
    let mainView = ProfileView()
    
    var profileValue: String = "새이름와야지" // 초기값 설정
    
    override func loadView() {
        self.view = mainView
    }
    
    deinit {
        print(#function)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(#function)
        
        // 1_1. addObserve : notification 관찰 시작
        NotificationCenter.default.addObserver(self, selector: #selector(profileValueNotificationObserve), name: .setProfileValue, object: nil)
        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("====", #function)
        
    }
    
    // notification으로 역전달 받은 값 활용하는 함수  여기가 안되는 중!!!!!!
    @objc func profileValueNotificationObserve(notification: NSNotification){
        print("값 쓰는 곳")
        
        if let value = notification.userInfo?["profileValue"] as? String {
            // 프로필 데이터 업데이트
            profileValue = value
            
            // 테이블뷰 리로드
            mainView.profileTableView.reloadData()
        }
        
    }
    
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print(#function)
        // notification : Notification이 중복으로 실해되지 않게 뷰가 사라지면 Notification삭제
        NotificationCenter.default.removeObserver(self, name: Notification.Name("setValue"), object: nil)
    }
    
    
    
    override func setConfigure() {
        super.setConfigure()
        
        mainView.profileTableView.dataSource = self
        mainView.profileTableView.delegate = self
        
        setNavigationItem()
    }
    
    override func setConstraints() {
        super.setConstraints()
    }
    
    func setNavigationItem() {
        navigationItem.title = "Profile"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "완료", style: .plain, target: self, action: #selector(popView))
        navigationItem.titleView?.tintColor = .black
        navigationItem.rightBarButtonItem?.tintColor = .black
    }
    
    @objc func popView(){
        navigationController?.popViewController(animated: true)
    }
    
}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return Profile.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let row = Profile.allCases[indexPath.row]
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileTableViewCell", for: indexPath) as? ProfileTableViewCell else {
            return UITableViewCell()
        }
        
        cell.firstLabel1.text = row.key
        cell.firstLabel2.text = profileValue // row.value
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = ProfileEditViewController()
        
        vc.receviedContents = Profile.allCases[indexPath.row].value
        
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
}



