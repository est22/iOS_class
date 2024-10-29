//
//  SampleView.swift
//  SwiftUITestApp
//
//  Created by Lia An on 10/29/24.
//

import SwiftUI

struct SampleView: View {
    var body: some View {
        ZStack {
            Text("Hello, ZStack!")
                .foregroundStyle(.black)
                .bold()
                .padding(50)
                .background(.yellow)

            
            Text("Another ZStack")
                .foregroundStyle(.black)
                .bold()
                .padding()
                .background(.red)
        }
    }
}

#Preview {
    ContentView()
    SampleView()
    
}
