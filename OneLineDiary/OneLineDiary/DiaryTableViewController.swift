//
//  DiaryTableViewController.swift
//  OneLineDiary
//
//  Created by 황재하 on 7/31/23.
//

import UIKit

class DiaryTableViewController: UITableViewController {
    
    
    var list = ["테스트1테스트1테스트1테스트1테스트1테스트1테스트1테스트1테스트1테스트1테스트1테스트1테스트1", "테스트2테스트2테스트2테스트2테스트2테스트2테스트2", "테스트3테스트3테스트3테스트3테스트3테스트3테스트3테스트3테스트3테스트3테스트3테스트3테스트3테스트3테스트3테스트3테스트3테스트3테스트3테스트3테스트3테스트3테스트3테스트3테스트3테스트3테스트3테스트3"]

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.backgroundColor = .clear
        
        setBackGroundColor()
        
        // XIB로 테이블뷰셀을 생성한 경우, 테이블뷰에 사용할 셀을 등록해주는 과정이 필요!
        let nib = UINib(nibName: "DiaryTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "DiaryTableViewCell")
        
        // Dynamic Height : 1. automaticDimension, 2. label.numberOfLines, 3. AutoLaylut(여백)
        // 텍스트의 양에 따라서 셀의 높이가 자동으로 달라짐, numberOfLines = 0 으로 설정해주어야함
        tableView.rowHeight = UITableView.automaticDimension
        
    }
    
    
    //
    @IBAction func searchBarButtonClicked(_ sender: UIBarButtonItem) {
        
        // 1. 스토리보드 파일 찾기
        let sb = UIStoryboard(name: "Main", bundle: nil)
        // 2. 스토리보드 파일 내의 뷰컨트롤러 찾기
        let vc = sb.instantiateViewController(identifier: "SearchCollectionViewController") as! SearchCollectionViewController
        // 3. 화면 전환 방식 설정
        vc.modalTransitionStyle = .coverVertical
        vc.modalPresentationStyle = .automatic
        // 4. 화면 띄우기
        present(vc, animated: true)
        
    }
    
    
    
    
    
    
    // Present방식 or Navigation 형태로 Presnet하기
    @IBAction func addBarButtonClicked(_ sender: UIBarButtonItem) {
        
        // 1. 스토리보드 파일 찾기
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        
        // 2. 스토리보드 파일 내 뷰컨트롤러 찾기
        let viewController = storyBoard.instantiateViewController(identifier: "AddViewController") as! AddViewController
        
        // 2_1(옵션). 네비게이션 컨트롤러가 있는 형태(제목바)로 Present 하고 싶은 경우!
        // nav를 사용한다면, present와 화면 전환 방식도 nav로 수정 해주어야 함!!
        let nav = UINavigationController(rootViewController: viewController)
        
        // 3. 화면 전환 방식 설정
        // viewController.modalTransitionStyle = .crossDissolve // 모달 애니메이션
        // viewController.modalPresentationStyle = .fullScreen // 모달 방식
        
        nav.modalPresentationStyle = .fullScreen
        
        
        // 4. 화면 띄우기
        // present(viewController, animated: true)
        
        present(nav, animated: true)

    }
    
    // Push방식 사용 : Navigation이 인터베이스에 임베드 되어 있어야 사용 가능!
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // DetailViewController(UIViewController) 생성해서 Push 해보기!
        // 1. 스토리보드 파일 찾기
        let sb = UIStoryboard(name: "Main", bundle: nil)
        // 2. 스토리보드 파일 내 뷰컨트롤러 찾기
        let vc = sb.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        
        // Pass Data 2. 다음 뷰의 데이터를 받을 공간(프로퍼티)에 데이터 전달
        // vc.contents = "Diary 뷰컨트롤러에서 데이터 전달하면서 화면 전환 하기!!!"
        vc.contents = list[indexPath.row] // 누른 셀의 데이터 전달하기***
        
        // vc.contentsLabel.text = list[indexPath.row] // 값 전달 시 아웃렛 활용은 불가능함, contentsLabel이 만들어 지는 것보다 더 빨리 값을 전달하기 떄문임
        
        // 인터페이스 빌더에 네이베게이션 컨트롤러가 임베드 되어 있어야만 push가 작동합니다!
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "DiaryTableViewCell") as? DiaryTableViewCell  else {
            print("nil이나 다운캐스팅 실패")
            return UITableViewCell()
        }
        
        // DynamicHeight
        // tableView.rowHeight = UITableView.automaticDimension을 적용하려면 아래코드 필수
        cell.contentLable.numberOfLines = 0
        
        cell.contentLable.text = list[indexPath.row]
        
        cell.backgroundColor = .clear
        
        
        
        
        return cell
    }

    
    
    
    
    // 1. System Delete
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    // 2. System Delete
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        list.remove(at: indexPath.row)
        print(list)

        // list의 데이터와 뷰의 상태를 맞춰줘야함
        tableView.reloadData()
    }
    
    
    
//    // Custom Swipe
//    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
//
//        //UISwipeActionsConfiguration(actions: <#T##[UIContextualAction]#>)
//    }
//
//    // Custom Swipe
//    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
//
//    }
    
    
    
    
    
    
    
}
