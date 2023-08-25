//
//  Extension+UIViewController.swift
//  SeSAC3Week6
//
//  Created by 황재하 on 8/24/23.
//

import UIKit

extension UIViewController{
    
    enum TransitionStyle{
        case present // 네비게이션 없이 present
        case presentNavigation // 네비게이션 임베드 된 present
        case presentFullNavigation // 네비게이션 임베드 된 fullscreen present
        case push
    }
    
    
    /* 메타타입
     "고래밥" -> String
     String -> String.Type
     String.Type의 인스턴스 -> String.self
     */
    
    
    func transition<T: UIViewController>(ViewController: T.Type , style: TransitionStyle) {
        
        // let sb = UIStoryboard(name: storyboard, bundle: nil)
        // guard let vc = sb.instantiateViewController(withIdentifier: String(describing: ViewController)) as? T else { return }
        // present(vc, animated: true)
        
        let vc = T()
        
        switch style {
        case .present:
            present(vc, animated: true)
        case .presentNavigation:
            let nav = UINavigationController(rootViewController: vc)
            present(nav, animated: true)
        case .presentFullNavigation:
            let nav = UINavigationController(rootViewController: vc)
            nav.modalPresentationStyle = .fullScreen
            present(nav, animated: true)
        case .push:
            navigationController?.pushViewController(vc, animated: true)
        }
        
    }
    
    
    // Type Parameter: 타입의 종류는 알려주지 않지만, 모두 같은 타입이 들어갈 것을 암시. 플레이스 홀더와 같은 역할***
    // Type Consrains: 클래스 제약, 프로토콜 제약
    // UpperCased
    
    // UIView : 클래스 제약
    func configureBorder<T: UIView>(view: T){
        view.layer.cornerRadius = 8
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 1
    }
    
    // Generic: 타입에 유연하게 대응하기 위한 요소
    // 코드의 중복과 재사용에 대응하기가 좋아서 추상적인 표현이 가능
    // AdditiveArithmetic : 프로토콜 제약
    func sum<T: AdditiveArithmetic>(a: T, b: T) -> T {
        return a + b
    }
    
    func sumInt(a: Int, b: Int) -> Int{
        return a + b
    }
    
    func sumDouble(a: Double, b: Double) -> Double{
        return a + b
    }
    
}
