//
//  MovieTableViewController.swift
//  SeSACWeek3
//
//  Created by 황재하 on 7/28/23.
//

import UIKit

class MovieTableViewController: UITableViewController {

    // 영화의 정보가 담긴 구조체의 인스턴스 생성
    let movieInfo = MovieInfo()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieInfo.movie.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // 셀의 identifier는 구조체에 static 상수로 선언해 따로 인스턴스를 생성하지 않고 구조체를 통해 바로 호출하여 사용
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Movie.identifier) as? MovieTableViewCell else {
            return UITableViewCell()
        }
        
        // 구조체의 데이터를 가져오는 반복되는 부분 상수에 넣어 사용
        let row = movieInfo.movie[indexPath.row]
        
        cell.configureCell(row: row)
//        cell.moviePoster.image = UIImage(named: "\(row.title)")
//        cell.movieTitle.text = row.title
//        cell.movieOpenDate.text = row.releaseDate + "ㅣ"
//        cell.movieRunTime.text = "\(row.runtime)" + "분 ㅣ"
//        cell.movieScore.text = "\(row.rate)" + "점"
//        cell.movieInformation.text = row.overview

        return cell
    }
    
}



