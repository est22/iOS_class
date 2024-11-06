//
//  Model.swift
//  YangpaMarket
//
//  Created by Lia An on 11/6/24.
//

import Foundation

struct Member: Codable {
    let userName: String
    
}

struct SignUp: Codable {
    let success: Bool
    let member: Member
    let message: String
}


struct Login: Codable {
    let success: Bool
    let token: String
    let member: Member
    let message: String
}

struct Product: Codable {
    let id: Int
    let productName: String
    let description: String
    let price: Int
    let photo: String
    let userName: String
}


struct ProductList: Codable {
    let success: Bool
    let documents: [Product]
    let message: String
}
