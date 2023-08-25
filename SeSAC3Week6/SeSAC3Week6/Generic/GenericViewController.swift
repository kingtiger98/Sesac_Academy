//
//  GenericViewController.swift
//  SeSAC3Week6
//
//  Created by 황재하 on 8/24/23.
//

import UIKit
import SnapKit

class GenericViewController: UIViewController {

    let sampleLabel = UILabel()
    let sampleButton = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "네비게이션 타이틀"
        
        view.backgroundColor = .cyan
        
        view.addSubview(sampleLabel)
        sampleLabel.backgroundColor = .yellow
        sampleLabel.clipsToBounds = true
        configureBorder(view: sampleLabel)
        sampleLabel.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(100)
            make.top.equalToSuperview().offset(100)
            make.height.equalTo(50)
        }
        
        view.addSubview(sampleButton)
        sampleButton.backgroundColor = .green
        configureBorder(view: sampleButton)
        sampleButton.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(100)
            make.top.equalTo(sampleLabel.snp.bottom).offset(30)
            make.height.equalTo(50)
        }
        
        // let generic = sum(a: 3.3, b: 4.4)
        // let generic2 = sum(a: 3, b: 4)
        
    }
    


}
