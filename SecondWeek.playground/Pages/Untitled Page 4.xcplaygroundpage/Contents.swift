//: [Previous](@previous)

import Foundation

// 클래스 내 모든 프로퍼티는 초기화되어 있어야 한다!
// 1. 선언과 동시에 초기화
// 2. 옵셔널로 선언하기
// 3. 매개변수, 초기화 구문 만들기
class BabyMonster {
    var name: String
    var exp: Int
    var speed: Int
    var power: Int
    
    init(name: String, exp: Int, speed: Int, power: Int) {
        self.name = name
        self.exp = exp
        self.speed = speed
        self.power = power
    }
}


// 멤버와이즈 이니셜라이저 구문 제공
struct BabyMonsterStruct {
    var name: String
    var exp: Int
    var speed: Int
    var power: Int
}


let baby = BabyMonster(name: "아기몬스터", exp: 1, speed: 1, power: 1)
baby.speed

let structBaby = BabyMonsterStruct(name: "구조체몬스터", exp: 1, speed: 3, power: 2)
structBaby.name

//ex.

var nickname = "고래밥"

var subNickname = nickname

nickname = "칙촉"

print(nickname)
print(subNickname)




// 몬스터 * 100
// BaseClass
class Monster {
    var exp = 1
    var clothes = "빨강"
    var speed = 1
    var power = 1
    
    func attack() {
        print("몬스터 공격!")
    }
    
}

let easy = Monster() // 인스턴스 생성
easy.exp
easy.clothes
easy.speed
easy.power

let hard = Monster()
hard.exp = 10
hard.clothes = "파랑"
hard.speed = 2
hard.power = 2

hard.exp
hard.clothes
hard.speed
hard.power

// BossMonster는 Monster를 상속 받고 있기 때문에
// Monster가 가지고 있는 변수를 사용할 수 있다.
// -> BossMonster: SubClass
// -> Monster: SuperClass
class BossMonster: Monster { //  Monster상속
    
    var specialItem = "레벨업"
    
    // override : 부모클래스에서 물려받은 요소를 자식클래스에서 사용할 때, 자식클래스만의 기능으로 변경(재정의)해서 사용할 수 있고 이를 override라고 함
    override func attack() {
        super.attack() // super키워드를 이용해 부모의 메서드도 같이 실행할 수 있음
        print("보스 몬스터 공격!")
    }
    
}

let boss = BossMonster()
boss.specialItem
boss.exp
boss.clothes
boss.speed
boss.power
boss.attack() // 보스 몬스터 공격!

//: [Next](@next)
