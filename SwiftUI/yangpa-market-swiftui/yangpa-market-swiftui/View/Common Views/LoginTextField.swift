//
//  LoginTextField.swift
//  yangpa-market-swiftui
//
//  Created by Lia An on 11/15/24.
//

import SwiftUI

struct LoginTextField: View {
    var icon: String
    var placeholder: String
    @Binding var text: String
    
    var body: some View {
        HStack {
            Image(systemName: icon)
            TextField(placeholder, text: $text)
        }
        
        
    }
}

#Preview {
    LoginTextField(icon: "person.fill", placeholder: "사용자 ID를 입력하세요", text:.constant("lia"))
}
