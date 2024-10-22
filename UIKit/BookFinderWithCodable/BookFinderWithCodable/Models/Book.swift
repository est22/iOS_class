//
//  Book.swift
//  BookFinderWithCodable
//
//  Created by Lia An on 10/22/24.
//

import Foundation

struct Book: Codable {
    let title: String
    let publisher: String
    let authors: [String]
    let thumbnail: String
}

struct Meta: Codable {
    let isEnd: Bool
    let pageableCount: Int
    let totalCount: Int
    enum CodingKeys: String, CodingKey {
        case isEnd = "is_end"
        case pageableCount = "pageable_count"
        case totalCount = "total_count"
    }

}

struct BookInfo: Codable {
    let meta: Meta
    let books: [Book]
    enum CodingKeys: String, CodingKey {
        case books = "documents"
        case meta
    }
    
}
