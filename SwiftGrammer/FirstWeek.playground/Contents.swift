import UIKit

//func welcome(nickname: String?){
//        if nickname == nil {
//        print("안녕하세요 저는 손님입니다.")
//    } else {
//        print("안녕하세요 저는 \(nickname!)입니다.")
//    }
//}

//func welcome(nickname: String?){
//        print("안녕하세요 저는 \(nickname ?? "손님")입니다.")
//}

func welcome(nickname: String? = nil){
    print("안녕하세요 저는 \(nickname ?? "손님")입니다.")
}


welcome(nickname: "재하")
welcome(nickname: nil)
welcome()


func randomnumber() -> Int{
    let number = Int.random(in: 0...100)
    print(number)
    
    return number
}

randomnumber()
