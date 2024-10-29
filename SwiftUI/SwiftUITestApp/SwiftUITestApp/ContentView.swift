//
//  ContentView.swift
//  SwiftUITestApp
//
//  Created by Lia An on 10/29/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        VStack {
            Text("Hello, SwiftUI!")
                .foregroundStyle(.white)
                .bold()
                .padding()
                .background(.black)
            
            Button("I'm text button") {
                print("Text button Pressed")
            }
                .foregroundStyle(.white)
                .bold()
                .padding()
                .background(.blue)
                .padding(20)
                
            Button {
                print("Like button pressed")
            } label: {
                Image(systemName: "heart")
                    .resizable()
                    .frame(width: 100, height: 100)
            }.foregroundStyle(.white)
                .padding(10)
                .background(.green)
            Text("VStack is a vertical stack of views")
                .foregroundStyle(.white)
                .bold()
                .padding(20)
                .background(.pink)
                .padding(10)


        }
        HStack(alignment: .center) {
            Text("I'm HStack")
                .foregroundStyle(.red)
        }

    }
    
}

#Preview {
    ContentView()
}
