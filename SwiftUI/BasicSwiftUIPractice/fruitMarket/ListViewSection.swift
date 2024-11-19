//
//  ListViewSection.swift
//  fruitMarket
//
//  Created by Lia An on 11/17/24.
//

import SwiftUI

struct ListViewSection: View {
    var body: some View {
        let fruits = ["Apple", "Banana", "Orange", "Pear"]
        let drinks = ["Coke", "Pepsi", "Water"]
        let titles = ["Fruits", "Drinks"]
        let data = [fruits, drinks]
        
        return List {
            ForEach(data.indices) { index in
                Section (
                    header: Text(titles[index]).font(.title),
                    footer: HStack{ Spacer(); Text("\(data[index].count)건")}
                    ){
                        ForEach(data[index], id: \.self) {
                            Text($0)
                        }
                    }
                }
        }// .listStyle(InsetGroupedListStyle())
        // .listStyle(GroupedListStyle())
    }
}

#Preview {
    ListViewSection()
}
