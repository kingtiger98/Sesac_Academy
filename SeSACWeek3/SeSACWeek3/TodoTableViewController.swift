//
//  TodoTableViewController.swift
//  SeSACWeek3
//
//  Created by 황재하 on 7/27/23.
//

import UIKit

class TodoTableViewController: UITableViewController {

    
    var toDoList = ["장보기", "영화보기", "낮잠자기", "코드보기", "서핑하기", "운동하기", "게임하기"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    @IBAction func addButtonClicked(_ sender: UIBarButtonItem) {
        
        // extenstion을 사용해 만든 메서드를 가져옴!
        showAlert()
        
        // 1. list에 요소 추가
        toDoList.append("고래밥 먹기")
        print(toDoList)
        
        // 2. 테이블뷰 새로고침! _ 테이블뷰 갱신해줌 리스트가 추가된다거나 하면
        tableView.reloadData() // ***
    }
    

    // MARK: - Table view data source

    // Row 갯수 지정 : 필수!!! : 카톡 친구 수만큼 셀 갯수가 필요해라고 iOS에 전달
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoList.count
    }

    // Cell 디자인 및 데이터 처리 메서드 : 필수!!!
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        print(#function, indexPath)
        
        // Identifier는 인터페이스 빌더에서 설정!!! : 재사용 메커니즘
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "myCell") else {
            print("identifier 오류")
            return UITableViewCell()
        }
        
        cell.backgroundColor = indexPath.row % 2 == 0 ? .lightGray : .white
        
        cell.textLabel?.text = toDoList[indexPath.row]
        
//        cell.textLabel?.textColor = .red
//        cell.textLabel?.font = .boldSystemFont(ofSize: 20)
        cell.textLabel?.confiureTitleText() // extension으로 만든 메서드를 가져와 위의 2줄(주석된) 을 한 줄로 줄인 것
        
        cell.detailTextLabel?.text = "디테일 텍스트"
        cell.detailTextLabel?.textColor = .blue
        cell.detailTextLabel?.font = .boldSystemFont(ofSize: 15)
        
        cell.imageView?.image = UIImage(systemName: "star.fill")
        
        return cell
    }
    
    // Row의 Height 지정 : 필수!!!
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 70
    }
    
    // Section 갯수 지정
    override func numberOfSections(in tableView: UITableView) -> Int {

        return 1
    }

}
