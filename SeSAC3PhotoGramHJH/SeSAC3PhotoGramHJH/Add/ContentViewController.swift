//
//  TitleViewController.swift
//  SeSAC3PhotoGramHJH
//
//  Created by 황재하 on 8/29/23.
//

import UIKit

class ContentViewController: BaseViewController{
    
    let textView = {
        let view = UITextView()
        view.backgroundColor = .darkGray
        return view
    }()
    
    
    let sampleView = {
        let view = UIView()
        view.backgroundColor = .yellow
        return view
    }()
    
    let greenView = {
        let view = UIView()
        view.backgroundColor = .systemGreen
        return view
    }()
    
    
    // 1. Closer 값 전달하기
    var completionHandler2: ((String) -> Void)?

    deinit {
        print("deinit", self)
    }
    
    
    func setAnimation(){
        
        // 시작
        sampleView.alpha = 0
        greenView.alpha = 0
        
        // 끝
        UIView.animate(withDuration: 1, delay: 2, options: [.curveLinear]) {
            self.sampleView.alpha = 1
            self.sampleView.backgroundColor = .blue
        } completion: { bool in
            
            UIView.animate(withDuration: 1) {
                self.greenView.alpha = 1
            }
            
        }


    }
    
    
    override func configureView() {
        super.configureView()
        
        view.addSubview(textView)
        view.addSubview(sampleView)
        view.addSubview(greenView)
        setAnimation()
        
    }
    
    override func setConstraints() {
        super.setConstraints()
        
        textView.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(10)
            make.height.equalTo(300)
        }
        
        sampleView.snp.makeConstraints { make in
            make.size.equalTo(100)
            make.center.equalTo(view)
        }
        
        greenView.snp.makeConstraints { make in
            make.size.equalTo(100)
            make.center.equalTo(view).offset(100)
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        completionHandler2?(textView.text!)

    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        DispatchQueue.main.async {
            self.greenView.alpha = 1.0
            
            UIView.animate(withDuration: 0.3) {
                self.greenView.alpha = 0.5
            }
            
        }
    }
    
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.greenView.alpha = 0.5
        
        UIView.animate(withDuration: 0.3) {
            self.greenView.alpha = 1.0
        }
    }
    
    
}
