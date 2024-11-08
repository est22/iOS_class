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
    @EnvironmentObject var weatherProvider: WeatherProvider // 환경 객체로 사용
    
    var body: some View {
        NavigationSplitView {
            VStack{
                SearchBar(searchText: $query) {
                    page = 1
                    bookFinder.search(query: query, at: page) // 2, 3
                }.alert("책검색", isPresented: $bookFinder.isError) {
                    Button("확인", role: .cancel) { }
                } message: {
                    Text("책 정보를 가져오는데 실패했습니다.")
                }

                List(bookFinder.books) { book in
                    NavigationLink {
                        BookDetailWebView(strURL: book.url)
                    } label: {
                        BookRow(book: book)
                    }
                }
                .listStyle(.plain)
                .navigationTitle("책 검색")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button {
                            page -= 1
                            bookFinder.search(query: query, at: page)
                        } label: {
                            Image(systemName: "arrow.left")
                            
                        }.disabled(true)
                    }
                    ToolbarItem(placement: .topBarTrailing) {
                        Button {
                            page += 1
                            bookFinder.search(query: query, at: page)
                        } label: {
                            Image(systemName: "arrow.right")
                        }.disabled(bookFinder.isEnd)
            
                    }
                }
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        WeatherWidgetView()
                    }
                    
                }
            }
        } detail: {
            
        }
    }
}

#Preview {
    BookList().environmentObject(WeatherProvider())
}
