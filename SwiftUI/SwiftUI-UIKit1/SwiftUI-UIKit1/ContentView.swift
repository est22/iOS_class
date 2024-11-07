//
//  ContentView.swift
//  SwiftUI-UIKit1
//
//  Created by Lia An on 11/7/24.
//

import SwiftUI

struct ContentView: View {
    @State private var text: String = "https://naver.com"
    var body: some View {
        VStack {
            WebView(strURL: text)
            Button("Google") {
                text = "https://google.com"
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
