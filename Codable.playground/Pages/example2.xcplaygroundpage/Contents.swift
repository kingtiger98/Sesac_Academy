import UIKit

let json = """
  {
    "quote": "The will of man is his happiness.",
    "author": "Friedrich Schiller",
    "category": "happiness"
  }
"""


// Sting => Data => Quote (디코딩, 역직렬화)
// 키 값이 같지 않다면 디코딩 실패
// 옵셔널을 통해 런타임 오류를 방지할 수는 있다...
struct Qoute: Decodable{
    let quoteContent: String?
    let authorName: String?
    let category: String?
}


// Sting => Data
// Error handling, Do Try Catch, Meta Type
guard let result = json.data(using: .utf8) else {
    fatalError("ERROR")
}

print(result)

let apple = [[1,2,3],[4,5,6]]
dump(result)

do {
    let value = try JSONDecoder().decode(Qoute.self, from: result)
    print(value)
    
} catch {
    print(error)
}
