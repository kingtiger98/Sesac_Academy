//
//  BookCollectionViewController.swift
//  BOOKWARM
//
//  Created by 황재하 on 7/31/23.
//

import UIKit

class BookCollectionViewController: UICollectionViewController {

    var movieInfo = MovieInfo()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // XIB로 컬렉션뷰셀 생성했으므로 Register 해준다.
        let nib = UINib(nibName: "BookCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "BookCollectionViewCell")
        
        // 컬렉션뷰 레이아웃 잡기
        setCollectionViewLayout()
        
        
        navigationItem.backButtonTitle = ""
        
        
        
        
    }

    
    @IBAction func searchButtonClicked(_ sender: UIBarButtonItem) {
        
        let sb = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = sb.instantiateViewController(withIdentifier: "SearchViewController") as? SearchViewController else {
            print("검색버튼 다운캐스팅 실패")
            return
        }
        
        vc.navigationItem.title = "검색 화면"
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    
    
    
    
    // 1. 섹션 안의 item 갯수 지정
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movieInfo.movie.count
    }
    
    // 2. item 디자인 및 데이터 조작
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BookCollectionViewCell", for: indexPath) as? BookCollectionViewCell else {
            print("다운캐스팅 실패")
            return UICollectionViewCell()
        }
        
        cell.movieNameLabel.text = movieInfo.movie[indexPath.row].title
        cell.movieRateLabel.text = "\(movieInfo.movie[indexPath.row].rate)"
        cell.movieImageView.image = UIImage(named: "\(movieInfo.movie[indexPath.row].title)")
        
        
        cell.layer.cornerRadius = 15
        cell.backgroundColor = changeBackgroundColorRandom()
        
        
        // 좋아요 버튼_하트
        cell.likeButton.tag = indexPath.row
        cell.likeButton.addTarget(self, action: #selector(likeButtonClicked), for: .touchUpInside)
        
        if movieInfo.movie[indexPath.row].favorite == true {
            cell.likeButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        } else {
            cell.likeButton.setImage(UIImage(systemName: "heart"), for: .normal)
        }
        
        
        
        return cell
        
    }
    
    @objc func likeButtonClicked(_ sender: UIButton) {
        print("버튼 태그값 : \(sender.tag)")

        movieInfo.movie[sender.tag].favorite.toggle()
        collectionView.reloadData()
    }
    
    
    
    
    // 화면이동 + 값 전달
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        guard let viewController = storyBoard.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController else {
            print("화면이동 다운캐스팅 실패")
            return
        }
        
        navigationController?.pushViewController(viewController, animated: true)
        
        viewController.navigationItem.title = movieInfo.movie[indexPath.row].title
    
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

        
        // 4.
        collectionView.collectionViewLayout = layout
        
    }
    
    // 랜덤 색 추출
    func changeBackgroundColorRandom() -> UIColor{
        let r : CGFloat = CGFloat.random(in: 0...1)
        let g : CGFloat = CGFloat.random(in: 0...1)
        let b : CGFloat = CGFloat.random(in: 0...1)

        
        return UIColor(red: r, green: g, blue: b, alpha: 1)
    }
    
    
}
