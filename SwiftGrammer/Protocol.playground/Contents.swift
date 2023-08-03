import UIKit

// 프로토콜은 함수에 대한 선언(명세)만 있음 like 청사진
protocol JackTableViewProtocol {
    func numberOfRowsInSection() -> Int
    func cellForRowAt(indexPath: IndexPath) -> UITableViewCell
}

//
//class vc: UIViewController, JackTableViewProtocol{
//
//    func numberOfRowsInSection() -> Int {
//        <#code#>
//    }
//
//    func cellForRowAt(indexPath: IndexPath) -> UITableViewCell {
//        <#code#>
//    }
//
//}

// 특정 명세를 따르는 타입은 '프로토콜을 준수한다'라고 표현함
// 실질적인 구현은 클래스, 열거형, 구조체 등에서 이루어짐
// 선택적 요청(Optional Requirement): 구현 객체에 따라 필요하지 않은 요소가 존재할 수 있어서, 이를 방지하기 위해 옵셔널 형태로 저장할 수 있음
//  ㄴ class 에서 사용할 수 있음
@objc protocol ViewPresentalbleProtocol {
    
    // 저장 프로퍼티를 프로토콜에 포함하려면 get 추가
    // 가지고 오겠다 : get, 저장을 하겠다 : set
    // get은 최소한 가지고 올 수 있다는거고 set도 마음대로 가능하단거야, 단 set을 썻다면 무조건 구현 해야해
    // 변수명만 같으면 상관 없이, 저장 프로퍼티로 구현해도 되고 연산 프로퍼티로 구현해도 됨
    @objc optional var navigationTitle: String { get set }
    var backgroudColor: UIColor { get }
    var identifier: String { get }
    
    
    func configureView()
    func configureLabel()
    @objc optional func configureTextField()

}

// ViewPresentalbleProtocol 프로토콜 채택
class A: UIViewController, ViewPresentalbleProtocol {
    
    var navigationTitle: String = "검색 화면"
    var backgroudColor: UIColor = .red
    var identifier: String = "identifier"
    
    // 프로토콜 준수
    func configureView() {
        <#code#>
    }
    
    func configureLabel() {
        <#code#>
    }
    
    func configureTextField() {
        <#code#>
    }
    
}

class B: UIViewController, ViewPresentalbleProtocol {
    
    var navigationTitle = "나의 일기장"
    
    var backgroudColor: UIColor {
        return .blue
    }
    var identifier: String {
        return "BViewController"
    }
    
    func configureView() {
        <#code#>
    }
    
    func configureLabel() {
        <#code#>
    }
    
    func configureTextField() {
        <#code#>
    }
    
    
}
class C: UIViewController {
    
}
