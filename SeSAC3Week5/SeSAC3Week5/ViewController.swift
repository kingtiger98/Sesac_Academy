//
//  ViewController.swift
//  SeSAC3Week5
//
//  Created by jack on 2023/08/14.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var syncButton: UIButton!
    @IBOutlet var asyncButton: UIButton!
    @IBOutlet var groupButton: UIButton!
     
    @IBOutlet var firstImageView: UIImageView!
    @IBOutlet var secondImageView: UIImageView!
    @IBOutlet var thirdImageView: UIImageView!
    @IBOutlet var fourthImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
  
        syncButton.addTarget(self, action: #selector(syncButtonClicked), for: .touchUpInside)
        
        asyncButton.addTarget(self, action: #selector(asyncButtonClicked), for: .touchUpInside)
        
    }
     
    
    
    @objc func asyncButtonClicked(){
        
        print("async start")
        asyncDownloadImage(imageView: firstImageView, value: "first")
//        asyncDownloadImage(imageView: secondImageView, value: "second")
//        asyncDownloadImage(imageView: thirdImageView, value: "third")
//        asyncDownloadImage(imageView: fourthImageView, value: "fourth")
        print("async end")
        
    }
    
    // 일단 다른 알바생에게 작업을 보내고 나머지 실행.
    // 작업이 언제 끝나는 지 정확한 시점을 알기 어렵다.
    // UI관련 처리는 메인 쓰레드에서 해야한다!
    func asyncDownloadImage(imageView: UIImageView, value: String) {
         
        // 닭벼슬 일중..
        print("===1===\(value)===", Thread.isMainThread)
        
        
        // 매니저(Queue)한테 task보냄
        DispatchQueue.global().async {
            print("===2-1===\(value)===", Thread.isMainThread)
            let data = try! Data(contentsOf: Nasa.photo)
            
            // 매니저가 다른 알바생에게 일 분배
            DispatchQueue.main.async {
                imageView.image = UIImage(data: data)
                print("===2-2===\(value)===", Thread.isMainThread)
            }
            
            print("===2-3===\(value)===", Thread.isMainThread)
        }
        
        // 닭벼슬 일중..
        print("===3===\(value)===", Thread.isMainThread)
        
    }
    
    
    
    
    
    
    @objc func syncButtonClicked() {
        
        print("sync start")
        downloadImage(imageView: firstImageView, value: "first")
        downloadImage(imageView: secondImageView, value: "second")
        downloadImage(imageView: thirdImageView, value: "third")
        downloadImage(imageView: fourthImageView, value: "fourth")
        print("sync end") // 동기_sync : 순서대로 실행, 끝나는 지점 알 수 없음
        
    }
    
    func downloadImage(imageView: UIImageView, value: String) {
         
        print("===1===\(value)===")
        let data = try! Data(contentsOf: Nasa.photo)
        imageView.image = UIImage(data: data)
        print("===2===\(value)===")
        
    }
     

    
    
}

extension ViewController: CollectionViewAttributeProtocol {
    
    func configureCollectionView() {
        
    }
    
    func configureCollectionViewLayout() {
        
    }
    
}

