//
//  SnapViewController.swift
//  SeSAC3Week6
//
//  Created by 황재하 on 8/22/23.
//

import UIKit
import SnapKit

/*
 
 addSubview : 위치 호출 주의하기 특정 뷰가 안보일 수 있어!
 superView
 offset inset
 RTL: leading vs Left
    ㄴ 한글이나 영어는 좌측에서 우측으로 글을 읽지만 아랍어나 히브리어와 같은 언어는 우측에서 좌측으로 글을 읽습니다.
       이에 따라 뷰 구성도 언어에 따라 (좌측에서 우측) / (우측에서 좌측) 기준을 잡아야합니다.
       이를 위해 오토레이아웃 적용시 Left, Right가 아닌 Leading, Trailing을 적용하여 유연하게 적용할 수 있습니다.
 
 */



class SnapViewController: UIViewController {

    let redView = UIView()
    let whiteView = UIView()
    let blueView = UIView()
    let yellowView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .lightGray
        
        view.addSubview(redView)
        redView.backgroundColor = .red
        redView.snp.makeConstraints { make in
            make.width.equalTo(200)
            make.height.equalTo(150)
            make.centerX.equalTo(view)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        
        
        view.addSubview(whiteView)
        whiteView.backgroundColor = .white
        whiteView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
            //make.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            //make.trailing.equalTo(view.safeAreaLayoutGuide)
            
            make.height.equalTo(200)
        }
        
        
        view.addSubview(blueView)
        blueView.backgroundColor = .blue
        blueView.snp.makeConstraints { make in
            //make.width.height.equalTo(200)
            make.size.equalTo(200)
            //make.centerX.centerY.equalTo(view)
            make.center.equalTo(view)
            
        }
        
        
        blueView.addSubview(yellowView)
        yellowView.backgroundColor = .yellow
        yellowView.snp.makeConstraints { make in
            //make.size.equalTo(150)
            //make.leading.top.equalToSuperview()
            //make.edges.equalToSuperview()
            
            // offset, inset***
            //make.edges.equalTo(blueView).offset(50)
            //make.edges.equalTo(blueView).inset(50)
            
        }
        
    
    }
    
    

}
