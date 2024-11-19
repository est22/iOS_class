//
//  MainView.swift
//  yangpa-market-swiftui
//
//  Created by Lia An on 11/15/24.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var memberVM: MemberViewModel
    
    var body: some View {
        SaleListView().padding()
        Text("MainView")
        Button("로그아웃") {
            memberVM.isLoggedIn = false
        }
    }
}

#Preview {
    MainView()
}
