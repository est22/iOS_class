//
//  LoginView.swift
//  yangpa-market-swiftui
//
//  Created by Lia An on 11/15/24.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var memberVM: MemberViewModel
    @State var userID: String = ""
    @State var password: String = ""
    
    var body: some View {
        VStack  {
            // TextFields
            VStack{
                CustomTextField(icon: "person.fill", placeholder: "ID를 입력하세요.", text: $userID)
                CustomTextField(icon: "person.fill", placeholder: "비밀번호를 입력하세요.", text: $password, isSecured: true)
            }.padding(.bottom, 20)
            
            // Buttons
            VStack {
                WideImageButton(icon: "person.badge.key", title: "로그인", backgroundColor: .orange) {
                    memberVM.login(userName: userID, password: password)
                }.alert("로그인 실패", isPresented: $memberVM.isLoginError) {
                    Button("확인") {
                        memberVM.isLoginError = false
                    }
                } message: {
                    Text(memberVM.message)
                }
                
                
                WideImageButton(icon: "person.badge.key", title: "회원가입", backgroundColor: .pink) {
                    memberVM.join(userName: userID, password: password)
                }.alert("회원가입", isPresented: $memberVM.isJoinSuccess) {
                    Button("확인") {
                        memberVM.isJoinSuccess = false
                    }
                } message: {
                    Text(memberVM.message)
                }
            }
        }
    }
}

#Preview {
    LoginView()
}
