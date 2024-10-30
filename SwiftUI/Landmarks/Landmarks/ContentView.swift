//
//  ContentView.swift
//  Landmarks
//
//  Created by Lia An on 10/30/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            MapView().frame(height: 300)
            CircleImage().offset(y: -130)
                .padding(.bottom, -130)
            VStack(alignment: .leading) {
                Text("Turtle Rock")
                    .font(.title.bold())
                
                HStack {
                    Text("Joshua Tree National Park")
                    Spacer()
                    Text("California")
                }.font(.subheadline)
                    .foregroundStyle(.secondary)
            }.padding()
            Spacer()
        }
    }
}

#Preview {
    ContentView()
}
