//
//  SaleRowView.swift
//  yangpa-market-swiftui
//
//  Created by Lia An on 11/15/24.
//

import SwiftUI

let sample = Document(id: 37, productName: "아무거나2", description: "판매합니다.티켓은 1인 1매 구매 가능하며, 참가비는 1만원입니다. 참가비는 전액 케이터링 및 기념품 제공에 사용됩니다.", price: 200, photo: "8ab4ae6e8324c1d6a4cc5e3bc71e42ed1731637856527.jpg", userName: "lia")

struct SaleRowView: View {
    var sale:Document
    var body: some View {
        HStack (spacing:20){
            let strURL = "https://sayangpa.blob.core.windows.net/yangpa/\(sale.photo)"
            AsyncImage(url: URL(string:strURL)) { image in
                image.resizable().aspectRatio(contentMode: .fill)
                    .frame(width: 70, height: 70)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray.opacity(0.3), lineWidth: 1))
                
            } placeholder: {
                Image(systemName: "photo")
            }
            
            VStack(alignment: .leading) {
                HStack {
                    Text(sale.productName)
                        .font(.headline)
                        .foregroundStyle(.primary)
                        .lineLimit(1)
                    Spacer()
                    Text("\(sale.price)원").font(.subheadline).fontWeight(.semibold)
                        .foregroundStyle(.green)
                    
                }
                Text(sale.description).font(.subheadline).foregroundStyle(.secondary).lineLimit(2)
                
                HStack {
                    Image(systemName: "person.circle.fill")
                        .foregroundStyle(.blue)
                    Text(sale.userName)
                        .font(.caption)
                        .foregroundStyle(.gray)
                }
                
            }
        }
    }
}

#Preview {
    SaleRowView(sale: sample)
}
