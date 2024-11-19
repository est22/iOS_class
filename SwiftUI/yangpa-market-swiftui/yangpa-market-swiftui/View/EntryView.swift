//
//  EntryView.swift
//  yangpa-market-swiftui
//
//  Created by Lia An on 11/15/24.
//

import SwiftUI

struct EntryView: View {
    @EnvironmentObject var memberVM: MemberViewModel
    
    
    var body: some View {
        
        if memberVM.isLoggedIn {
            MainView()
        } else {
            LoginView(userID:"lia", password: "1234").transition(.move(edge:.bottom))
        }
    }
}

#Preview {
    let memberVM = MemberViewModel()
    let saleVM = SaleViewModel()
    EntryView().environmentObject(memberVM).environmentObject(saleVM)
}
