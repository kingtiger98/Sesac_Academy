//
//  SetTableViewController.swift
//  SeSACWeek3
//
//  Created by 황재하 on 7/27/23.
//

import UIKit

//let sectionList = ["전체 설정", "개인 설정", "기타"]


let allSetList = ["공지사항", "실험실", "버전 정보"]
let individualSetList = ["개인/보안", "알림", "채팅", "멀티프로필"]
let etcSetList = ["고객센터/도움말"]

var sectionNum: Int = 0

class SetTableViewController: UITableViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.backgroundColor = .black
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        
        if section == 0 {
            return allSetList.count
        } else if section == 1 {
            return individualSetList.count
        } else if section == 2 {
            return etcSetList.count
        } else {
            return 0
        }
        
 
    }
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "setCell") else {
            print("setCell오류")
            return UITableViewCell()
        }
        
        
        cell.backgroundColor = .black
        cell.textLabel?.textColor = .white
        cell.textLabel?.font = .systemFont(ofSize: 14)
        
        if indexPath.section == 0 {
            cell.textLabel?.text = "\(allSetList[indexPath.row])"
        } else if indexPath.section == 1 {
            cell.textLabel?.text = "\(individualSetList[indexPath.row])"
        } else if indexPath.section == 2 {
            cell.textLabel?.text = "\(etcSetList[indexPath.row])"
        }
        
        return cell
    }

 
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        if section == 0 {
            return "전체 설정"
        } else if section == 1 {
            return "개인 설정"
        } else if section == 2 {
            return "기타"
        } else {
            return "리턴이상해"
        }
        
    }

    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else{ return; }
         
        header.textLabel?.textColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1);
        header.textLabel?.font = .boldSystemFont(ofSize: 15)
    }
    

}
