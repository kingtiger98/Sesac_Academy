//
//  ToDoViewController.swift
//  PhotoGramRealm
//
//  Created by 황재하 on 9/8/23.
//

import UIKit
import RealmSwift
import SnapKit

class ToDoViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource{

    let realm = try! Realm()
    
    let tableView = UITableView()
    
    var list: Results<DetailTable>!
    // var list: Results<ToDoTable>!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
//        let data = ToDoTable(title: "영화보기", favorite: false)
//
//        let memo = Memo()
//        memo.content = "주말에 팝콘 먹으면서 영화 보기"
//        memo.date = Date()
//
//        data.memo = memo
//
//        try! realm.write {
//            realm.add(data)
//        }
        
        
        
        
//        let data = ToDoTable(title: "장보기", favorite: true)
//
//        let detail1 = DetailTable(detail: "양파", deadline: Date())
//        let detail2 = DetailTable(detail: "사과", deadline: Date())
//        let detail3 = DetailTable(detail: "고구마", deadline: Date())
//
//        data.detail.append(detail1)
//        data.detail.append(detail2)
//        data.detail.append(detail3)
//
//
//        try! realm.write{
//            realm.add(data)
//        }
        
        
        view.backgroundColor = .white
        
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 40
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "toDoCell")

        tableView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }

        
        list = realm.objects(DetailTable.self) // list = realm.objects(ToDoTable.self)
        
        print(realm.configuration.fileURL!)
        print(realm.objects(ToDoTable.self))
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "toDoCell")!
        // cell.textLabel?.text = "\(list[indexPath.row].title): \(list[indexPath.row].detail.count)개 \(list[indexPath.row].memo?.content ?? "메모가 없습니다.")"
        
        let data = list[indexPath.row]
        
        cell.textLabel?.text = "\(data.detail) in \(data.mainToDo.first?.title ?? "")" // 역관계 띄워보기
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//        let data = list[indexPath.row]
//
//        try! realm.write{
//            realm.delete(data.detail) // 디테일을 먼저 지워주어야 함 순서 중요!!!!****
//            realm.delete(data)
//        }
//
//        tableView.reloadData()
        
    }

    
    func createTodo(){
        for i in ["장보기", "영화보기", "리캡하기", "좋아요 구현하기", "잠자기"] {
            
            let data = ToDoTable(title: i, favorite: false)
            
            do{
                try realm.write {
                    realm.add(data)
                }
            } catch {
                print(error)
            }
        }
    }
    

    func createDetail(){
                
        // realm에서 ToDoTable찾고 타이틀이 장보기인 것들중 _ 첫번째 장보기를 필터링함
        let main = realm.objects(ToDoTable.self).where {
            $0.title == "장보기"
        }.first!
        
        for i in 1...10{
            
            let detailTodo = DetailTable(detail: "장보기 세부 할일 \(i)", deadline: Date() )
            
            do{
                try realm.write {
                    // realm.add(detailTodo)
                    main.detail.append(detailTodo)
                }
            } catch {
                print(error)
            }
            
        }
        
    }

    
}
