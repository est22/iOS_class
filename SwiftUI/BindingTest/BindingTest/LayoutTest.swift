//
//  LayoutTest.swift
//  BindingTest
//
//  Created by Lia An on 10/30/24.
//

import SwiftUI

struct LayoutTest: View {
    var body: some View {
        Text("Layout Test")
            .padding()
            .background(Color.red)
            .frame(width: 100, height: 100)
            .position(CGPoint(x: 100, y: 100))
    }
}

#Preview {
    LayoutTest()
}
