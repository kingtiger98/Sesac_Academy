//
//  BookCollectionViewController.swift
//  BOOKWARM
//
//  Created by 황재하 on 7/31/23.
//

import UIKit

class BookCollectionViewController: UICollectionViewController {
        
    var movieInfo = MovieInfo()
    var searchMovieInfo = MovieInfo()
    
    let searchBar = UISearchBar()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        searchBar.delegate = self
        searchBar.placeholder = "영화를 검색해보세요."
        searchBar.showsCancelButton = true
        navigationItem.titleView = searchBar
        
        
        
        
        
        // XIB로 컬렉션뷰셀 생성했으므로 Register 해준다. ***
        let nib = UINib(nibName: "BookCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "BookCollectionViewCell")
        
        // 컬렉션뷰 레이아웃 잡기
        setCollectionViewLayout()
        
        navigationItem.backButtonTitle = ""
        
    }

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
    
    // 1. 섹션 안의 item 갯수 지정
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return searchMovieInfo.searchMovieList.count
    }
    
    // 2. item 디자인 및 데이터 조작
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let row: Movie = searchMovieInfo.searchMovieList[indexPath.row]
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BookCollectionViewCell.identifier, for: indexPath) as? BookCollectionViewCell else {
            print("다운캐스팅 실패")
            return UICollectionViewCell()
        }
        
        cell.configureCell(row: row)
        
        // 좋아요 토글 버튼 *** addTarget사용 ***
        cell.likeButton.tag = indexPath.row
        cell.likeButton.addTarget(self, action: #selector(likeButtonClicked), for: .touchUpInside)
        
        if searchMovieInfo.searchMovieList[indexPath.row].favorite == true {
            cell.likeButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        } else {
            cell.likeButton.setImage(UIImage(systemName: "heart"), for: .normal)
        }
        return cell
    }
    
    // 좋아요 토글 버튼 ***
    @objc func likeButtonClicked(_ sender: UIButton) {
        searchMovieInfo.searchMovieList[sender.tag].favorite.toggle()
        collectionView.reloadData()
    }
    
    
    // 코드로 화면전환( Show : Push_Pop )구현 + 다음 뷰로 데이터 전달
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let row: Movie = searchMovieInfo.searchMovieList[indexPath.row]
        
        // 1. 스토리보드 위치 확인
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        // 2. 스토리보드 내의 전환 될 뷰 확인, 뷰의 요소들에 접근하기 위해 다운캐스팅
        guard let viewController = storyBoard.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController else {
            print("화면이동 다운캐스팅 실패")
            return
        }
        
        // dismiss버튼 안보이게!
        viewController.disMissButtonHiddenBool = true
        
        // 3. Push
        navigationController?.pushViewController(viewController, animated: true)
        
        // 데이터 전달
        viewController.configureDetail(row: row)
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

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchMovieInfo.searchMovieList.removeAll()
        searchBar.text = ""
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
}

