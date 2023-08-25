//
//  CustomTableViewController.swift
//  SeSAC3Week6
//
//  Created by 황재하 on 8/24/23.
//

import UIKit
import SnapKit

struct Sample{
    let text: String
    var isExpand: Bool
}

class CustomTableViewController: UIViewController {
    
    let iamgeView = {
        // 이미지뷰(UIImageView)는 하위에 프레임(UIImage)이 있어서 초기화 해줘야함
        let view = PosterImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        return view
    }()
    
    
    var list = [
        Sample(text: "샘플이무니다샘플이무니다샘플이무니다샘플이무니다샘플이무니다샘플이무니다샘플이무니다샘플이무니다샘플이무니다샘플이무니다샘플이무니다샘플이무니다샘플이무니다샘플이무니다샘플이무니다샘플이무니다샘플이무니다", isExpand: false),
                Sample(text: "샘플이무샘플이무니다샘플이무니다샘플이무니다샘플이무니다샘플이무니다니다샘플이무샘플이무니다샘플이무니다샘플이무니다샘플이무니다샘플이무니다니다", isExpand: false),
                Sample(text: "샘플이무니다", isExpand: false)
    ]
    
    
    
    // let_익명함수는 vc가 만들어지는 시점 보다 빨리 실행되서 self 키워드를 함수 내부에서 사용할 수 없다
    // lazy var_익명함수로 vc가 만들어지고 함수가 실행되게 시점을 미루어 줘야함
    lazy var tableView = {
        let view = UITableView()
        view.rowHeight = UITableView.automaticDimension // 1. 셀 내부 컨텐츠의 양에 맞게 높이를 줄거야***
        
        view.dataSource = self // 자기 자신의 인스턴스
        view.delegate = self
        view.register(CustomTableViewCell.self, forCellReuseIdentifier: "customCell")
        
        return view
    }()
    
    
    
    // var isExpand = false // false : 2, true : 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .lightGray
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(20)
        }
        
        view.addSubview(iamgeView)
        print("constraints")
        iamgeView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.size.equalTo(200)
        }
        
    }

}

extension CustomTableViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell") as! CustomTableViewCell
        cell.label.text = list[indexPath.row].text
        cell.label.numberOfLines = list[indexPath.row].isExpand ? 0 : 2 // 2. 줄이 컨텐츠에 맞게 여러줄로 나올 수 있도록!***
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        list[indexPath.row].isExpand.toggle()
        // tableView.reloadData()
        
        // IndexPath(row: 3, section: 0) <= 지정한 셀도 리로드 되게끔 할 수 있음
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
    
}
