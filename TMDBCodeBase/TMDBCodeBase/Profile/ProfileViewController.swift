//
//  ProfileViewController.swift
//  TMDBCodeBase
//
//  Created by 황재하 on 8/30/23.
//

import UIKit


enum Profile: CaseIterable{
    
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
    
    var value: String{
        switch self {
        case .name:
            return "이름"
        case .nickName:
            return "사용자 이름"
        case .gender:
            return "성별 대명사"
        }
    }
    
}




class ProfileViewController: BaseViewController{
    
    let mainView = ProfileView()
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(profileValueNotificationObserve), name: NSNotification.Name("ProfileNewValue"), object: nil)
        
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
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "완료", style: .plain, target: self, action: #selector(doneButtonClicked))
        navigationItem.titleView?.tintColor = .black
        navigationItem.rightBarButtonItem?.tintColor = .black
    }
    
    @objc func doneButtonClicked() {
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
        cell.firstLabel2.text = row.value

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = ProfileEditViewController()
        
        vc.receviedContents = Profile.allCases[indexPath.row].value
        
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
}
