//
//  BookRow.swift
//  OpenAPIWithSwiftUI
//
//  Created by Lia An on 11/8/24.
//

import SwiftUI

let sampleBookData = Book(title: "모두 거짓말을 한다", publisher: "더퀘스트", authors: ["세스 스티븐스 다비도위츠"], thumbnail: "https://search1.kakaocdn.net/thumb/R120x174.q85/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flbook%2Fimage%2F1596717%3Ftimestamp%3D20240713113438", url: "https://search.daum.net/search?w=bookpage&bookId=1596717&q=%EB%AA%A8%EB%91%90+%EA%B1%B0%EC%A7%93%EB%A7%90%EC%9D%84+%ED%95%9C%EB%8B%A4", price: 18000, id: "1160504571 9791160504576")

struct BookRow: View {
    let book: Book
    var body: some View {
        HStack(spacing: 5){
            AsyncImage(url: URL(string: book.thumbnail)) { image in
                image.resizable()
                    .scaledToFill()
                    .frame(width: 60, height: 80)
                
            } placeholder: {
                Image(systemName: "book.fill")
                    .resizable()
                    .frame(width: 60, height: 80)
                    .foregroundColor(.gray)
                    .cornerRadius(8)
            }

            VStack(alignment: .leading) {
                Text(book.title).font(.title2).fontWeight(.bold).foregroundStyle(.blue).lineLimit(1)
                    .truncationMode(.tail)

                Text(book.publisher).font(.subheadline).foregroundStyle(.gray).lineLimit(1)
                
                HStack {
                    Text(book.authors.joined(separator: ", ")).font(.subheadline)
                    Spacer()
                    Text("\(book.price.formatted())원").frame(alignment: .trailing).foregroundStyle(.red).fontWeight(.bold)
                    
                }

            }
            .padding(5)
            
            
            
        }.padding(10)
        
        
    }
}

#Preview {
    BookRow(book: sampleBookData)
}
