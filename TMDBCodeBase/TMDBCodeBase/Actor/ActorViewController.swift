//
//  ActorViewController.swift
//  TMDBCodeBase
//
//  Created by 황재하 on 8/28/23.
//

import UIKit

class ActorViewController: BaseViewController {

    let mainView = ActorView()

    override func loadView() {
        self.view = mainView
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MovieViewController에서 전달받은 값 ActorViewController에 셋팅해주는 함수 호출 해야대! ****
        mainView.setData()
        
        mainView.actorTableView.delegate = self
        mainView.actorTableView.dataSource = self
        
    }
    
    override func setConfigure() {
        super.setConfigure()
    }
    
    override func setConstraints() {
        super.setConstraints()
    }

}


extension ActorViewController: UITableViewDelegate, UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ActorTableViewCell.identifier, for: indexPath) as? ActorTableViewCell else {
            return UITableViewCell()
        }
        
        
        
        return cell
    }
    
    
}





