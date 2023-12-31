//
//  SampleViewController.swift
//  UnsplashProject
//
//  Created by 황재하 on 9/12/23.
//

import UIKit

// Model
struct User: Hashable { // indexPath를 사용하지 않기 위해서, Hashable 값을 고유하게 유지하는 규칙을 부여
    
    let name: String
    let age: Int
    
    // 알아서 유니키한 스트링 데이터를 넣어줌
    let unique = UUID().uuidString // name, age가 같더라도 문제가 생기지 않음
    
    var introduce: String {
        return "\(name), \(age)살"
    }
    
}


// View, Controller
class SampleViewController: UIViewController{
    
    @IBOutlet weak var tableView: UITableView!
    
    let viewModel = SampleViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
            
        var number1 = 10
        var number2 = 3
        
        // print(number1 + number2)
        
        number1 = 3
        number2 = 1
        
        // Observable 인스턴스 생성 초기값 3, 1 부여
        var number3 = Observable(3)
        var number4 = Observable(1)

        // number.3의 값이 변경 되면 클로저 실행됨
        number3.bind { _ in
            print("Observable", number3.value - number4.value)
        }
        
        number3.value = 100
        number3.value = 500
        number3.value = 50
        number3.value = 20
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
}


extension SampleViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return viewModel.numberOfRowInSection
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
//        let cell = tableView.dequeueReusableCell(withIdentifier: "sampleCell")
//        let data = viewModel.cellForRowAt(at: indexPath)
//        cell?.textLabel?.text = data.introduce

        let cell = UITableViewCell()
        var content = cell.defaultContentConfiguration()
        
        content.text = "테스트" // textLabel
        content.secondaryText = "안녕하세요 \(indexPath.row)" // detailtextLabel
        
        cell.contentConfiguration = content // Protocol as Type
        
        return cell
    }
    
}

