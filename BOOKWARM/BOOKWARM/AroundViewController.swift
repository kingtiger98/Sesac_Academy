//
//  AroundViewController.swift
//  BOOKWARM
//
//  Created by 황재하 on 8/2/23.
//

import UIKit

class AroundViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UICollectionViewDelegate, UICollectionViewDataSource {
    
    let bestmovieinfo = MovieInfo()
    
    @IBOutlet weak var recentCollectionView: UICollectionView!
    @IBOutlet weak var bestTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        recentCollectionView.dataSource = self
        recentCollectionView.delegate = self
        
        bestTableView.dataSource = self
        bestTableView.delegate = self
        
        // 컬렉션뷰 셀 등록
        let nib2 = UINib(nibName: RecentCollectionViewCell.identifier, bundle: nil)
        recentCollectionView.register(nib2, forCellWithReuseIdentifier: RecentCollectionViewCell.identifier)
        
        // 테이블뷰 셀 등록
        let nib1 = UINib(nibName: BestTableViewCell.identifier, bundle: nil)
        bestTableView.register(nib1, forCellReuseIdentifier: BestTableViewCell.identifier)
        
        // 컬렉션뷰 레이아웃 잡기
        recentCollectionViewFlowLayout()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bestmovieinfo.movie.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecentCollectionViewCell.identifier, for: indexPath) as? RecentCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.recentMovieImageView.image = UIImage(named: bestmovieinfo.movie[indexPath.row].title)
    
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController else {
            return
        }
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .crossDissolve
        
        // 데이터 전달
        vc.nameContents = bestmovieinfo.movie[indexPath.row].title
        vc.dateContents = bestmovieinfo.movie[indexPath.row].releaseDate
        vc.overviewContents = bestmovieinfo.movie[indexPath.row].overview
        vc.timeContents = bestmovieinfo.movie[indexPath.row].runtime
        vc.rateContents = bestmovieinfo.movie[indexPath.row].rate
        
        present(vc, animated: true)
        
    }
    
    func recentCollectionViewFlowLayout() {
        let layout = UICollectionViewFlowLayout()
        
        let spacing: CGFloat = 4
        let width = UIScreen.main.bounds.width - ( spacing * 4 )
        
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize( width: width / 4, height: (width / 4) * 1.5 )
        layout.minimumLineSpacing = 0
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        
        recentCollectionView.collectionViewLayout = layout
    }
    

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bestmovieinfo.movie.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = bestTableView.dequeueReusableCell(withIdentifier: BestTableViewCell.identifier) as? BestTableViewCell else {
            return UITableViewCell()
        }
        
        cell.bestMoviePosterImageView.image = UIImage(named: bestmovieinfo.movie[indexPath.row].title)
        cell.bestMovieNameLabel.text = bestmovieinfo.movie[indexPath.row].title
        cell.bestMovieOpenDateLabel.text = bestmovieinfo.movie[indexPath.row].releaseDate
        cell.bestMovieRateLabel.text = "⭐️ " + "\(bestmovieinfo.movie[indexPath.row].rate)"

        cell.bestMoviePosterImageView.layer.cornerRadius = 5
        cell.bestMovieNameLabel.textColor = .darkGray
        cell.bestMovieOpenDateLabel.textColor = .lightGray
        cell.bestMovieRateLabel.textColor = .darkGray
        
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController else {
            return
        }
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .crossDissolve
        
        // 데이터 전달
        vc.nameContents = bestmovieinfo.movie[indexPath.row].title
        vc.dateContents = bestmovieinfo.movie[indexPath.row].releaseDate
        vc.overviewContents = bestmovieinfo.movie[indexPath.row].overview
        vc.timeContents = bestmovieinfo.movie[indexPath.row].runtime
        vc.rateContents = bestmovieinfo.movie[indexPath.row].rate
        
        present(vc, animated: true)
        
    }
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "요즘 인기 작품"
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else { return; }
        header.textLabel?.textColor = .black
    }
}
