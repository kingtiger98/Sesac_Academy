//
//  MovieViewController.swift
//  firstMission
//
//  Created by 황재하 on 7/19/23.
//

import UIKit

class MovieViewController: UIViewController {

    @IBOutlet weak var previewMovieImg1: UIImageView!
    @IBOutlet weak var previewMovieImg2: UIImageView!
    @IBOutlet weak var previewMovieImg3: UIImageView!
    
    @IBOutlet weak var bgImg: UIImageView!
    
    @IBOutlet weak var randomPlayBtn: UIButton!
    @IBOutlet weak var informationBtn: UIButton!
    
    
    // 사용자에게 화면이 보이기 직전에 실행되는 부분
    // 모서리 둥글기, 그림자 등 스토리보드에서 설정할 수 없는 UI를 설정할 때 주로 사용
    // 뷰컨트롤러 생명주기
    override func viewDidLoad() {
        super.viewDidLoad()

        showRandomMovie()
        MovieDs(outletName: previewMovieImg1, borderColor: UIColor.red.cgColor)
        MovieDs(outletName: previewMovieImg2, borderColor: UIColor.orange.cgColor)
        MovieDs(outletName: previewMovieImg3, borderColor: UIColor.yellow.cgColor)
        playBtnDs()

    }

    // 알림창 띄우기 액션 함수************
    @IBAction func favoriteContents(_ sender: UIBarButtonItem) {
        
        // 1
        let alert = UIAlertController(title: "이곳이 타이틀입니다.", message: "이러쿵 저러쿵", preferredStyle: .alert)
        
        // 2
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        let okay = UIAlertAction(title: "확인", style: .default)
        
        // 3
        alert.addAction(okay)
        alert.addAction(cancel)
        
        // 4
        present(alert, animated: true)
    }
    
    
    @IBAction func playBtnClicked(_ sender: UIButton) {
        showRandomMovie()
    }
    
    
    func showRandomMovie() {
        let random = [1, 2, 3, 4, 5]
        let randomResult1 = random.randomElement()
        let randomResult2 = random.randomElement()
        let randomResult3 = random.randomElement()
        let randomResult4 = random.randomElement()

        // 밑 영화 포스터 3개
        previewMovieImg1.image = UIImage(named: "\(randomResult1!)")
        previewMovieImg2.image = UIImage(named: "\(randomResult2!)")
        previewMovieImg3.image = UIImage(named: "\(randomResult3!)")

        // 배경이미지
        bgImg.image = UIImage(named: "\(randomResult4!)")
    }

    
    // 외부매개변수(Argument Label) : outletName, 내부매개변수(Parameter Name) : name, 외부매개변수 생략은 : _
    // 매개변수 : Parameter - 전달인자를 받을 변수
    // 전달인자 : Argument - 함수를 호출할 때 전달하는 값 (변동)
    func MovieDs(outletName name: UIImageView, borderColor: CGColor) {
        // 미리보기 영화 테두리 디자인
        name.layer.cornerRadius = 50
        name.layer.borderWidth = 5
        name.layer.borderColor = borderColor
        
        // 이미지가 지정되지 않으면 보임
        name.backgroundColor = .blue
        name.contentMode = .scaleAspectFill
    }
    
    
    func playBtnDs() {
        // 버튼에서 normal과 highlighted => 누르기 전(normal)과 누르고(highlighted) 있을 때!
        randomPlayBtn.setTitle("재생", for: .normal)
        randomPlayBtn.setTitle("눌러주세요", for: .highlighted)
        randomPlayBtn.setTitleColor(.white, for: .normal)
        randomPlayBtn.setTitleColor(.red, for: .highlighted)

        randomPlayBtn.setImage(UIImage(named: "play_normal"), for: .normal)
        randomPlayBtn.setImage(UIImage(named: "play_highlighted"), for: .highlighted)

        randomPlayBtn.layer.cornerRadius = 10
        randomPlayBtn.layer.cornerRadius = 0
        randomPlayBtn.layer.borderColor = UIColor.red.cgColor
        randomPlayBtn.layer.borderWidth = 4
    }
    
}
