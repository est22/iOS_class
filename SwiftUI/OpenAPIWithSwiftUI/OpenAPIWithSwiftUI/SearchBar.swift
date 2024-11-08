//
//  SearchBar.swift
//  OpenAPIWithSwiftUI
//
//  Created by Lia An on 11/8/24.
//

import SwiftUI

struct SearchBar: View {
    @Binding var searchText: String
    var body: some View {
        HStack {
            TextField("검색어를 입력하세요", text: $searchText).padding()
        .background(Color(.systemGray6))
            .clipShape(.rect(cornerRadius: 18))
            .padding(.horizontal, 10)
        

        }
    }
}

#Preview {
    SearchBar(searchText: .constant("한강"))
}
