//
//  VStackView.swift
//  fruitMarket
//
//  Created by Lia An on 11/17/24.
//

import SwiftUI

struct VStackView: View {
    var body: some View {
        VStack{
        Spacer()
            Text("Spacer").font(.title).background(Color.red)
        }.background(Color.blue)
    }
}

#Preview {
    VStackView()
}
