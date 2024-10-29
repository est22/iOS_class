//
//  ContentView.swift
//  StateTest
//
//  Created by Lia An on 10/29/24.
//

import SwiftUI

struct ContentView: View {
    private var wifiEnabled = true
    var body: some View {
        Text("Hello, World!")
        StateTestView(displayString: "Hello @State!")
        
    }
}

struct StateTestView: View {
    @State var displayString: String
    var body: some View {
        Text(displayString)
    }
    
}

#Preview {
    StateTestView(displayString: "Hello")
}
