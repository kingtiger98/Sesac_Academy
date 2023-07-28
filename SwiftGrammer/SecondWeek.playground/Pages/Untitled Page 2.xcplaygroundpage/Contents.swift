//: [Previous](@previous)

import Foundation

func randomWords() -> String {
    
    let list = ["뉴진스", "아이유", "좋댓구알", "이생망"]
    
    return  list.randomElement()!
}

randomWords()



// 3. appen vs appending
var nickname = "고래밥"

nickname.appending("맛있다")
//nickname.append("맛있다")

print(nickname)


// ========================================


var numbers: Set = [1,2,3,4,5,6,7,8,9,10]

// 2. subtract vs subtracting
numbers.subtract([3])
print(numbers)


// 1. shuffle vs shuffled
//print(numbers)
//
//numbers.shuffle()
//let shuffleNumber = numbers.shuffled()

//print(shuffleNumber)
//print(numbers)



//: [Next](@next)
