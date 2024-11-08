//
//  BookFinder.swift
//  OpenAPIWithSwiftUI
//
//  Created by Lia An on 11/8/24.
//

import Foundation
import Alamofire

class BookFinder: ObservableObject {
    @Published var books: [Book] = []
    @Published var isEnd = true
    @Published var isError = false
    
    let apiKey = "KakaoAK ca5471e3798d8d7be8096008a622a0df"
    let endPoint = "https://dapi.kakao.com/v3/search/book"
    
    func search(query: String, at page: Int) {
        let headers: HTTPHeaders = ["Authorization": apiKey]
        let params: Parameters = ["query" : query, "page" : page]
        AF.request(endPoint, method: .get, parameters: params, headers: headers)
            .validate(statusCode: 200..<300)
            .responseDecodable(of: BookRoot.self) { response in
                switch response.result {
                case .success(let bookRoot):
                    self.books = bookRoot.books
                    print(self.books) // Debug
                    self.isEnd = bookRoot.meta.isEnd
                    self.isError = false
                case .failure(let error):
                    self.isError = true
                    print(error.localizedDescription)
                }
            }
    }
        
}
