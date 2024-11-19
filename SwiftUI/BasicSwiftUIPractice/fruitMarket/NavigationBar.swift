//
//  NavigationBar.swift
//  fruitMarket
//
//  Created by Lia An on 11/17/24.
//

import SwiftUI

struct NavigationBar: View {
    var body: some View {
        let leadingItem = Button(action: {
            print("Leading item tapped")
        }) {
            Image(systemName: "bell").imageScale(.large)
        }
        let trailingItem = Button(action: {
            print("Trailing")
        }) {
            Image(systemName: "gear").imageScale(.large)
        }
        
        
        return NavigationView {
            Image("smile").navigationBarItems(leading: leadingItem, trailing: trailingItem)
                .navigationTitle("네비게이션 바 아이템")
            
        }
    }
}

#Preview {
    NavigationBar()
}
