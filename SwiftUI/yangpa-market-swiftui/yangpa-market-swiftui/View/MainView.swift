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
        TabView{
            SaleListView()
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text("상품목록")
                }
            Text("카카오맵")
                .tabItem {
                    Image(systemName: "map")
                    Text("카카오맵")
                }
        }
    }
}

#Preview {
    let memberVM = MemberViewModel()
    let saleVM = SaleViewModel()
    MainView().environmentObject(memberVM).environmentObject(saleVM)
}
