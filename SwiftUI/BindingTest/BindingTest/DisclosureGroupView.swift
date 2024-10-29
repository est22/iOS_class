//
//  DisclosureGroupView.swift
//  BindingTest
//
//  Created by Lia An on 10/29/24.
//

import SwiftUI

struct DisclosureGroupView: View {
    @State private var isExpanded = false
    @State private var isWatching = false
    @State private var isHearing = false
    var body: some View {
        List {
            DisclosureGroup("펼치기", isExpanded: $isExpanded) {
                Toggle("보기", isOn: $isWatching)
                Toggle("소리 듣기", isOn: $isHearing)
            }.padding()
        }
    }
}

#Preview {
    DisclosureGroupView()
}
