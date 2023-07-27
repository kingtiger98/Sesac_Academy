//
//  StudyTableViewController.swift
//  SeSACWeek3
//
//  Created by 황재하 on 7/27/23.
//

import UIKit

class StudyTableViewController: UITableViewController {
    
    let studyList = ["변수", "상수", "함수", "클래스", "구조채", "열거형", "아웃렛변수", "액션함수", "오토레이아웃"]
    let appleList = ["아이폰", "아이패드", "애플워치", "맥북", "아이맥"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 모든 셀이 같은 높이라면 heightForRowAt메서드 보다 이게 효율적임!
        tableView.rowHeight = 60
    }
    
    // 섹션 갯수
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 2
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        
        return section == 0 ? "first section" : "second section" // ***
    }

    // 셀 갯수 (필수)
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? studyList.count : appleList.count // ***
    }
    
    // 셀 스타일 및 데이터 지정 (필수)
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // identifier에 맞는 셀이 없을 수 있기 때문에 옵셔널로 반환을 해줌 => 언래핑이 필요!
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "todoCell") else { return UITableViewCell() }
        
        if indexPath.section == 0 { // ***
            cell.textLabel?.text = (studyList[indexPath.row])
        } else {
            cell.textLabel?.text = (appleList[indexPath.row])
        }
        
        
        return cell
    }
    
//    // 셀 높이 지정 : 서비스 구현에 따라 필요한 경우가 많지만, 항상 같은 높이를 셀에서 사용한다면 비효율적일 수 있음!
//    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            
//    }
    
    
}
