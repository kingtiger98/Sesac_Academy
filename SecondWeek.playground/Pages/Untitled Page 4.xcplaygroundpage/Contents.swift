//: [Previous](@previous)

import Foundation

// 쉬운 몬스터 * 100
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
