//
//  LoginTextField.swift
//  yangpa-market-swiftui
//
//  Created by Lia An on 11/15/24.
//

import SwiftUI

struct LoginTextField: View {
    // TextField
    var icon: String
    var placeholder: String
    @Binding var text: String
    // Passkey
    var isSecured: Bool = false
    
    var body: some View {
        HStack {
            Image(systemName: icon).foregroundStyle(.mint)
            if !isSecured {
                TextField(placeholder, text: $text)
                    .autocapitalization(.none)
                    .autocorrectionDisabled(true)
            } else {
                SecureField(placeholder, text: $text)
                    .autocapitalization(.none)
                    .autocorrectionDisabled(true)
            }
            
        }.padding()
            .background(Color.gray.opacity(0.1))
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .overlay(RoundedRectangle(cornerRadius: 10) .stroke(.gray.opacity(0.5), lineWidth: 1))
            .padding(.horizontal)
        
        
    }
}

#Preview {
    LoginTextField(icon: "person.fill", placeholder: "사용자 ID를 입력하세요", text:.constant("lia"))
    LoginTextField(icon: "lock.fill", placeholder: "비밀번호를 입력하세요", text:.constant("lia1234"), isSecured: true)
}
