import UIKit



// subscript : 특정 엘리먼트에 접근하기

var list = [1,2,3]



extension String {
    subscript(idx: Int) -> String? {
        
        guard (0..<count).contains(idx) else {
            return nil
        }
        
        let result = index(startIndex, offsetBy: idx)
        return String(self[result])
    }
}


var greeting = "Hello"

greeting[0]


//=======================

extension Collection {
    
    subscript(safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
    
}

var number = [1, 2, 3]

number[safe: 10]
