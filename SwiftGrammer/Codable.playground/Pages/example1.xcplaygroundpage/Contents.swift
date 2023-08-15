//: [Previous](@previous)

import Foundation

let json = """
  {
    "quote": "The will of man is his happiness.",
    "author": "Friedrich Schiller",
    "category": "happiness"
  }
"""


// Sting => Data => Quote (디코딩, 역직렬화)
struct Quote: Decodable{
    let quote: String
    let author: String
    let category: String
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
    let value = try JSONDecoder().decode(Quote.self, from: result)
    print(value)
    print(value.author)
} catch {
    print(error)
}






//: [Next](@next)
