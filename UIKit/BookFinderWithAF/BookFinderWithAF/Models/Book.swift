//
//  Book.swift
//  BookFinderWithAF
//
//  Created by Lia An on 10/28/24.
//

import Foundation

struct Meta: Codable {
    let isEnd: Bool
    enum CodingKeys: String, CodingKey {
        case isEnd = "is_end"
    }
}

struct Book: Codable {
    let title: String
    let authors: [String]
    let price: Int
    let thumbnail: String
    let url: String
}

struct Root: Codable {
    let meta: Meta
    let books: [Book]
    
    enum CodingKeys: String, CodingKey { // : String = key type을 의미
        case books = "documents"
        case meta
    }
}
