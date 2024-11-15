//
//  LoginView.swift
//  yangpa-market-swiftui
//
//  Created by Lia An on 11/15/24.
//

import SwiftUI

struct LoginView: View {
    @State var userID: String = ""
    @State var password: String = ""
    
    var body: some View {
        VStack  {
            // TextFields
            VStack{
                LoginTextField(icon: "person.fill", placeholder: "ID를 입력하세요.", text: $userID)
                LoginTextField(icon: "person.fill", placeholder: "비밀번호를 입력하세요.", text: $password, isSecured: true)
            }.padding(.bottom, 20)
            
            // Buttons
            VStack {
                WideImageButton(icon: "person.badge.key", title: "로그인", backgroundColor: .orange) {}
                WideImageButton(icon: "person.badge.key", title: "회원가입", backgroundColor: .pink) {}
            }
        }
    }
}

#Preview {
    LoginView()
}
