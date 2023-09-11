//
//  DetailViewController.swift
//  PhotoGramRealm
//
//  Created by 황재하 on 9/5/23.
//

import UIKit
import SnapKit
import RealmSwift

class DetailViewController: BaseViewController{
    
    // 1. DiaryTableRepository
    let repository = DiaryTableRepository()
    
    var data: DiaryTable?
    
    let realm = try! Realm()
    
    let titleTextField: WriteTextField = {
        let view = WriteTextField()
        view.textColor = .white
        view.placeholder = "제목을 입력해주세요"
        return view
    }()

    let contentTextView: WriteTextField = {
        let view = WriteTextField()
        view.textColor = .white
        view.placeholder = "내용을 입력해주세요"
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(data?.Photo)
    }
    
    override func configure() {
        super.configure()
        view.addSubview(titleTextField)
        view.addSubview(contentTextView)
        
        
        guard let data = data else { return }
        
        titleTextField.text = data.diaryTitle
        contentTextView.text = data.contents
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "수정", style: .plain, target: self, action: #selector(editButtonClicked))

    }
    
    
    @objc func editButtonClicked(){
        
        guard let data = data else { return }
        
        let item = DiaryTable(value: ["_id": data._id, "diaryTitle":  titleTextField.text!, "diaryContents": contentTextView.text!])
        
        // Realm : Update*** _ 트랜잭션 : 작업을 수행하는 하나의 논리적인 단위
            // ACID특성 : db 트랜잭션이 안정하게 수행된다는 것을 보장하기 위한 성질을 가리키는 약어
                // Atomicity => All or Nothing _ 트랜잭션은 작업이 중간에 끝나지 않도록 한다 아예 완료 commit되거나 아예 철회된다 Rollback
                // Consistency => 트랜잭션이 성공하면 DB가 일관적인 상태를 유지한다.
                // Isolation => 트랜잭션 수행시 다른 트랜잭션이 접근하지 못한다.
                // Durability = > ㅎ한 번 수행된 트랜잭션은 영원히 적용된다.
        
//        do {
//            try realm.write {
//                // 특정 레코드의 값을 수정하려 할 떄 사용 .modified _ 외에도 방법 많아
//                // realm.add(item, update: .modified)
//
//                // 원하는 컬럼 값만 수정할 수도 있음!
//                realm.create(DiaryTable.self, value: ["_id": data._id, "diaryTitle":  titleTextField.text!, "diaryContents": contentTextView.text!], update: .modified)
//            }
//
//        } catch {
//            print("error")
//        }
        
        
        // 1. DiaryTableRepository
        repository.updateItem(id: data._id, title: titleTextField.text!, contents: contentTextView.text!)
        
        navigationController?.popViewController(animated: true)
        
    }
    
    
    override func setConstraints() {
        super.setConstraints()
        
        titleTextField.snp.makeConstraints { make in
            make.width.equalTo(300)
            make.height.equalTo(50)
            make.center.equalTo(view)
        }
        
        contentTextView.snp.makeConstraints { make in
            make.width.equalTo(300)
            make.height.equalTo(50)
            make.centerX.equalTo(view)
            make.centerY.equalTo(view).offset(60)
        }
        
    }
    
    
}
