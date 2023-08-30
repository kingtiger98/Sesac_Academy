//
//  ActorViewController.swift
//  TMDBCodeBase
//
//  Created by 황재하 on 8/28/23.
//

import UIKit

class ActorViewController: BaseViewController {

    let mainView = ActorView()
    
    var movieid = 0
    var actorinfo = CastData(id: 0, crew: [], cast: [])
    
    override func loadView() {
        self.view = mainView
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func setConfigure() {
        super.setConfigure()
        
        navigationItem.title = "Movie Info"
        
        // MovieViewController에서 전달받은 값 ActorViewController에 셋팅해주는 함수 호출 해야대! ****
        mainView.setData()
        
        mainView.actorTableView.delegate = self
        mainView.actorTableView.dataSource = self
        
        callRequestCastData(movieId: String(describing: movieid)) { data in
            self.actorinfo = data
            self.mainView.actorTableView.reloadData()
            print(self.actorinfo)
        }
    }
    
    override func setConstraints() {
        super.setConstraints()
        
    }

}

extension ActorViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return actorinfo.cast.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let row = actorinfo.cast[indexPath.row]
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ActorTableViewCell.identifier, for: indexPath) as? ActorTableViewCell else {
            return UITableViewCell()
        }
        
        cell.ConfigureActorTableViewCell(row: row)

        return cell
    }
    
}
