//
//  BookList.swift
//  OpenAPIWithSwiftUI
//
//  Created by Lia An on 11/8/24.
//

import SwiftUI

struct BookList: View {
    @State private var query: String = "" // 1
    @State var page = 1 // 3
    @StateObject var bookFinder = BookFinder() // 2
    
    var body: some View {
        VStack{
            SearchBar(searchText: $query) {
                page = 1
                bookFinder.search(query: query, at: page) // 2, 3
            }
            List(bookFinder.books) { book in
                BookRow(book: book)
            }
        }
    }
}

#Preview {
    BookList()
}
