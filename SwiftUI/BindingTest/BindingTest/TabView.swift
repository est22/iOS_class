//
//  TabView.swift
//  BindingTest
//
//  Created by Lia An on 10/30/24.
//

import SwiftUI

struct TabView: View {
    let items = ["Items1", "Items2", "Items3","Items4","Items5","Items6","Items7","Items8","Items9","Items10"]
    var body: some View {
        List{
            ForEach(items, id:\.self) { item in Text(item)}
        }.listStyle(.insetGrouped)
       
    }
}

#Preview {
    TabView()
}
