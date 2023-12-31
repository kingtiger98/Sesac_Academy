//
//  BookCollectionViewController.swift
//  BOOKWARM
//
//  Created by 황재하 on 7/31/23.
//

import UIKit
import RealmSwift

protocol PassDataDelegate{
        func newData()
}

final class BookCollectionViewController: UICollectionViewController {
        
    let repository = BookTableRepository()
    
    var movieInfo = MovieInfo()
    var searchMovieInfo = MovieInfo()
    
    let searchBar = UISearchBar()
    
    // Realm Read _ 실시간의 데이터가 반영되고 있음!
    let realm = try! Realm()
    
    // 3. Realm Read ***
    var tasks: Results<BookTable>!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 스키마 버전 체크
        repository.checkSchemaVersion()

        // byKeyPath기준 내림차순으로 정렬
        // tasks = realm.objects(BookTable.self).sorted(byKeyPath: "bookName", ascending: true)
        tasks = repository.fetch()
        
        // print(realm.configuration.fileURL)
        repository.fileURL()
        
        // print(tasks)
        
        // XIB로 컬렉션뷰셀 생성했으므로 Register 해준다. ***
        let nib = UINib(nibName: "BookCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "BookCollectionViewCell")
        
        // 컬렉션뷰 레이아웃 잡기
        setCollectionViewLayout()
        
        // 영화검색버튼
        configureSearchButton()
    }
    

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Realm에서 데이터를 매번 가져올 필요없이 UI의 업데이트만 신경쓰면 됨!
        collectionView.reloadData()
    }
    
    
    // 1. 섹션 안의 item 갯수 지정
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //return searchMovieInfo.searchMovieList.count
        return tasks.count
    }
    
    
    // 2. item 디자인 및 데이터 조작
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
//        let row: Movie = searchMovieInfo.searchMovieList[indexPath.row]
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BookCollectionViewCell.identifier, for: indexPath) as? BookCollectionViewCell else {
            print("다운캐스팅 실패")
            return UICollectionViewCell()
        }
        
        cell.movieNameLabel.textColor = .black
        cell.movieNameLabel.font = .boldSystemFont(ofSize: 14)
        cell.movieNameLabel.text = tasks[indexPath.row].bookName
        
        let url = URL(string:tasks[indexPath.row].image)
        cell.movieImageView.kf.setImage(with: url)
        
        cell.movieRateLabel.textColor = .black
        cell.movieRateLabel.text = tasks[indexPath.row].author
        // 셀 디자인 및 데이터 할당 함수
//        cell.configureCell(row: row)
        
        // 좋아요 토글 버튼 *** addTarget사용 ***
//        cell.likeButton.tag = indexPath.row
//        cell.likeButton.addTarget(self, action: #selector(likeButtonClicked), for: .touchUpInside)
//
//        if searchMovieInfo.searchMovieList[indexPath.row].favorite == true {
//            cell.likeButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
//        } else {
//            cell.likeButton.setImage(UIImage(systemName: "heart"), for: .normal)
//        }
        return cell
    }
     
    
    
    // 좋아요 토글 버튼 ***
    @objc func likeButtonClicked(_ sender: UIButton) {
        searchMovieInfo.searchMovieList[sender.tag].favorite.toggle()
        collectionView.reloadData()
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let vc = RealmDetailViewController()
        
        // 값 전달!
        vc.data = tasks[indexPath.row]
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    // 메인 화면 -> 상세 화면
    // 코드로 화면전환( Show : Push_Pop )구현 + 다음 뷰로 데이터 전달
//    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//
//        let row: Movie = searchMovieInfo.searchMovieList[indexPath.row]
//
//        // 1. 스토리보드 위치 확인
//        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
//        // 2. 스토리보드 내의 전환 될 뷰 확인, 뷰의 요소들에 접근하기 위해 다운캐스팅
//        guard let viewController = storyBoard.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController else {
//            print("화면이동 다운캐스팅 실패")
//            return
//        }
//
//        // dismiss버튼 안보이게!
//        viewController.disMissButtonHiddenBool = true
//
//        // 3. Push
//        navigationController?.pushViewController(viewController, animated: true)
//
//        // 데이터 전달
//        viewController.configureDetail(row: row)
//    }

    // 메인 화면 -> 검색 화면
    // 코드로 화면전환( Show : Push_Pop )구현 + 다음 뷰로 데이터 전달
    @IBAction func searchButtonClicked(_ sender: UIBarButtonItem) {
        // 1. 스토리보드 위치 확인
        let sb = UIStoryboard(name: "Main", bundle: nil)
        // 2. 스토리보드 내의 전환 될 뷰 확인, 뷰의 요소들에 접근하기 위해 다운캐스팅
        guard let vc = sb.instantiateViewController(withIdentifier: "SearchViewController") as? SearchViewController else {
            print("검색버튼 다운캐스팅 실패")
            return
        }
        vc.navigationItem.title = "검색 화면"
        navigationController?.pushViewController(vc, animated: true)
    }

    
    // 컬렉션뷰 레이아웃 조정
    func setCollectionViewLayout() {
        // 1.
        let layout = UICollectionViewFlowLayout()
        
        // 2.
        let spacing: CGFloat = 10
        let width = UIScreen.main.bounds.width - (spacing * 3)
        
        // 3.
        layout.itemSize = CGSize(width: width / 2, height: width / 2) // item의 가로, 세로 길이 지정
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing) // 섹션의 상하좌우 여백 조정
        layout.minimumLineSpacing = spacing // item간 간격 지정
        layout.minimumInteritemSpacing = spacing // item간 간격 지정
        
        // 4. 컬렉션뷰에 레이아웃 적용
        collectionView.collectionViewLayout = layout
    }
    
    
    // 네비게이션바 TitleView_ 영화 검색 버튼
    func configureSearchButton() {
        searchBar.delegate = self
        searchBar.placeholder = "영화를 검색해보세요."
        searchBar.showsCancelButton = true
        navigationItem.titleView = searchBar
        
        // 뒤로가기버튼 텍스트
        navigationItem.backButtonTitle = ""
    }
    
}

extension BookCollectionViewController: UISearchBarDelegate {

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        searchMovieInfo.searchMovieList.removeAll()

        for movie in 0...movieInfo.movie.count - 1{
            if movieInfo.movie[movie].title.contains(searchBar.text!) {
                searchMovieInfo.searchMovieList.append(movieInfo.movie[movie])
                print(searchMovieInfo.searchMovieList)
            }
        }
        collectionView.reloadData()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        searchMovieInfo.searchMovieList.removeAll()
        
        for movie in 0...movieInfo.movie.count - 1{
            if movieInfo.movie[movie].title.contains(searchBar.text!) {
                searchMovieInfo.searchMovieList.append(movieInfo.movie[movie])
                print(searchMovieInfo.searchMovieList)
            }
        }
        collectionView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchMovieInfo.searchMovieList.removeAll()
        searchBar.text = ""
        collectionView.reloadData()
    }

    

    
    
}

