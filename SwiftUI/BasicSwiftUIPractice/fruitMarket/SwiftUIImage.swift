//
//  SwiftUIImage.swift
//  fruitMarket
//
//  Created by Lia An on 11/17/24.
//

import SwiftUI

struct SwiftUIImage: View {
    var body: some View {
        HStack(spacing: 30) {
            // Scale to Fill (default)
            Image("smile").resizable().frame(width: 100, height: 100)
            
            
            Image("smile").resizable().renderingMode(.original).frame(width: 100, height: 150)
            
            
            Image("smile").resizable().renderingMode(.template).scaledToFill().frame(width: 100, height: 150).clipShape(Ellipse().path(in: CGRect(x: 10  , y: 10, width: 80, height: 110)))
        }.foregroundStyle(.red)
    }
}


#Preview {
    SwiftUIImage()
}
