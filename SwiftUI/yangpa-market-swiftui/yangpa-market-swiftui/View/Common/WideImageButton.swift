//
//  WideImageButton.swift
//  yangpa-market-swiftui
//
//  Created by Lia An on 11/15/24.
//

import SwiftUI

struct WideImageButton: View {
    var icon: String
    var title: String
    var backgroundColor: Color
    var borderColor: Color = .clear
    var textColor: Color = .white
    var action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            Image(systemName: icon).foregroundStyle(textColor)
            Text(title).font(.headline).bold().foregroundStyle(textColor)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(backgroundColor)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .overlay(
            RoundedRectangle(cornerRadius: 10).stroke(borderColor, lineWidth: 2)
        ).padding(.horizontal)
        
    }
}

#Preview {
    WideImageButton(icon: "person.fill", title: "로그인", backgroundColor: .orange) {
        
    }
    WideImageButton(icon: "person.fill", title: "회원가입", backgroundColor: .pink) {
        
    }
}
