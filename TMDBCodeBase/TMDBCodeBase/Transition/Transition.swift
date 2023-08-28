import UIKit

extension BaseViewController{
    
    enum TransitionStyle{
        case present // 네비게이션 없이 present
        case presentNavigation // 네비게이션 임베드 된 present
        case presentFullNavigation // 네비게이션 임베드 된 fullscreen present
        case push
    }
    
    func transition<T: UIViewController>(ViewController: T.Type , style: TransitionStyle) {
        
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
    
}
