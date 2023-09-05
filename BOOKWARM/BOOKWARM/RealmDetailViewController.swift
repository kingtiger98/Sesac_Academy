//
//  RealmDetailViewController.swift
//  BOOKWARM
//
//  Created by 황재하 on 9/5/23.
//

import UIKit
import SnapKit
import RealmSwift

class RealmDetailViewController: UIViewController{
    
    var data: BookTable?
    
    let realm = try! Realm()
    
    let memoTextView = {
        let view = UITextView()
        view.font = .boldSystemFont(ofSize: 16)
        view.backgroundColor = .systemGray6
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        memoTextView.text = data?.memo
        
        // navigationItem.rightBarButtonItem = UIBarButtonItem(title: "수정", style: .plain, target: self, action: #selector(editButtonClicked))
        navigationItem.rightBarButtonItems = [UIBarButtonItem(title: "수정", style: .plain, target: self, action: #selector(editButtonClicked)),
                                              UIBarButtonItem(title: "삭제", style: .plain, target: self, action: #selector(deleteButtonClicked))]
        view.backgroundColor = .white
        
        view.addSubview(memoTextView)
        memoTextView.snp.makeConstraints { make in
            make.width.equalTo(300)
            make.height.equalTo(500)
            make.center.equalTo(view)
        }

        
    }
    
    @objc func editButtonClicked(){
        
        guard let data = data else { return }
        // name, author, price, image
        let item = BookTable(value: ["_id": data._id,"name": data.name,"author": data.author,"price": data.image, "image": data.price ,"memo": memoTextView.text!])
        
        do {
            try realm.write {
                realm.add(item, update: .modified)
            }
            
        } catch {
            print("error")
        }
        
        navigationController?.popViewController(animated: true)
    }
    
    
    @objc func deleteButtonClicked(){
                //Realm Delete ***
                guard let data = data else { return }

                // 도큐먼트에서 이미지 삭제하기
                 removeImageFromDocument(fileName: "hwang_\(data._id).jpg")
        
                try! realm.write {
                    realm.delete(data)
                }
        
        navigationController?.popViewController(animated: true)
    }
    
    
}
