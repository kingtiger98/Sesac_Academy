//
//  SearchViewController.swift
//  BOOKWARM
//
//  Created by 황재하 on 7/31/23.
//

import UIKit
import SnapKit
import Kingfisher
import RealmSwift

final class SearchViewController: UIViewController {
    
    let repository = BookTableRepository()
    
    var bookinfo = Welcome(documents: [])
    
    let searchBar = UISearchBar()

    let kakaoTableView = {
        let view = UITableView()
        view.register(SearchTableViewCell.self, forCellReuseIdentifier: "SearchTableViewCell")
        view.backgroundColor = .systemGray6
        view.rowHeight = 150
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "완료", style: .plain, target: self, action: #selector(bookSearchButtonClicked))
    
        setConfigure()
        setConstraints()
        
    }
    
    @objc func bookSearchButtonClicked(){
        kakaoAPIManager.shared.callKakaoRequset(query: searchBar.text!) { data in
            print(data)
            self.bookinfo = data
            self.kakaoTableView.reloadData()
        }
    }
    
    func setConfigure() {
        
        searchBar.delegate = self
        searchBar.placeholder = "도서를 검색해보세요."
        searchBar.showsCancelButton = true
        navigationItem.titleView = searchBar
        
        kakaoTableView.delegate = self
        kakaoTableView.dataSource = self
        
        view.addSubview(kakaoTableView)
    }
    
    func setConstraints() {
        
        kakaoTableView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }

    }
    
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bookinfo.documents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SearchTableViewCell", for: indexPath) as? SearchTableViewCell else { return UITableViewCell() }
        
        let url = URL(string:bookinfo.documents[indexPath.row].thumbnail)
        cell.bookImage.kf.setImage(with: url)
        
        cell.bookTitleLabel.text = "제목 : " + bookinfo.documents[indexPath.row].title
        cell.bookAuthorLabel.text = "저자 : " + bookinfo.documents[indexPath.row].authors[0]
        cell.bookPriceLabel.text = "가격 : " + String(describing: bookinfo.documents[indexPath.row].price) + "원"

        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // a. realm의 위치 탐색
        // let realm = try! Realm()
        
        // b. 테이블에 값 추가할 task 상수 생성
        let task = BookTable(
            bookName: bookinfo.documents[indexPath.row].title,
            author: bookinfo.documents[indexPath.row].authors[0],
            price: String(describing: bookinfo.documents[indexPath.row].price),
            image: bookinfo.documents[indexPath.row].thumbnail,
            memo: "메모를 입력해주세요"
        )
        
        // c. realm에 task 추가
        // transaction 단위로 작업 수행*
//        try! realm.write{
//            realm.add(task)
//            print("Realm Add Succeed")
//        }
        repository.createItem(task)
        
        
        // d. Document 파일에 이미지 저장*** 존나 중요함
        let image = bookinfo.documents[indexPath.row].thumbnail
        
        DispatchQueue.global().async {
            if let url = URL(string: image), let data = try? Data(contentsOf: url ) {
                
                if data != nil {
                    print("===== Document 파일에 이미지 저장")
                    DispatchQueue.main.async{
                        self.saveImageToDoDocument(fileName: "hwang_\(task._id).jpg", image: UIImage(data: data)!)
                    }
                }
                
            }
        }
        
        navigationController?.popViewController(animated: true)
    }
    
    
}


extension SearchViewController: UISearchBarDelegate{
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        bookinfo = Welcome(documents: [])
        searchBar.text = ""
        kakaoTableView.reloadData()
    }
    
}
