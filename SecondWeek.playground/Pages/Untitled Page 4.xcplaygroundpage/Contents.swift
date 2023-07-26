//: [Previous](@previous)

import Foundation

// 쉬운 몬스터 * 100
class Monster {
    var exp = 1
    var clothes = "빨강"
    var speed = 1
    var power = 1
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

class BossMonster: Monster { //  Monster상속
    
    var specialItem = "레벨업"
    
}

let boss = BossMonster()
boss.specialItem
boss.exp
boss.clothes
boss.speed
boss.power


//: [Next](@next)
