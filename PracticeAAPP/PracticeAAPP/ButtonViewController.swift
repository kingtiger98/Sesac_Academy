//
//  ButtonViewController.swift
//  PracticeAAPP
//
//  Created by 황재하 on 8/30/23.
//

import UIKit
import SnapKit

class ButtonViewController: UIViewController {

    // 기존 방식
    let oldButton = {
        
        // 1. UIButton 인스턴스 생성
        let button = UIButton()
        button.configuration = .filled()

        button.setTitle("기존 버튼", for: .normal)
        
        return button
    }()
    
    
    // configuration 방식
    let configurationButton = {
        
        // 1. UIButton 인스턴스 생성
        let button = UIButton()
        
        // 2. 버튼의 configuration 설정을 담을 configuration 변수 생성
        var configuration = UIButton.Configuration.filled()
        
        // 3. 버튼 설정
        configuration.title = "Configuration 버튼"
        configuration.image = UIImage(systemName: "heart")
        configuration.imagePlacement = .trailing
        configuration.imagePadding = 30
        configuration.subtitle = "대충 서브타이틀"
        
        
        configuration.baseBackgroundColor = .brown
        configuration.baseForegroundColor = .black
        configuration.cornerStyle = .capsule
        configuration.buttonSize = .large
                
        // configuration.showsActivityIndicator = false
        
        // 4. button에 configuration적용
        button.configuration = configuration
        

        
        // ConfigurationUpdateHandler : 버튼의 configuration이 업데이트 될 때마다 실행됨
        // 1. button에 configurationUpdateHandler 클로저 할당
        button.configurationUpdateHandler = { button in
            
            // 2. 현재 버튼의 configuration을 가져와 config에 할당
            var config = button.configuration
            
            // 3. 버튼의 하이라이트 상태에 따라 이미지를 동적으로 설정
            config?.image = button.isHighlighted ? UIImage(systemName: "heart.fill") : UIImage(systemName: "heart")
            // config?.showsActivityIndicator = button.isHighlighted ? true : false
            
            // 4. 수정된 config를 다시 button.configuration 할당
            button.configuration = config
        }
        
        
        
        
        // Pull Down Button 구현 : iOS14에서 추가된 menu
        let favorite = UIAction(title: "즐겨찾기", image: UIImage(systemName: "star"),state: .on, handler: { _ in print("즐겨찾기") })
        let cancel = UIAction(title: "취소", attributes: .destructive,state: .on, handler: { _ in print("취소") })
        
        button.menu = UIMenu(title: "title입니다",
                             identifier: nil,
                             options: .displayInline,
                             children: [favorite, cancel])
        
        
        // Pop Up Button 구현
        //    ㄴ메뉴 요소 중 하나만 선택되도록 한다는 것이 Pull Down Button과의 차이점
        //    ㄴ 선택한 메뉴의 액션의 title로 버튼의 title도 자동으로 바뀐다
        button.showsMenuAsPrimaryAction = true // 버튼 클릭시 Pop Up 메뉴가 나타나게
        button.changesSelectionAsPrimaryAction = true // 메뉴 항목 중 하나만 선택되도록
        
        
        return button
    }()
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(oldButton)
        oldButton.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.width.equalTo(200)
            make.center.equalToSuperview()
        }
        
        view.addSubview(configurationButton)
        configurationButton.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.width.equalTo(250)
            make.centerX.equalToSuperview()
            make.top.equalTo(oldButton.snp.bottom).offset(50)

        }
    }
    
    
    


}
