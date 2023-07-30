//
//  CustomTableViewController.swift
//  SeSACWeek3
//
//  Created by 황재하 on 7/28/23.
//

import UIKit





class CustomTableViewController: UITableViewController {
    
    let toDo = ToDoInformation()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = 80

    }

    // 1.
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return toDo.list.count
    }
    
    // 2.
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ToDo.identifier, for: indexPath) as? CustomTableViewCell else { return UITableViewCell() }

        let row = toDo.list[indexPath.row]

        // ***
        cell.configureCell(row: row)
        
        cell.backView.layer.cornerRadius = 10

        return cell
    }
    
    // 3. 셀 선택
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath)
    }


}
