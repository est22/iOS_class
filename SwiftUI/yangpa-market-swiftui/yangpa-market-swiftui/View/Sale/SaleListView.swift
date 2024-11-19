//
//  SaleListView.swift
//  yangpa-market-swiftui
//
//  Created by Lia An on 11/15/24.
//

import SwiftUI

struct SaleListView: View {
    @EnvironmentObject var saleVM: SaleViewModel
    
    var body: some View {
        NavigationSplitView {
            ScrollView {
                LazyVStack {
                    ForEach(saleVM.sales) { sale in
                        NavigationLink {
                            SaleRowView(sale: sale)
                        } label: {
                            SaleRowView(sale: sale)
                                .onAppear {
                                    if sale == saleVM.sales.last {
                                        saleVM.fetchSales()
                                    }
                                }
                        }
                    }
                    .padding(.horizontal)
                }
                .onAppear {
                    saleVM.fetchSales()
                }
            }
            .navigationTitle("판매목록")
            .navigationBarTitleDisplayMode(.large)
            .alert("상품목록", isPresented: $saleVM.isFetchError) {
                Button("확인", role: .cancel) {}
            } message: {
                Text(saleVM.message)
            }
        } detail: {
            Text("판매 세부정보를 선택하세요")
        }
    }
}


#Preview {
    let saleVM = SaleViewModel()
    SaleListView().environmentObject(saleVM)
}
