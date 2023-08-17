//
//  GCDBasicViewController.swift
//  SeSAC3Week5
//
//  Created by jack on 2023/08/14.
//

import UIKit

class GCDBasicViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
 
        globalAsyncTwo()
    }
    
    
    func globalAsyncTwo() {
        
        
        // 작업 1
        print("Strat")
        
        // 작업 2
        for i in 1...100 {
            // 반복문 하나마다 알바생(스레드) 배치
            DispatchQueue.global().async {
                sleep(1)
                print(i, terminator: " ")
            }
            
        }
        
        
        // 작업 3
        for i in 101...200 {
            sleep(1)
            print(i, terminator: " ")
        }
        
        // 작업 4
        print("End")
        
    }
    
    
    
    
    // global().Async : 네트워크 통신에 주로 사용***
    // 작업 막 섞여서 실행됨 : 한 번에 일이 처리된다는 뜻, 작업 빨리 끝남
    func globalAsync() {
        
        // 작업 1
        print("Strat")
        
        // 작업 2
        DispatchQueue.global().async { // 네트워크 통신에 주로 사용***
            
            for i in 1...5 {
                sleep(1)
                print(i, terminator: " ")
            }
        }
        
        // 작업 3
        for i in 6...10 {
            sleep(1)
            print(i, terminator: " ")
        }
        
        // 작업 4
        print("End")
        
    }
    
    
    // global().sync
    // 닭벼슬이 작업 1 실행 -> 작업 2 큐로 보냄 _ 작업 2 끝날 때 까지 닭벼슬 대기 _ 큐는 다른 알바생에게 작업 2 배분 _ 다른 알바생이 작업 2 종료 -> 닭벼슬이 작업 3, 4 실행
    func globalSync() {
        
        // 작업 1
        print("Strat")
        
        // 작업 2
        DispatchQueue.global().sync {
            
            for i in 1...5 {
                sleep(1)
                print(i, terminator: " ")
            }
        }
        
        // 작업 3
        for i in 6...10 {
            sleep(1)
            print(i, terminator: " ")
        }
        
        // 작업 4
        print("End")
        
    }
    
    
    
    
    // main.Async : 비동기
    // 닭벼슬 혼자 일 다함, 1 -> 3 -> 4 -> 2
    // 작업 3은 queue에 보내고 다른 작업 완료 후 작업 3 마지막에 처리!
    func serialAsync() {
        
        // 작업 1
        print("Strat")
        
        // 작업 2
        DispatchQueue.main.async {
            
            for i in 1...5 {
                sleep(1)
                print(i, terminator: " ")
            }
        }
        
        // 작업 3
        for i in 6...10 {
            sleep(1)
            print(i, terminator: " ")
        }
        
        // 작업 4
        print("End")
    }
    
    
    
    
    
    // main.Sync 동기 : 데드락현상
    func serialSync() {
        print("Start")
        
        for i in 1...5 {
            sleep(1)
            print(i, terminator: " ")
        }
        
        // 무한 대기 상태, DeadLock(교착 상태)
        // 닭알바생은 1..5을 프린트하고 queue에서 작업이 끝나면 End를 찍을 준비를 하고 있는데,
        // queue는 작업을 또 닭알바생에게 주려해서 무한 도르마무 현상 : 데드락!
        DispatchQueue.main.sync {
            for i in 6...10 {
                sleep(1)
                print(i, terminator: " ")
            }
        }
            
        
        
        print("End")
    }
}
