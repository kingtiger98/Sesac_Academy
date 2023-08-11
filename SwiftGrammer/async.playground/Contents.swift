import UIKit

// print("HELLO")
//
// main( = serial ) -> async(비동기)
// DispatchQueue.main.async{ // 작업 Queue에 맡겨놓고 다음 일 시작
//     for i in 1...100{
//         print(i, terminator: " ")
//     }
// }
//
// for i in 101...200{
//     print(i, terminator: " ")
// }
//
// print("BYE")




print("HELLO")

// global ( = concurrent ) -> async(비동기)
DispatchQueue.global().async{ // 동시에 일을 처리하게끔, 더 빨리 작업 끝남 + 언제 끝날지 모름
    for i in 1...100{
        print(i, terminator: " ")
    }
}

for i in 101...200{
        print(i, terminator: " ")
    }

print("BYE")
