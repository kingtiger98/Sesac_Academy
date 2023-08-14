//: [Previous](@previous)

import Foundation

let json = """
  {
    "quote_content": "The will of man is his happiness.",
    "author_name": "Friedrich Schiller",
  }
"""


// Sting => Data => Quote (디코딩, 역직렬화)
struct Quote: Decodable{
    let quoteContent: String
    let authorName: String
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
decoder.keyDecodingStrategy = .convertFromSnakeCase

do {
    let value = try decoder.decode(Quote.self, from: result)
    print(value)
} catch {
    print(error)
}





//: [Next](@next)
