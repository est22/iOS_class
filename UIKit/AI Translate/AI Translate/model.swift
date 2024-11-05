//
//  model.swift
//  AI Translate
//
//  Created by Lia An on 11/4/24.
//

import Foundation

// user input
struct Text: Codable {
    let text: String
}

// translated output
struct Translation: Codable, Sendable {
    let text: String
    let to: String
}

// root output
struct Document: Codable, Sendable {
    let translations: [Translation]
}

//
//struct TranslationResponse: Decodable {
//    let detectedLanguage: DetectedLanguage
//    let translations: [Translation]
//}
//
//struct DetectedLanguage: Decodable {
//    let language: String
//    let score: Double
//}



