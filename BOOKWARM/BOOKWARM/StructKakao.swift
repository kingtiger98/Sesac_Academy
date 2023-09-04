// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? JSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
struct Welcome: Codable {
    let documents: [Document]
    //let meta: Meta
}

// MARK: - Document
struct Document: Codable {
    let authors: [String]
    let contents, datetime, isbn: String
    let price: Int
    let publisher: String
    let salePrice: Int
    let status: Status
    let thumbnail: String
    let title: String
    let url: String

    enum CodingKeys: String, CodingKey {
        case authors, contents, datetime, isbn, price, publisher
        case salePrice = "sale_price"
        case status, thumbnail, title, url
    }
}

enum Status: String, Codable {
    case empty = ""
    case 정상판매 = "정상판매"
}

// MARK: - Meta
//struct Meta: Codable {
//    let isEnd: Bool
//    let pageableCount, totalCount: Int
//
//    enum CodingKeys: String, CodingKey {
//        case isEnd = "is_end"
//        case pageableCount = "pageable_count"
//        case totalCount = "total_count"
//    }
//}
