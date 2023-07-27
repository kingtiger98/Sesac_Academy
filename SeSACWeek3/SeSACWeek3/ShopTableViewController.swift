//
//  ShopTableViewController.swift
//  SeSACWeek3
//
//  Created by 황재하 on 7/27/23.
//

import UIKit

class ShopTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var shopTable: UITableView!
    
    @IBOutlet weak var addTextField: UITextField!
    
    @IBOutlet weak var addWantListButton: UIButton!
    
    var addLists = ["그립톡 구매", "사이다 구매", "아이패드 케이스 최저가 알아보기", "양말"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        shopTable.dataSource = self
        shopTable.delegate = self
        
        shopTable.rowHeight = 70
    }


    
    @IBAction func addWantListButtonClicked(_ sender: UIButton) {
        guard let addItme = addTextField.text else {
            print("추가버튼오류")
            return
        }
        
        if addItme == "" {
            showAlert()
        } else {
            addLists.append("\(addItme)")
            print(addLists)
            
            shopTable.reloadData()
        }
    }
    
    
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return addLists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "shopCell", for: indexPath) as? ShopTableViewCell else {
            print("다운캐스팅 실패")
            return UITableViewCell()
        }
        
        cell.shoppingList.text = "\(addLists[indexPath.row])"
        cell.shoppingList.font = .systemFont(ofSize: 15)
        
        return cell
    }

    


}
