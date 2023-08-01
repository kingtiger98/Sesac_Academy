//
//  CustomTableViewController.swift
//  SeSACWeek3
//
//  Created by 황재하 on 7/28/23.
//

import UIKit

class CustomTableViewController: UITableViewController {
    
    var toDo = ToDoInformation() {
        didSet { // 변수가 달라짐을 감시!!!
            print("didSet 편하다")
            tableView.reloadData()
        }
    }
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = 80

        // 데이터 추가하기 ***
        searchBar.placeholder = "할 일을 입력해주세요!"
        searchBar.searchTextField.addTarget(self, action: #selector(searchBarReturnTapped), for: .editingDidEndOnExit)
        
    }
    
    @objc func searchBarReturnTapped() {
        
        // ToDo항목을 추가하고
        let data = ToDo(main: searchBar.text!, sub: "23.08.01", like: false, done: false)
        
        // list에 추가
        toDo.list.append(data)
        
        // UX
        searchBar.text = ""
        
        // 테이블 뷰 갱신
        //tableView.reloadData()
        
    }

    // 1.
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return toDo.list.count
    }
    
    // 2.
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "customTableViewCell", for: indexPath) as? CustomTableViewCell else { return UITableViewCell() }

        let row = toDo.list[indexPath.row]

        // ***
        cell.configureCell(row: row)
        
        cell.backView.layer.cornerRadius = 10

        
        // 별버튼 값 바꾸기
        cell.likeButton.tag = indexPath.row
        cell.likeButton.addTarget(self, action: #selector(likeButtonClicked), for: .touchUpInside)
        
        
        return cell
    }
    
    // 별버튼 값 바꾸기 ****
    @objc func likeButtonClicked(_ sender: UIButton) {
        print("버튼 태그값 : \(sender.tag)")
        
        toDo.list[sender.tag].like.toggle()
        //tableView.reloadData()
        
    }
    
    
    
    // 3. 셀 선택
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath)
    }


    // 삭제
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        toDo.list.remove(at: indexPath.row)
        
        // 제거 -> 갱신
        //tableView.reloadData()
    }
    
}
