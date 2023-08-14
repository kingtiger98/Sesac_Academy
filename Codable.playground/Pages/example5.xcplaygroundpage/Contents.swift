//: [Previous](@previous)

import Foundation

let json = """
  {
    "quote_content": "The will of man is his happiness.",
    "author_name": null,
    "likelike" : "34567"
  }
"""


// Sting => Data => Quote (디코딩, 역직렬화)
struct Quote: Decodable{
    let content: String
    let name: String
    let like : Int
    let isInfluencer: Bool // 좋아요 3만개 이상
    
    enum CodingKeys: String, CodingKey {
        case content = "quote_content"
        case name = "author_name"
        case like = "likelike"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKey.self)
        content = try container.decode(String.self, forKey: .content)
        like = try container.decode(Int.self, forKey: .like)
        
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

do {
    let value = try decoder.decode(Quote.self, from: result)
    print(value)
} catch {
    print(error)
}





//: [Next](@next)
