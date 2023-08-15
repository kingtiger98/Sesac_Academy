//: [Previous](@previous)

import Foundation

let json = """
  {
    "quote_content": "The will of man is his happiness.",
    "author_name": "Friedrich Schiller",
    "likelike" : 34567
  }
"""


// Sting => Data => Quote (디코딩, 역직렬화)
struct Quote: Decodable{
    let content: String
    let name: String
    let like : Int
    
    enum CodingKeys: String, CodingKey {
        case content = "quote_content"
        case name = "author_name"
        case like = "likelike"
    }
    
}


// Sting => Data
guard let result = json.data(using: .utf8) else {
    fatalError("ERROR")
}

print(result)


// Data => Quote
// Error handling, Do Try Catch, Meta Type

// 디코딩 전략
let decoder = JSONDecoder()
// decoder.keyDecodingStrategy = .convertFromSnakeCase

do {
    let value = try decoder.decode(Quote.self, from: result)
    print(value)
} catch {
    print(error)
}





//: [Next](@next)
