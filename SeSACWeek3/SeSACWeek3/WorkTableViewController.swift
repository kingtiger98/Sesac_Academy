//
//  WorkTableViewController.swift
//  SeSACWeek3
//
//  Created by 황재하 on 7/27/23.
//

import UIKit

class WorkTableViewController: UITableViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else{ return; }
         
         header.textLabel?.textColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1);
         
    }

    override func tableView(_ tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int) {
        guard let footer = view as? UITableViewHeaderFooterView else{ return; }
         
        footer.textLabel?.textColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1);
    }

    

    }

    

