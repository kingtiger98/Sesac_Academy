//
//  HomeViewController.swift
//  PhotoGramRealm
//
//  Created by jack on 2023/09/03.
//

import UIKit
import SnapKit
import RealmSwift

class HomeViewController: BaseViewController {
    
    // Realm Read _ 실시간의 데이터가 반영되고 있음!
    // let realm = try! Realm()
    
    lazy var tableView: UITableView = {
        let view = UITableView()
        view.backgroundColor = .black
        view.rowHeight = 100
        view.delegate = self
        view.dataSource = self
        view.register(PhotoListTableViewCell.self, forCellReuseIdentifier: PhotoListTableViewCell.identifier)
        return view
    }()
    
    // 3. Realm Read ***
    var tasks: Results<DiaryTable>!
    
    // 1. DiaryTableRepository
    let repository = DiaryTableRepository()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(documentDirectoryPath())
        
        // byKeyPath기준 오름차순으로 정렬
        // tasks = realm.objects(DiaryTable.self).sorted(byKeyPath: "diaryTitle", ascending: true)
        
        // 2. DiaryTableRepository
        tasks = repository.fetch()
        
        // 파일위치 확인하기
        // print(realm.configuration.fileURL)
        
        
        // 스키마 버전 확인!
        repository.checkSchemaVersion()
        
        print(tasks)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        // 데이터를 매번 가져올 필요없이 UI의 업데이트만 신경쓰면 됨!
        tableView.reloadData()
    }
    
    
    override func configure() {
        view.addSubview(tableView)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(plusButtonClicked))
        
        let sortButton = UIBarButtonItem(title: "정렬", style: .plain, target: self, action: #selector(sortButtonClicked))
        let filterButton = UIBarButtonItem(title: "필터", style: .plain, target: self, action: #selector(filterButtonClicked))
        let backupButton = UIBarButtonItem(title: "백업", style: .plain, target: self, action: #selector(backupButtonClicked))
        navigationItem.leftBarButtonItems = [sortButton, filterButton, backupButton]
    }
    
    override func setConstraints() {
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    @objc func plusButtonClicked() {
        navigationController?.pushViewController(AddViewController(), animated: true)
    }
    
    @objc func backupButtonClicked() {
        navigationController?.pushViewController(BackupViewController(), animated: true)
    }
    
    
    @objc func sortButtonClicked() {
        
    }
    
    // 필터 기능 _ 제목 기준
    @objc func filterButtonClicked() {
        
        // 2. DiaryTableRepository
        tasks = repository.fetchFilter()
        tableView.reloadData()
        
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PhotoListTableViewCell.identifier) as? PhotoListTableViewCell else { return UITableViewCell() }
        
        let data = tasks[indexPath.row]
        
        cell.titleLabel.text = data.diaryTitle
        cell.contentLabel.text = data.contents
        cell.dateLabel.text = "\(data.diaryDate)"
        // Document에 저장된 이미지 가져와서 사용
        cell.diaryImageView.image = loadImageFromDocument(fileName: "hwang_\(data._id).jpg")
        
//        // Realm데이터로 이미지 띄우기***
//        let urlValue = URL(string: data.diaryPhoto ?? "" )
//        // String -> URL -> Data -> UIImage
//        // 1. 셀에서 서버 통신이 일어나는 중 _ 작은 데이터 일 땐 셀에서 서버통신 가능함(용량이 크면 오래걸리고 좀 그래)
//        // 2. 이미지를 미리 UIImage 형식으로 반환하고, 셀에서 UIImage를 바로 보여주자
//        //  => 2_1. 재사용 메커니즘을 효율적으로 사용하지 못한 수도 있고, UIIamge 배열 구성 자체가 오래 걸릴 수 있다 고로 잘 사용안해
//        // 3. 도큐먼트에 .jpg 저장 // 보통_많이 사용, Date형식으로 변환햐서 Default.realm에 저장 // 쉬움
//        DispatchQueue.global().async {
//            if let url = urlValue, let data = try? Data(contentsOf: url) {
//                DispatchQueue.main.async {
//                    cell.diaryImageView.image = UIImage(data: data)
//                }
//            }
//        }

        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = DetailViewController()
        
        // 값 전달!
        vc.data = tasks[indexPath.row]
        
       
        navigationController?.pushViewController(vc, animated: true)

        
//        //Realm Delete ***
//        let data = tasks[indexPath.row]
//
//        // 도큐먼트에서 이미지 삭제하기
//        removeImageFromDocument(fileName: "hwang_\(data._id).jpg")
//
//        try! realm.write {
//            realm.delete(data)
//        }
//
//        tableView.reloadData()
        
        
    }
    
    
    // 리딩 스와이프 or 트레일링 스와이프
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let like = UIContextualAction(style: .normal, title: nil) { action, view, completionHandler in
            print("좋아요 선택됨")
        }
        
        like.backgroundColor = .orange
        like.image = tasks[indexPath.row].diaryLike ? UIImage(systemName: "star.fill") : UIImage(systemName: "star")
        
        let sample = UIContextualAction(style: .normal, title: "테스트") { action, view, completionHandler in
            print("테스트 선택됨")
        }
        
        sample.backgroundColor = .blue
        sample.image = UIImage(systemName: "pencil")
        
        return UISwipeActionsConfiguration(actions: [like, sample])
    }
    
    
    
}
